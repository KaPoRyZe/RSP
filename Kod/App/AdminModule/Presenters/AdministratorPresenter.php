<?php

namespace AdminModule;

use App\Presenters\BasePresenter;

/**
 * Zpracovává vykreslování administrační sekce.
 * @package App\CoreModule\Presenters
 */
class AdministratorPresenter extends BasePresenter
{
    public function beforeRender() {
        parent::beforeRender();
        $this->setLayout('layout');
    }
    
    /*public function renderDefault(){
        if(!$this->getUser()->isLoggedIn()){
            $this->redirect('Sign:in');             
        }
    }*/
}