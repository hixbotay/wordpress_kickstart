<?php
const _JEXEC = 1;

$_SESSION['flag'] = TRUE;
if (file_exists(__DIR__ . '/jbdefines.php'))
{	
	require_once __DIR__ . '/jbdefines.php';
}
$app = JFactory::getApplication('site');
if(substr(JUri::root(), 0,16) != 'http://localhost'){
	if(JFactory::getConfig()->get('secret')!=$app->input->getString('secret')){
		header("HTTP/1.0 404 Not Found");
		exit;
	}
}



/*echo '<script src="'.JUri::root().'assets/js/jquery.min.js"></script>';*/

$controller = $app->input->getString('controller');

$task = $app->input->getString('task');
if($task){
	$list = explode('.',$task);
	if(isset($list[1])){
		$controller = $list[0];
		$task = $list[1];
	}
}
if($controller){
	if (file_exists(JPATH_COMPONENT.'/controllers/'.$controller.'.php')){
		require_once( JPATH_COMPONENT.'/controllers/'.$controller.'.php' );
	}else{
		die('Invalid controller');
	}
}else{
	
	AImporter::view('tasks');
	$view= new ViewTasks();
	$view->display();
}


$classname = 'JbdebugController'.$controller;
$controller = new $classname();
$controller->execute($task);
$controller->redirect();
exit;

