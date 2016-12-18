<?php

/**
 * Description
 *
 * @author František Kaša <frantisekkasa@gmail.com>
 * @date 18.12.2016
 * 
 * @project sandbox
 * @name UserPresenter
 */

namespace AdminModule;

use App\Model\UserManager;
use App\Presenters\BasePresenter;
use Nette\Application\UI\Form;
use Nette\Neon\Exception;

class UserPresenter extends BasePresenter
{
    /** @var App\Model\UserManager */
    protected $userManager;
    
    public function __construct(UserManager $userManager) {
        parent::__construct();
        $this->userManager = $userManager;
    }
    
    public function renderDefault()
    {
        $this->template->users = $this->userManager->getUsers();
    }
    
    


    public function createComponentEditForm()
    {
        $form = new Form();
        $form->addHidden('id');
        $form->setRenderer(new \Nextras\Forms\Rendering\Bs3FormRenderer());
        $form->addText('username', 'Uživatelské jméno:');
        $form->addText('email', 'Email:')->setType('email');
        $form->addSelect('role', 'Role uživatele', ['guest' => 'guest' ,'admin' => 'admin'] );
        $form->addSubmit('edit', 'Editovat');
        
        $form->onSubmit[] = array($this, 'editFormSucceeded');
        $form->onError[] = $this->editFormSucceeded;
        
        return $form;
    }
    
    public function editFormSucceeded(Form $form)
    {
        $values = $form->getValues(true);
        
        try {
            $this->userManager->updateUser($values);
            $this->flashMessage('Uživatel byl úspěšně upraven.', 'success');
            $this->redirect('default');
        } catch (Exception $ex) {
            $this->flashMessage($ex->getMessage());
        }
    }

    public function actionEdit($id = 0)
    {       
        
        $user = $this->userManager->getUser($id);
      
        if ($user)
        {
             $this['editForm']->setDefaults($user);
        }
        else
        {
            throw new \Nette\Application\BadRequestException;
        }
    }
    
    public function actionDelete($id)
    {
        $this->userManager->removeUser($id);
        $this->flashMessage('Uživatel byl úspěšně odstraněn.', 'success');
        $this->redirect('User:');
        
    }

}
