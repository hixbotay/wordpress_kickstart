<?php
/**
 * FVN-extension check class
 *
 * @package FVN-extension
 * @author Vuong Anh Duong
 * @link http://freelancerviet.net
 * @copyright Copyright (C) 2011 - 2012 Vuong Anh Duong
 * @version $Id: tourhelper.php 105 2012-08-30 13:20:09Z quannv $
 */


defined('_JEXEC') or die('Restricted access');
class JBTableHelper {
	
	
	static function get_table_columns($table){
		$db = JFactory::getDbo();
		$query = $db->getQuery(true);
		$query->select('column_name as name, column_type as type')
		->from('information_schema.columns')
		->where("table_name = '".str_replace('#__', $db->getPrefix(), $table)."'");
		// 		debug($query->dump());die;
		$db->setQuery($query);
		$result = $db->loadAssocList('name');
		if(empty($result)){
			return false;
		}else{
			return $result;
		}
	}
	
	//generate table
	static function generate($table_name,$columns,$id='',$attr='',$engine= 'MyISAM'){
		$db = JFactory::getDbo();
		$add_column = array();
		foreach ($columns as $column=>$type){
			$add_column[] = $db->quoteName($column).' '.$type;
		}
		
		$add_column = implode(',', $add_column);
		if(!empty($add_column)){
			$add_column .= ",";
		}
		
		if($id){
			if(!is_array($id)){
				$id = array($id);
			}
			$id = '('.implode(',', $id).')';
			$private_key = "PRIMARY KEY {$id}";
		}else{			
			$private_key = "";
		}
		
		
		$query = "CREATE TABLE {$table_name} ({$add_column} {$private_key}) ENGINE={$engine}  DEFAULT CHARSET=utf8;";
		$db->setQuery($query);
// 		debug($query);die;
		return $db->execute();
	}
	
	/**
	 * Check the table exist
	 * @param string $table: table name
	 */
	static function check_exist($table){
		$db = JFactory::getDbo();
		$table_name = str_replace('#__', $db->getPrefix(),$table);
		return in_array($table_name,$db->getTableList());		
	}
	
	static function add_column($table_name,$columns){
		$db = JFactory::getDbo();
		$add_column = array();
		foreach ($columns as $column=>$type){
			$add_column[] = $db->quoteName($column).' '.$type;
		}
		$add_column = implode(', ADD', $add_column);
		$query = "ALTER TABLE {$table_name} ADD {$add_column} ;";
		$db->setQuery($query);
		return $db->execute();
	}
	
	
}