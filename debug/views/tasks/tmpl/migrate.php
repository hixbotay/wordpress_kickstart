<?php
function add_migration_table(){
	if(!JBTableHelper::check_exist('#__bookpro_migrations')){
		JBTableHelper::generate('#__bookpro_migrations', array(
				'id'=>'int(11) NOT NULL AUTO_INCREMENT','table_name'=>'varchar(200)'
		),'id');
	}
}

add_migration_table();

$path = JPATH_BASE.'/migrations';
if(!is_dir($path)){
	mkdir($path);
}

$files = array_diff(scandir($path), array('.', '..','index.html'));
foreach($files as $i => $f){
	if(substr($f,-3)!='php'){
		unset($files[$i]);
	}
}
$db = JFactory::getDbo();
$migrated = $db->setQuery('select table_name from #__bookpro_migrations')->loadAssocList('','table_name');

AImporter::table('custom');
$table_migrations = new JBCustomTable($db, '#__bookpro_migrations', 'id');
$number_file_execute = 0;
foreach($files as $f){
	if(!in_array($f, $migrated)){
		$number_file_execute++;
		try{
			$db->transactionStart();
			include $path.'/'.$f;
		
			$table_migrations->save(['table_name'=>$f]);
			$db->transactionCommit();
			debug("{$f} was executed!");
		}catch (Exception $e){
			debug($f);
			debug($e->getMessage());				
			$db->transactionRollback();
			exit;
		}
	}	
}
if($number_file_execute< 1){
	debug('Already up to date');
}else{
	debug('Done');
}
exit;