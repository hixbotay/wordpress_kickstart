<?php
/**
 * @package 	FVN-extension
 * @author 		Vuong Anh Duong
 * @link 		http://freelancerviet.net
 * @copyright 	Copyright (C) 2011 - 2012 Vuong Anh Duong
 * @license 	GNU/GPLv3 http://www.gnu.org/licenses/gpl-3.0.html
 * @version 	$Id: airport.php 66 2012-07-31 23:46:01Z quannv $
 **/


// Check to ensure this file is included in Joomla!
defined ( '_JEXEC' ) or die ();
class MathHelper {

	static function getSumOfArray($array,$column){		
		$result = array_reduce($array, function($i, $obj) use($column){
			return $i += $obj->$column;
		});
		return $result;
	}
	
	static function filterArrayObject($array,$column,$value){
		$result = array_filter($array, function ($e) use ($column,$value){
			return $e->$column == $value;
		});
		return reset($result);
	}
	
	static function filterArrayObjects($array,$column,$value){
		$result = array_filter($array, function ($e) use ($column,$value){
			return $e->$column == $value;
		});
		return $result;
	}
	
	/**
	 * Get item of an array with filter by an array
	 * @param array $arrayList: List array to filter
	 * @param array $arrayFilter: filter list
	 */
	static function filterArray($arrayList,$arrayFilter){
		$result = array();
		foreach ($arrayList as $item){
			if(in_array($item,$arrayFilter)){
				$result[] = $item;
			}
		}
		return $result;
	}

}

