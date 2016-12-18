<?php

namespace App\Model;

use App\Model\BaseManager;

class ProductManager extends BaseManager
{
    const TABLE_NAME = 'products',
          COLUMN_ID = 'id',
          TABLE_NAME_IMGS = 'product_imgs';
    /**
     * Výpis všech produktů v databázi
     * @return type
     */
    public function getProducts(){
        return $this->database->table(self::TABLE_NAME)->order(self::COLUMN_ID . ' DESC');
    }
    /**
     * Zobrazení daného produktu podle jeho id
     * @param type $id
     * @return type
     */
    public function getProduct($id){
        return $this->database->table(self::TABLE_NAME)->where(self::COLUMN_ID, $id)->fetch();
    }
    /**
     * Vytvořím nový produkt. Když nebude mít ID, tak se vloží produkt
     * @param type $product
     */
    public function saveProduct($product){
        if(!$product[self::COLUMN_ID]){
            $this->database->table(self::TABLE_NAME)->insert($product);
        }else{
            $this->database->table(self::TABLE_NAME)->where(self::COLUMN_ID, $product[self::COLUMN_ID])->update($product);
            //dump($product);
        }
    }
    
    public function saveImages($product_code, $name, $size)
    {
        $this->database->query("INSERT INTO product_imgs(product_code,name,size) VALUES ('".$product_code."','".$name."','".$size."')");
    }

    /**
     * Odstraním produkt podle jeho id
     * @param type $id
     */
    public function removeProduct($id){
        $this->database->table(self::TABLE_NAME)->where(self::COLUMN_ID, $id)->delete();
    }

    /**
     * ziskej z  databaze 3 nejnovejsi produkty
     * @return array|\Nette\Database\IRow[]|\Nette\Database\ResultSet
     */
    public function getNewsProducts()
    {
        return $this->database->table(self::TABLE_NAME)->where('dostupnost <> 0')->order('created_at DESC')->limit('3')->fetchAll();
    }

    public function getSalesProducts()
    {
        return $this->database->table(self::TABLE_NAME)->where('akce <> 0 AND dostupnost <> 0')->order('nazev ASC')->limit('3')->fetchAll();
    }


}

