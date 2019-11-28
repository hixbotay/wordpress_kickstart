<?php
/**
 * @package 	FVN-extension
 * @author 		Vuong Anh Duong
 * @link 		http://freelancerviet.net
 * @copyright 	Copyright (C) 2011 - 2012 Vuong Anh Duong
 * @license 	GNU/GPLv3 http://www.gnu.org/licenses/gpl-3.0.html
 * @version 	$Id: view.html.php  23-06-2012 23:33:14
 **/
// No direct access to this file
defined('_JEXEC') or die('Restricted access');

// import Joomla view library

class ViewTasks
{
	public $value;
	// Overwriting JView display method
	
	function display($tpl = null)
	{
	
		$input = JFactory::getApplication('site')->input;
		$tpl = $tpl ? $tpl : $input->get('layout');
		if($this->layout){
			$tpl = $this->layout;
		}
		if($tpl){		
			include_once __DIR__.'/tmpl/'.$tpl.'.php';
		}else{
			include_once __DIR__.'/tmpl/default.php';
		}
		require_once JPATH_ROOT.'/controllers/demo.php';
		$controller = new JbdebugControllerDemo();
		$this->online_page = $controller->online_page;
		echo '<b>Method list</b><br>';
		echo '<table><tr><td>';
		echo JUri::root().'<br>';
		$methods = array();
		
		$tasks = array_diff(scandir(__DIR__.'/tmpl/'), array('.', '..','default.php','index.html','default.xml'));
		$favorite_tasks = array('migrate.php','sql.php','script.php');
		$tasks = array_diff($tasks,$favorite_tasks);
		
		$tasks = $favorite_tasks + $tasks;
		foreach($tasks as $task){
			$methods[] = array('url'=>JBHelper::route('index.php?option=com_jbdebug&view=tasks&layout='.substr($task,0,-4),1),'name'=>$task);
		}
		foreach ($methods as $method){
			echo '<a href="'.JUri::root().$method['url'].'" class="btn btn-primary btn-wrapper">'.$method['name'].'</a><br>';
			
		}
		
		$links = array();
		if (!file_exists(JPATH_BASE.'/logs')) {
			mkdir(JPATH_BASE.'/logs', 0777, true);
		}
		if (!file_exists(JPATH_BASE.'/logs/script')) {
			mkdir(JPATH_BASE.'/logs/script', 0777, true);
		}
		if (!file_exists(JPATH_BASE.'/logs/sql')) {
			mkdir(JPATH_BASE.'/logs/sql', 0777, true);
		}
		
		//log file
		$log_files = array_diff(scandir(JPATH_BASE.'/logs'), array('.', '..','index.html','sql','script'));		
		foreach ($log_files as $f){
			$links[$f] = 'logs/'.$f;				
		}		
		//sql cache		
		$run_sql_file = array_diff(scandir(JPATH_BASE.'/logs/sql'), array('.', '..','index.html'));
		foreach ($run_sql_file as $f){
			$key = 'sql_'.$f;
			$links[$key] = JBHelper::route('index.php?option=com_jbdebug&task=demo.runsql&sqlcode='.base64_encode(file_get_contents(JPATH_BASE.'/logs/sql/'.$f)));
		}
		//script cache
		$run_script_file = array_diff(scandir(JPATH_BASE.'/logs/script'), array('.', '..','index.html'));
		foreach ($run_script_file as $f){
			$key = 'script_'.$f;
			$links[$key] = JBHelper::route('index.php?option=com_jbdebug&view=tasks&layout=script&code='.base64_encode(base64_encode(file_get_contents(JPATH_BASE.'/logs/script/'.$f))));
		}
		
		echo "Link<ul>";
		foreach($links as $key=>$li){
			echo '<li><a href="'.JBHelper::route(JUri::root().$li).'">'.$key.'</li>';
		}
		echo "</ul>";
		
		
		foreach ($this->online_page as $online_page){			
			echo '</td><td>';
			echo $online_page.'<br>';
			foreach ($methods as $method){
				echo '<a href="'.JBHelper::route($online_page.'/debug/'.$method['url'],1).'" class="btn btn-primary btn-wrapper">'.$method['name'].'</a><br>';
			}
			echo "Link<ul>";
			foreach($links as $key=>$li){
				echo '<li><a href="'.JBHelper::route($online_page.$li,1).'">'.$key.'</li>';
			}
		}
		
		echo "</ul>";
		echo "</td></tr></table>";
		echo '<a href="'.JUri::root().'">Back to trang chu</a><br>';
		echo '  <script type="text/javascript" src="'.JUri::root().'assets/js/jquery.min.js"></script>';
		echo '<a href="http://localhost/'.$controller->init_test['localhost'].'/index.php?option=com_jbdebug&view=tasks">Back to localhost</a>';
		echo '<script>jQuery(document).ready(function($){$("form").append("<input type=\"hidden\" name=\"secret\" value=\"'.$input->getString('secret').'\" />")});</script>';
		exit;
		
	}
	
	public function dump($value){
		echo '<pre>';
		print_r($value);
		echo '</pre>';
	}
	
	function getFiles($path,$include_path = false){
		$files = scandir($path);
		$result = array();
		foreach ($files as $file){
			if($file != '.'&& $file != '..'){
				if($include_path){
					$result[] = $path.$file;
				}else{
					$result[] = $file;
				}
				 
			}
		}
		asort($result);
		return $result;
	}
	
	function setLayout($tmpl){
		$this->layout = $tmpl;
	}
		
}
