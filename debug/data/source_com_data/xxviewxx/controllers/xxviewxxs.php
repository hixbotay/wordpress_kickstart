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

class XxoptionxxControllerXxviewxxs extends JControllerAdmin
{
	public function getModel($name = 'Xxviewxx', $prefix = 'XxoptionxxModel', $config = array('ignore_request' => true))
	{
		$model = parent::getModel($name, $prefix, $config);
		return $model;
	}
	
}