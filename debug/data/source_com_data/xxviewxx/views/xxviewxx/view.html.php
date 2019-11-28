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

class XxoptionxxViewXxviewxx extends JViewLegacy{
	protected $item;
	protected $form;
	
	public function display($tpl=null){
		$this->item = $this->get('Item');
		$this->form = $this->get('Form');
		
		if (count($errors = $this->get('Errors'))){
			BookProHelper::raiseError( implode("\n", $errors));
			return false;
		}
		
		$this->addToolbar();
		parent::display($tpl);
	}
	
	protected function addToolbar(){
		JFactory::getApplication()->input->set('hidemainmenu', true);
		$edit		= $this->item->id;
		$text = !$edit ? JText::_( 'JTOOLBAR_NEW' ) : JText::_( 'JACTION_EDIT' );
		JToolbarHelper::title(JText::_('COM_XXOPTIONXX_XXVIEWXX_MANAGER').': '.$text);
		JToolbarHelper::apply('xxviewxx.apply');
		JToolbarHelper::save('xxviewxx.save');
	
		if(empty($this->item->id)){
			JToolbarHelper::cancel('xxviewxx.cancel');
		}
		else{
			JToolbarHelper::cancel('xxviewxx.cancel', 'JTOOLBAR_CLOSE');
		}
	
	}
	
	
}

?>