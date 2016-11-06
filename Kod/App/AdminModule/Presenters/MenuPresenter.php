<?php
/**
 * User: Frantisek Kasa <frantisekkasa@gmail.com>
 * Date: 06.11.2016
 * Project: becreate
 * File: MenuPresenter.php
 */


namespace AdminModule;

use App\Model\MenuManager;
use App\Presenters\BasePresenter;
use Nette\Application\BadRequestException;
use Nette\Application\UI\Form;
use Nette\Neon\Exception;

class MenuPresenter extends BasePresenter
{
    protected $menuManager;

    public function __construct(MenuManager $menuManager)
    {
        parent::__construct();
        $this->menuManager = $menuManager;

    }

    /**
     * vykresleni polozek menu
     * @throws BadRequestException
     */
    public function renderDefault()
    {
        $menus = $this->menuManager->getPolozkyMenu();

        if (!empty($menus))
        {
            $this->template->menus = $menus;
        }
        else
        {
            throw new BadRequestException();
        }
    }

    /**
     * vykresli polozku menu
     * @param int $id
     * @throws BadRequestException
     */
    public function renderShow($id = 0)
    {
        $menu = $this->menuManager->getPolozkaMenu($id);

        if (!empty($menu))
        {
            $this->template->menu = $menu;
        }
        else
        {
            throw new BadRequestException();
        }
    }

    /**
     * formulář pro přidání nebo úpravu
     * @return Form
     */
    public function createComponentMenuForm()
    {
       $form = new Form();

        $form->addHidden('id');
        $id = $this->getParameter('id');
        $form->addText('name','Název položky:* ')->setRequired();
        $form->addText('url', 'URL položky:* ')->setRequired();
        $form->addSubmit('submit', (!empty($id)) ? 'Upravit' : 'Přidat');

        $form->onSuccess[] = array($this, 'menuFormSucceeded');
        $form->onError[] = $this->menuFormSucceeded;

        return $form;
    }

    /**
     * provedení přidání nebo úpravy položky menu
     * @param Form $form
     */
    public function menuFormSucceeded(Form $form)
    {
        $values = $form->getValues();
        $id = $this->getParameter('id');
        try
        {
            $this->menuManager->savePolozkyMenu($values);
            if (!empty($id))
            {
                $this->flashMessage('Položka menu byla úspěšně upravena.', 'success');
            }
            else
            {
                $this->flashMessage('Položka menu byla úspěšně přidaná.', 'success');
            }
            $this->redirect('Menu:');
        }
        catch (Exception $ex)
        {
            $this->error($ex);
        }
    }

    /**
     * naplneni formulare daty
     * @param int $id
     * @throws BadRequestException
     */
    public function actionEdit($id = 0)
    {
        $polozka = $this->menuManager->getPolozkaMenu($id);

        if( !empty($polozka))
        {
            $this['menuForm']->setDefaults($polozka);
        }
        else
        {
            throw new BadRequestException();
        }
    }

    /**
     * odstranění položky menu
     * @param int $id
     */
    public function actionRemove($id = 0)
    {
        $this->menuManager->deletePolozkyMenu($id);
        $this->flashMessage('Položka menu byla odstraněna.', 'info');
        $this->redirect('Menu:');
    }
}