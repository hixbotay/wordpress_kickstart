<?php

/**
 * @package 	FVN-extension
 * @author 		Vuong Anh Duong
 * @link 		http://freelancerviet.net
 * @copyright 	Copyright (C) 2011 - 2012 Vuong Anh Duong
 * @license 	GNU/GPLv3 http://www.gnu.org/licenses/gpl-3.0.html
 * @version 	$Id: defines.php 104 2012-08-29 18:01:09Z quannv $
 **/

defined('_JEXEC') or die('Restricted access');
ini_set('memory_limit', '-1');
ini_set('max_execution_time', 20000);
ini_set('display_errors', 1);
//error_reporting(E_ALL);
include 'vendor/autoload.php';


if(!defined('JPATH_BASE'))
	define('JPATH_BASE', dirname(dirname(__FILE__)));
define('JPATH_ROOT', __DIR__);
require_once JPATH_ROOT . '/lib/classes/object.php';
require_once JPATH_ROOT . '/lib/classes/controller.php';
require_once JPATH_ROOT . '/lib/classes/juri.php';
require_once JPATH_ROOT . '/lib/factory.php';
require_once JPATH_ROOT . '/lib/application.php';



define('JPATH_COMPONENT', JPATH_ROOT.'');
define('JPATH_ADMINISTRATOR', JPATH_BASE.'/administrator');

include (JPATH_ROOT.'/helpers/importer.php');
AImporter::helper('helper','table','basic');
AImporter::table('jtable');


