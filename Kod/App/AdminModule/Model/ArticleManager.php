<?php

namespace App\Model;

use App\Model\BaseManager;
use Nette\Database\Table\IRow;
use Nette\Database\Table\Selection;
use Nette\Utils\ArrayHash;

/**
 * Třída poskytuje metody pro správu článků v redakčním systému.
 * @package App\CoreModule\Model
 */
class ArticleManager extends BaseManager
{
        /** Konstanty pro manipulaci s modelem. */
        const
                TABLE_NAME = 'articles',
                COLUMN_ID = 'article_id',
                COLUMN_CREATED = 'created_at';

        /**
         * Vrátí seznam článků v databázi.
         * @return Selection seznam článků
         */
        public function getArticles()
        {
                return $this->database->query('SELECT `articles`.`article_id`,`articles`.`title`,`articles`.`content`,`articles`.`description`,`articles`.`created_at` AS `titlePage` FROM `articles` ORDER BY `articles`.`created_at` DESC')->fetchAll();
        }

        /**
         * Vrátí článek z databáze podle jeho ID.
         * @param string $url ID článku
         * @return bool|mixed|IRow první článek, který odpovídá ID nebo false při neúspěchu
         */
        public function getArticle($id)
        {
                return $this->database->table(self::TABLE_NAME)->where(self::COLUMN_ID, $id)->fetch();
        }

        /**
         * Uloží článek do systému. Pokud není nastaveno ID, vloží nový, jinak provede editaci.
         * @param array|ArrayHash $article článek
         */
        public function saveArticle($article)
        {
            if(!$article[self::COLUMN_ID]){
                $this->database->table(self::TABLE_NAME)->insert($article);
            }else{
                $this->database->table(self::TABLE_NAME)->where(self::COLUMN_ID, $article[self::COLUMN_ID])->update($article);
            }
        }

        /**
         * Odstraní článek.
         * @param string $url URL článku
         */
        public function removeArticle($id)
        {
                $this->database->table(self::TABLE_NAME)->where(self::COLUMN_ID, $id)->delete();
        }

        public function getArticlePodleMenu($menu_id)
        {
            $selection = $this->database->query('SELECT * FROM `articles` JOIN `menu` ON `articles`.`menu_id` = `menu`.`id`')->fetchAll();
            return $selection;
        }
}
