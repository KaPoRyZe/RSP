<?php

namespace AdminModule;

use App\Model\ArticleManager;
use App\Presenters\BasePresenter;
use Nette\Application\BadRequestException;
//use Nette\Application\UI\Form;
use Nette\Forms\Form;
use Nextras\Forms\Controls;
use Nette\Database\UniqueConstraintViolationException;
use Nette\Utils\ArrayHash;

/**
 * Zpracovává vykreslování článků.
 * @package App\CoreModule\Presenters
 */
class ArticlePresenter extends BasePresenter
{
    /** @var ArticleManager Instance třídy modelu pro práci s články. */
    protected $articleManager;
    
    /**
     * Konstruktor s injektovaným modelem pro práci s články.
     * @param ArticleManager $articleManager automaticky injektovaná třída modelu pro práci s články
     */
    public function __construct(ArticleManager $articleManager) 
    {
        parent::__construct();
        $this->articleManager = $articleManager;
    }
    
    /** Načte a vykreslí článek článek do šablony podle jeho URL.
     * @param string $url URL článku
     * @throws BadRequestException Jestliže článek s danou URL nebyl nalezen.
     */
    public function renderDefault()
    {
        $articles = $this->articleManager->getArticles();
        //dump($articles);
        //exit();

        if (!empty($articles))
        {
            $this->template->articles = $articles;
        }
        else
        {
            throw new BadRequestException();
        }
    }
    
    /** Vykreslí seznam článků do šablony. */
    public function renderShow($id = 0)
    {
        $article = $this->articleManager->getArticle($id);

        if (!empty($article))
        {
            // Předá článek do šablony.
            $this->template->article = $article;
        }
        else
        {
            throw new BadRequestException();
        }
    }
    
    /**
     * Odstraní článek.
     * @param string $id
     */
    public function actionRemove($id)
    {
        $this->articleManager->removeArticle($id);
        $this->flashMessage('Článek byl úspěšně odstraněn.');
        $this->redirect('Article:default');
    }
    
    /**
     * Vykresluje editaci článku podle jeho ID.
     * @param string $id ID článku, který editujeme, pokud není zadána, vytvoří se nový
     */
    public function actionEdit($id)
    {
        $article = $this->articleManager->getArticle ($id);
        // Pokud ma id, pokusí se článek načíst a předat jeho hodnoty do editačního formuláře, jinak vypíše chybovou hlášku.
        if($id)
        {
            ($article) ? $this['editorForm']->setDefaults($article) : $this->flashMessage ('Článek nebyl nalezen.');
        }
    }
    
    /**
     * Vrátí formulář pro editor článků.
     * @return Form formulář pro editor článků
     */
    public function createComponentEditorForm() 
    {
        //TODO nefunguje id
        $id = $this->getParameter('article_id');
        $form = new Form;
        $form->addHidden('article_id');
        $form->addText('title', 'Titulek:')->setRequired('Vyplnte titulek článku.');
        $form->addText('description', 'Popisek:');
        $form->addTextArea('content', 'Obsah:')
            ->setAttribute('class', '');
        $form->addSubmit('submit', $id > 0 ? 'Upravit' : 'Uložit');
        $form->onSuccess[] = array($this, 'editorFormSucceeded');
        
        return $form;
    }
    
    /**
     * Funkce se vykonaná při úspěsném odeslání formuláře; zpracuje hodnoty formuláře.
     * @param Form $form formulář editoru
     * @param ArrayHash $values odeslané hodnoty formuláře
     */
    public function editorFormSucceeded($form, $values)
    {
        try
        {
            $id = $this->getParameter('article_id');
            $this->articleManager->saveArticle($values);
            if(!$id)
                $this->flashMessage('Článek byl úspěšně uložen.');
            else
                $this->flashMessage('Článek byl úspěšně upraven.');
            
            $this->redirect('Article:default');
        } catch (UniqueConstraintViolationException $ex) {
            $this->flashMessage('Článek s touto ID již existuje.');
        }
    }
}
