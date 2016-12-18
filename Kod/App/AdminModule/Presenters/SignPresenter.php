<?php

namespace AdminModule;

use App\Presenters\BasePresenter;
use App\Model\UserManager;
use Nette\Security\User;
use App\Model\DuplicateNameException;
use Nette\Application\UI\Form;
use Nextras\Forms\Rendering\Bs3FormRenderer;

class SignPresenter extends BasePresenter
{
    protected $userManager;
    protected $user;
    
    public function __construct(UserManager $userManager, User $user) {
        parent::__construct();
        $this->userManager = $userManager;
        $this->user = $user;
    }

    public function createComponentLoginForm() {
        $form = new Form;
        $form->setRenderer(new Bs3FormRenderer());
        $form->addText('username', 'Uživatelské jméno')
                ->addRule(Form::FILLED, 'Zadejte uživatelské jméno');
        $form->addPassword('password', 'Heslo')
                ->addRule(Form::FILLED, 'Zadejte heslo');
        $form->addCheckbox('remember', 'Zůstat přihlášen.');
        $form->addSubmit('submit', 'Přihlásit se');
        $form->onSuccess[] = array($this, 'loginFormSucceeded');
        
        return $form;
    }
    public function loginFormSucceeded(Form $form){
        $values = $form->getValues();
    
         if ($values->remember) {
                // přihlášení vyprší po 30 minutách neaktivity nebo zavření prohlížeče
                $this->user->setExpiration('30 minutes', TRUE);
            } else {
                $this->user->setExpiration(0, TRUE);
            }
        
        try
        {            
            $this->user->login($values->username, $values->password);
            $this->flashMessage('Byl jste přihlášen', 'success');
            $this->redirect('Administrator:');
        } 
        catch (\Nette\Security\AuthenticationException $ex) 
        {
            $this->flashMessage($ex->getMessage(), 'validation');
        }
    }
    public function createComponentRegisterForm(){
        $form = new Form;
        $form->setRenderer(new Bs3FormRenderer());
        $form->addText('username', 'Uživatelské jméno')
                ->addRule(Form::FILLED, 'Zadejte uživatelské jméno');
        $form->addPassword('password', 'Heslo :*', 20)
                ->setAttribute('placeholder', 'min. 6 znaků')
                ->addRule(Form::FILLED, 'Zvolte si heslo')
                ->addRule(Form::MIN_LENGTH, 'Zadané heslo je příliš krátké, zvolte si heslo alespoň o %d znacích', 6);
        $form->addPassword('password2', 'Heslo znovu :*', 20)
                ->addConditionOn($form['password'], Form::VALID)
                ->addRule(Form::FILLED, 'Zadejte heslo ještě jednou pro kontrolu')
                ->addRule(Form::EQUAL, 'Hesla se neshodují.', $form['password']);
        $form->addSubmit('submit','Registrovat');
        $form->onSuccess[] = array($this, 'registerFormSucceeded');
        
        return $form;
    }
    public function registerFormSucceeded(Form $form){
        try{
            $values = $form->getValues();
            $this->userManager->add($values->username, $values->password);
            
            $this->flashMessage('Byl jste zaregistrován', 'success');
            $this->redirect('Sign:in');
        } catch(DuplicateNameException $ex) {
            $this->flashMessage('Uživatelské jméno již existuje', 'warning');
        }
    }
    public function actionOut() {
        $this->getUser()->logout();
        $id = $this->getUser()->getId();
        $this->userManager->updateLastAccess($id);
        $this->flashMessage('Odhlášení bylo úspěšné.');
        //$this->redirect(':Front:Homepage:');
        $this->redirect('Administrator:');
    }

}
