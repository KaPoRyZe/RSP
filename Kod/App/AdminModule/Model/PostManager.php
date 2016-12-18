<?php

/**
 * Description
 *
 * @author František Kaša <frantisekkasa@gmail.com>
 * @date 18.12.2016
 * 
 * @project sandbox
 * @name PostManager
 */

namespace App\Model;

use App\Model\BaseManager;

class PostManager extends BaseManager 
{
    public function getCountPosts()
    {
        return $this->database->table('posts')->count();
    }
}
