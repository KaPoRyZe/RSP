<?php

namespace AdminModule;

use App\Presenters\BasePresenter;
use App\Model\UserManager;
use Nette\Application\UI\Form;
use Nette\Security\User;

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
        $form->addText('username', 'Uživatelské jméno')->setRequired();
        $form->addPassword('password', 'Heslo')->setRequired();
        $form->addCheckbox('remember', 'Zůstat přihlášen.');
        $form->addSubmit('submit', 'Přihlásit se');
        $form->onSuccess[] = array($this, 'loginFormSucceeded');
        
        return $form;
    }
    public function loginFormSucceeded($form, $values){
        if($values->remember){
            // přihlášení vyprší po 30 minutách neaktivity nebo zavření prohlížeče
            $this->user->setExpiration('30 minutes', TRUE);
        } else{
            $this->user->setExpiration(0, TRUE);
        }
        try{
            //TODO
            $this->user->login($values->username, $values->password);
            $this->flashMessage('Byl jste přihlášen', 'success');
            $this->redirect('Administrator:');
        } catch (\Nette\Security\AuthenticationException $ex) {
            $this->flashMessage($ex->getMessage(), 'validation');
        }
    }
    public function createComponentRegisterForm(){
        $form = new Form;
        $form->addText('username', 'Uživatelské jméno')->setRequired();
        $form->addPassword('password', 'Heslo :*', 20)
                ->setOption('description', 'Alespon 6 znaků')
                ->setRequired();
        $form->addPassword('password2', 'Heslo znovu :*', 20)
                ->addConditionOn($form['password'], Form::VALID)
                ->addRule(Form::FILLED, 'Heslo znovu')
                ->addRule(Form::EQUAL, 'Hesla se neshodují.', $form['password']);
        $form->addSubmit('submit','Registrovat');
        $form->onSuccess[] = array($this, 'registerFormSucceeded');
        
        return $form;
    }
    public function registerFormSucceeded($form, $values){
        try{
            //TODO
            $this->userManager->add($values->username, $values->password);
            
            $this->flashMessage('Byl jste zaregistrován', 'success');
            $this->redirect('Sign:in');
        } catch (\Nette\Security\AuthenticationException $ex) {
            $this->flashMessage($ex->getMessage(), 'validation');
        }
    }
    public function actionOut() {
        $this->getUser()->logout();
        $this->flashMessage('Odhlášení bylo úspěšné.');
        $this->redirect(':Front:Homepage:');
    }

}
