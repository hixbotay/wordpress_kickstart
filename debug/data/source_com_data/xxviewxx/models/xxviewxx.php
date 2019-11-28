<?php

/**
 * @package 	Xxoptionxx
* @author 		Vuong Anh Duong
* @link 		http://freelancerviet.net
* @copyright 	Copyright (C) 2011 - 2012 Vuong Anh Duong
* @license 	GNU/GPLv3 http://www.gnu.org/licenses/gpl-3.0.html
* @version 	$Id: airport.php 66 2012-07-31 23:46:01Z quannv $
**/


defined('_JEXEC') or die;

class XxoptionxxModelXxviewxx extends JModelAdmin{
	protected $text_prefix = 'COM_XXOPTIONXX';
	
	public function getTable($type = 'Xxviewxx', $prefix = 'Table', $config=array()){
		return JTable::getInstance($type, $prefix, $config);
	}
	
	public function getForm($data = array(), $loadData = true){
		$app = JFactory::getApplication();
		//get data from Form
		$form = $this->loadForm('com_xxoptionxx.xxviewxx','xxviewxx', array('control'=> 'jform', 'load_data'=>$loadData));
		if (empty($form)){
			return false;
		}
	
		return $form;
	}
	
	public function save($data){
		return parent::save($data);
	}
	
	protected function loadFormData(){
		$data = JFactory::getApplication()->getUserState('com_xxoptionxx.edit.xxviewxx.data', array());
	
		if(empty($data)){
			$data = $this->getItem();
		}
	
		return $data;
	}
}