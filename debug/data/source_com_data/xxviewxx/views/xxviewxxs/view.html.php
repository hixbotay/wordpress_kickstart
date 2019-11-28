<?php
/**
 * 
 * @package 	Xxoptionxx
 * @author 		Vuong Anh Duong
 * @link 		http://freelancerviet.net
 * @copyright 	Copyright (C) 2011 - 2012 Vuong Anh Duong
 * @license 	GNU/GPLv3 http://www.gnu.org/licenses/gpl-3.0.html
 * @version 	$Id$
 **/

defined( '_JEXEC' ) or die( 'Direct Access to this location is not allowed.' );

class XxoptionxxViewXxviewxxs extends JViewLegacy{
	
	protected $items;
	protected $state;
	protected $pagination;
	
	public function display($tpl = null){
		$this->items = $this->get('Items');
		$this->state = $this->get('State');
		$this->pagination = $this->get('Pagination');
		
		if (count($error = $this->get('Errors'))){
			BookProHelper::raiseError( implode( $error,"\n"));
			return false;
		}
		
		$this->addToolbar();
		parent::display($tpl);
	}
	
	protected function addToolbar(){
		XxoptionxxHelper::setSubmenu(1);
		JToolbarHelper::title(JText::_('COM_XXOPTIONXX_XXVIEWXX_MANAGER'),'cube');
		JToolbarHelper::addNew('xxviewxx.add');
		JToolbarHelper::editList('xxviewxx.edit');
		JToolbarHelper::publish('xxviewxxs.publish', 'JTOOLBAR_PUBLISH', true);
		JToolbarHelper::unpublish('xxviewxxs.unpublish', 'JTOOLBAR_UNPUBLISH', true);
		JToolbarHelper::deleteList('','xxviewxxs.delete','JTOOLBAR_DELETE', true);
	}
	
	protected function getSortFields()
	{
		return array(
			'a.state'=> JText::_('JSTATUS'),
			'a.code' => Jtext::_('Code'),
			'a.title' => JText::_('JGLOBAL_TITLE'),
			'a.seat' => JText::_('COM_XXOPTIONXX_SEAT'),
			'a.ordering' => JText::_('COM_XXOPTIONXX_ORDER'),
		);
	}
}