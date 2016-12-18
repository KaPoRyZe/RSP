<?php
/**
 * User: Frantisek Kasa <frantisekkasa@gmail.com>
 * Date: 06.10.2016
 * Project: becreate
 * File: MenuManager.php
 */


namespace App\Model;

use App\Model\BaseManager;
use Nette\Database\Table\Selection;

class MenuManager extends BaseManager
{
    /**
     * vypiš menu, které obsahuje nějaký článek
     * @return array|\Nette\Database\IRow[]|\Nette\Database\ResultSet
     */
    public function getMenus()
    {
        $context = $this->database;
        $selection = $context->query('SELECT DISTINCT `articles`.`menu_id`, `menu`.* FROM `menu` JOIN `articles` ON `menu`.`id` = `articles`.`menu_id`')->fetchAll();

        return $selection;
    }

    /**
     * ziskame vsechny polozky menu
     * @return array|\Nette\Database\IRow[]|\Nette\Database\ResultSet
     */
    public function getPolozkyMenu()
    {
        $context = $this->database;
        $selection = $context->query('SELECT * FROM `menu` ORDER BY `menu`.`order` DESC')->fetchAll();

        return $selection;
    }

    /**
     * ziskam polozku menu
     * @param $id int
     * @return bool|mixed|\Nette\Database\Table\IRow
     */
    public function getPolozkaMenu($id)
    {
        return $this->database->table('menu')->where('id', $id)->fetch();
    }

    /**
     * ulozim nebo edituji polozku menu
     * @param $polozka array
     */
    public function savePolozkyMenu($polozka)
    {
        if (!$polozka['id'])
        {
            $this->database->table('menu')->insert($polozka);
        }
        else
        {
            $this->database->table('menu')->where('id', $polozka['id'])->update($polozka);
        }
    }

    /**
     * odstraneni polozky menu
     * @param $id
     */
    public function deletePolozkyMenu($id)
    {
        $this->database->table('menu')->where('id', $id)->delete();
    }
}