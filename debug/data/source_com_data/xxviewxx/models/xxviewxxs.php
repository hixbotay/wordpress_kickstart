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

class XxoptionxxModelXxviewxxs extends JModelList{
	
	public function __construct($config=array()){
		if (empty($config['filter_fields'])){
			$config['filter_fields'] = array(
			'code', 'a.code',
			'title', 'a.title',
			'state', 'a.state',
			'seat', 'a.seat',
			'ordering', 'a.ordering',
			);
		}
		
		parent::__construct($config);
	}
	
	protected function populateState($ordering = 'a.id', $direction = 'DESC'){		
		
		$search = $this->getUserStateFromRequest($this->context . '.filter.search', 'filter_search');
		$this->setState('filter.search', $search);
		
		$user_id = $this->getUserStateFromRequest($this->context . '.filter.user_id', 'filter_user_id');
		$this->setState('filter.user_id', $user_id);
		
		parent::populateState($ordering,$direction);
	}
	
	protected function getListQuery(){
		
		$db = $this->getDbo();
		$query = $db->getQuery(true);
		
		$query->select('a.*');
		$query->from($db->quoteName('#__xxoptionxx_xxviewxx').' AS a');
		
		$search = $this->getState('filter.search');
		if(!empty($search)){
			$search = $db->quote('%'.$search.'%');
			$query->where('(a.title LIKE '.$search.')');
		}
		
		$user_id = $this->getState('filter.user_id');
		if(!empty($user_id)){
			$query->where('(a.user_id = '.$user_id.')');
		}
		
		$orderCol = $this->state->get('list.ordering','a.id');
		$orderDirn = $this->state->get('list.direction','DESC');
		
		$query->order($db->escape($orderCol.' '.$orderDirn));
		
		return $query;

	}
	
	public function getItemByIds($ids = null){
		
		$db = JFactory::getDbo();
		$query = $db->getQuery(true);		
		$query->select('a.*');
		$query->from($db->quoteName('#__xxoptionxx_xxviewxx').' AS a');
		if(!empty($ids)){
			if(is_array($ids)){
				$where = implode(',', $ids);
			}
			else{
				$where = $ids;
			}
			$query->where('a.id IN ('.$where.')');
		}
		$db->setQuery($query);
		return $db->loadObjectList();
	}
}