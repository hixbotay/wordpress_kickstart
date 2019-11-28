<?php
/**
 * @package 	FVN-extension
 * @author 		Vuong Anh Duong
 * @link 		http://freelancerviet.net
 * @copyright 	Copyright (C) 2011 - 2012 Vuong Anh Duong
 * @license 	GNU/GPLv3 http://www.gnu.org/licenses/gpl-3.0.html
 * @version 	$Id$
 **/
defined('_JEXEC') or die('Restricted access');

class JBCustomTable extends JTable
{
	public $jbcache = null;
	static $connection;

	function __construct($db, $table_name, $primary_key)
	{
		if(is_string($primary_key)){
			$primary_key = array('0'=>$primary_key);
		}
		parent::__construct($table_name, (object)$primary_key, $db);
		
	}
	
	function save($data, $orderingFilter = '', $ignore = ''){
		$this->bind($data, null);
		$query = $this->_db->getQuery(true)
		->select('COUNT(*)')
		->from($this->_tbl);
		$this->appendPrimaryKeys($query);
// 		echo $data['tax'];
// 		echo $this->tax;die;
		$this->_db->setQuery($query);
		$count = $this->_db->loadResult();
		if($count){
			return $this->_db->updateObject($this->_tbl, $this, $this->_tbl_keys);			
		}else{
			return $this->_db->insertObject($this->_tbl, $this, reset($this->_tbl_keys));
		}
	}
	
	function batch_save($datas){
		if(!is_array($datas) || count($datas) < 1){
			return true;
		}
		$table_fields = $this->getFields();
		$table_fields = array_map(function($a){return $a->Field;}, $table_fields);		
		$fields = array_keys(reset($datas));
		foreach($fields as $i=>$key){
			if(!in_array($key, $table_fields)){
				unset($fields[$i]);
			}
		}
		//bo truong ko co trong database
		
		$sql = 'INSERT INTO '.($this->_tbl).' ('.implode(',',$fields).') VALUES ';
		$sql = $this->_db->replacePrefix($sql,'#__');
		foreach($datas as $data){
			$data = (array)$data;
			$sql .= "(".$this->render_values($data,$fields)."),";
		}
		
		$sql = trim($sql,',')." ON DUPLICATE KEY UPDATE ";
		foreach($fields as $field){
			$sql .= "$field = VALUES($field),";
		}
		$sql = trim($sql,',').';';
		$datas=null;unset($datas);
		$this->_db->setQuery($sql);
		$sql=null;unset($sql);
		
		return $this->_db->execute();
		
	}
	
	
	
	private function render_values($data,$key){
		$sql = '';
		foreach($key as $v){
			if(isset($data[$v])){
				if(is_array($data[$v]) || is_object($data[$v])){
					$sql .=  ','.$this->_db->quote(json_encode($data[$v]));
				}else{
					$sql .=  ','.$this->_db->quote($data[$v]);
				}
				
			}else{
				$sql .=  ',""';
			}
		}
		return trim($sql,',');
	}
	
	
	public function getFields($reload = false)
	{	
		if ($this->jbcache === null)
		{
			// Lookup the fields for this table only once.
			$name   = $this->_tbl;
			$fields = $this->_db->getTableColumns($name, false);
	
			if (empty($fields))
			{
				throw new UnexpectedValueException(sprintf('No columns found for %s table', $name));
			}
	
			$this->jbcache = $fields;
		}
	
		return $this->jbcache;
	}
	
	
	function insert($data){
		$this->bind($data, '');
		return $this->_db->insertObject($this->_tbl, $this, $this->_tbl_keys[0]);
	}
}