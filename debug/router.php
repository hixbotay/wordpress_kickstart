<?php
/**
 * @package 	FVN-extension
 * @author 		Vuong Anh Duong
 * @link 		http://freelancerviet.net
 * @copyright 	Copyright (C) 2011 - 2012 Vuong Anh Duong
 * @license 	GNU/GPLv3 http://www.gnu.org/licenses/gpl-3.0.html
 * @version 	$Id: router.php 53 2012-07-17 14:42:54Z quannv $
 **/



defined('_JEXEC') or die;


/**
 * Build the route for the com_bookpro component
 *
 * @param	array	An array of URL arguments
 * @return	array	The URL arguments to use to assemble the subsequent URL.
 * @since	1.5
 */
function JbdebugBuildRoute(&$query)
{

	$segments = array();
	
	return $segments;
}


/**
 * Parse the segments of a URL.
 *
 * @param	array	The segments of the URL to parse.
 *
 * @return	array	The URL attributes to be used by the application.
 * @since	1.5
 */
function JbDebugParseRoute($segments)
{
	$vars = array();
	
	if(count($segments)==2 ){
		$vars['view']='flight';
		$ids=explode(':',$segments[0]);
		$vars['from']=(int)$ids[0];
		$vars['to']=(int)$ids[1];
		$vars['controller']='flight';
		
	}
	return $vars;
	
}

