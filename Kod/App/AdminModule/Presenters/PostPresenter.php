<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace AdminModule;

use Nette,
    Nette\Application\UI\Form,
    App\Presenters\BasePresenter;


class PostPresenter extends BasePresenter
{
    /** @var Nette\Database\Context */
    private $database;

    public function __construct(Nette\Database\Context $database)
    {
        $this->database = $database;
    }
    
    public function renderDefault() {
        /*if(!$this->getUser()->isLoggedIn()){
            $this->redirect('Sign:in'); 
        }else{*/
            $this->template->posts = $this->database->table('posts')
                ->order('created_at DESC')
                ->limit(5);
        //dump('aasdasdasda');
        
    }

    /*
     * Kontrola ID příspěvku
     * render se používá pro vložení dat do šablon
     */
    public function renderShow($postId)
    {        
        $post = $this->database->table('posts')->get($postId);
        if (!$post) {
            $this->error('Stránka nebyla nalezena.');
        }
        //Vykreslování komentářů
        $this->template->post = $post;
        $this->template->comments = $post->related('comment')->order('created_at');
    }
    /*
     * Formulář pro ukládání příspěvků
     */
    protected function createComponentPostForm()
    {
        $form = new Form;
        
        $form->addText('title', 'Titulek')->setRequired('Vložte titulek příspěvku.');
        $form->addTextArea('content', 'Obsah: ')->setRequired('Vložte obsah příspěvku.');
        $form->addSubmit('send','Uložit a publikovat');
        $form->onSuccess[] = array($this, 'postFormSucceeded');
        
        return $form;
    }
    
    /*
     *  přesměruje nepřihlášené uživatele na formulář 
     */
    public function actionCreate() 
    {
       /* if (!$this->getUser()->isLoggedIn()) {
            $this->redirect('Sign:in');
        }*/
    }

    /*
     * Úprava příspěvků
     */
    public function actionEdit($postId) 
    {
        
        /*if (!$this->getUser()->isLoggedIn()) {
            $this->redirect('Sign:in');
        }*/
               
        $post = $this->database->table('posts')->get($postId);
        if (!$post) {
            $this->error('Příspěvek nebyl nalezen');
        }
        $this['postForm']->setDefaults($post->toArray());
    }

    /*
     * Ukládání nového příspěvku z formuláře
     */
    public function postFormSucceeded($form, $values)
    {
        /*if (!$this->getUser()->isLoggedIn()) {
            $this->error('Pro vytvoření, nebo editování příspěvku se musíte přihlásit.');
        }*/
        
        $postId = $this->getParameter('postId');
        
        if($postId) {
            $post = $this->database->table('posts')->get($postId);
            $post->update($values);
        }else {
            $post = $this->database->table('posts')->insert($values);
        }
        
        $this->flashMessage("Příspěvek byl úspěšně publikován.", 'success');
        //přesměruje na daný příspěvek
        $this->redirect('show', $post->id);
    }
    /*
     * Formulář pro komentování
     */
    protected function createComponentCommentForm()
    {
        $form = new Form;

        $form->addText('name', 'Jméno:')
            ->setRequired('Zadejte jméno.');

        $form->addText('email', 'Email:');

        $form->addTextArea('content', 'Komentář:')
            ->setRequired('Vložte komentář.');

        $form->addSubmit('send', 'Publikovat komentář');
        
        $form->onSuccess[] = array($this, 'commentFormSucceeded');

        return $form;
    }
    /*
     * Ukládání do databáze
     */
    public function commentFormSucceeded($form, $values) {
        $postId = $this->getParameter('postId');

        $this->database->table('comments')->insert(array(
            'post_id' => $postId,
            'name' => $values->name,
            'email' => $values->email,
            'content' => $values->content,
        ));

        $this->flashMessage('Děkuji za komentář', 'success');
        $this->redirect('this');
    }
    
    public function actionRemove($id)
    {
        $post = $this->database->table('posts')->where('id',$id)->delete();
        
        if($post)
        {
            $this->flashMessage("Komentář byl úspěšně smazán.","success");
            $this->redirect("Post:");
        }
        
    }
}