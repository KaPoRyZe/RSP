<?php

namespace AdminModule;

use App\Presenters\BasePresenter;
use AdminModule\PostPresenter;

/**
 * Zpracovává vykreslování administrační sekce.
 * @package App\CoreModule\Presenters
 */
class AdministratorPresenter extends BasePresenter
{
    
    /** @var \App\Model\ProductManager @inject */
    public $productManager;
    /** @var \App\Model\ArticleManager @inject */
    public $articleManager;
    /** @var \App\Model\PostManager @inject */
    public $postManager;
    
    public function startup()
    {
        parent::startup();
        if (!$this->getUser()->isLoggedIn())
        {
            $this->redirect('Sign:in');
        }
    }

    public function beforeRender()
    {
        parent::beforeRender();
        $this->setLayout('layout');
        
        $this->template->countproduct = count($this->productManager->getProducts());
        $this->template->countarticle = count($this->articleManager->getArticles());
        $this->template->countpost = $this->postManager->getCountPosts();
        
        
    }
    
}