<?php

namespace App\Model;

use Nette;
use Nette\Security\Passwords;
use App\Model\BaseManager;
use Nette\Utils\DateTime;


/**
 * Users management.
 */
class UserManager extends BaseManager implements Nette\Security\IAuthenticator
{
	const
		TABLE_NAME = 'users',
		COLUMN_ID = 'id',
		COLUMN_NAME = 'username',
		COLUMN_PASSWORD_HASH = 'password',
		COLUMN_ROLE = 'role',
                COLUMN_DATE = 'last_access';


	/**
	 * Performs an authentication.
	 * @return Nette\Security\Identity
	 * @throws Nette\Security\AuthenticationException
	 */
	public function authenticate(array $credentials)
	{            
		list($username, $password) = isset($credentials) ? $credentials : null;

		$row = $this->database->table(self::TABLE_NAME)->where(self::COLUMN_NAME, $username)->fetch();

		if (!$row) {
			throw new Nette\Security\AuthenticationException('Uživatelské jméno je nesprávné.', self::IDENTITY_NOT_FOUND);

		} elseif (!Passwords::verify($password, $row[self::COLUMN_PASSWORD_HASH])) {
			throw new Nette\Security\AuthenticationException('Heslo je nesprávné.', self::INVALID_CREDENTIAL);

		} elseif (Passwords::needsRehash($row[self::COLUMN_PASSWORD_HASH])) {
			$row->update(array(
				self::COLUMN_PASSWORD_HASH => Passwords::hash($password),
			));
		}

		$arr = $row->toArray();
		unset($arr[self::COLUMN_PASSWORD_HASH]);
		return new Nette\Security\Identity($row[self::COLUMN_ID], $row[self::COLUMN_ROLE], $arr);
	}


	/**
	 * Adds new user.
	 * @param  string
	 * @param  string
	 * @return void
	 */
	public function add($username, $password)
	{
           
            $usersname = $this->database->query('SELECT username FROM users')->fetchPairs(); 

            if ( isset($usersname) )
            {
                if (in_array($username, $usersname))
                {
                    throw new DuplicateNameException('Uživatelské jméno již exituje.', self::USERNAME);
                }  
                
                return $this->database->table(self::TABLE_NAME)->insert(array(
                            self::COLUMN_NAME => $username,
                            self::COLUMN_PASSWORD_HASH => Passwords::hash($password),
                        ));
            }                      
           
	}
        
        /**
         * ziskani vsech uzovatelu
         * @return array
         */
        public function getUsers()
        {
            return $this->database->table(self::TABLE_NAME)->order(self::COLUMN_NAME)->fetchAll();
        }
        
        /**
         * ziskani jednoho uzivatele
         * @param int $id
         * @return object
         */
        public function getUser($id)
        {
            return $this->database->table(self::TABLE_NAME)->where(self::COLUMN_ID, $id)->fetch();
        }
        
        /**
         * aktualizace datumu po odhlaseni uzivatele
         * @param int $id
         * @return object
         */
        public function updateLastAccess($id)
        {
            $date = new DateTime();
           
            return $this->database->query('UPDATE users SET last_access = "' .  $date->format('Y-m-d H:i:s') . '" where id = ' . $id);
        }
        
        public function updateUser($user)
        {
            return $this->database->table(self::TABLE_NAME)->where(self::COLUMN_ID, $user[self::COLUMN_ID])->update($user);
        }
        
        public function removeUser($id)
        {
            return $this->database->table(self::TABLE_NAME)->where(self::COLUMN_ID, $id)->delete();
        }

}



class DuplicateNameException extends \Exception
{}
