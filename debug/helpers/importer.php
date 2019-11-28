<?php
/**
 * FVN-extension check class
 *
 * @package FVN-extension
 * @author Vuong Anh Duong
 * @link http://freelancerviet.net
 * @copyright Copyright (C) 2011 - 2012 Vuong Anh Duong
 * @version $Id: importer.php 44 2012-07-12 08:05:38Z quannv $
 */

defined('_JEXEC') or die('Restricted access');


class AImporter
{

    /**
     * Import file by absolute path from component root. 
     *
     * @param string $base last directory contain files: helpers, models, elements ...
     * @param array $names files names without path and extensions
     * @param string extension without dot: php, html, ini ...
     */
    static function import($base, $names, $ext = 'php')
    {
        if (! is_array($names)) {
            $names = array($names);
        }
        $filePathMask = JPATH_ADMINISTRATOR.'/components/com_bookpro/' . $base . '/%s.' . $ext;
        foreach ($names as $name) {
        	$filePath = sprintf($filePathMask, $name);
        	if (file_exists($filePath)) {
        		include_once ($filePath);
        	} else{
        		$filePath = sprintf(JPATH_ROOT."/{$base}/{$name}.{$ext}");
        		if (file_exists($filePath)) {
        			include_once ($filePath);
        		} else{
        			echo 'File ' . $filePath . ' not found';
        		}
        		
        		
        	}
        }
    }
    static function classes(){
    	$names = func_get_args();
    	AImporter::import('classes', $names);
    }

    /**
     * Import file view.html.php from component view.
     * 
     * @param string $view view name, if empty use parameter from request
     */
   static function importView($view = null)
    {
        AImporter::importFile(AImporter::getViewBase($view) . 'view.html.php');
    }

    /**
     * Import template file from component view.
     * 
     * @param string $view view name, if empty use parameter from request
     * @param string $tpl template name, if empty use default.php
     */
   static function importTpl($view = null, $tpl = null)
    {
        AImporter::importFile(AImporter::getViewBase($view) . 'tmpl/' . ($tpl ? $tpl : 'default') . '.php');
    }

    /**
     * Get component view base directory.
     * 
     * @param string $view view name, if empty use parameter from request
     */
    function getViewBase($view = null)
    {
        return JPATH_COMPONENT_ADMINISTRATOR . '/views/' . ($view ? $view : JFactory::getApplication()->input->getString('view')) . DS;
    }

  

    /**
     * Import component controller. Current or default according to client position.
     * @return boolean true if successfully imported
     */
 	static  function controller($name = null)
    {
       $match = array();
    	if (preg_match('/^([a-z_]+)\.([a-z_]+)$/', JFactory::getApplication()->input->getString('task'), $match)) {
    		JFactory::getApplication()->input->set('controller', $match[1]);
    		JFactory::getApplication()->input->set('task', $match[2]);
    	}
        $cname = is_null($name) ? JFactory::getApplication()->input->getString('controller', 'controller') : $name;
        $cname = $cname ? $cname : 'controller';
        return AImporter::import('controllers', $cname);
//        return AImporter::getControllerName($name);
    }
    

    static function getControllerName($name = null)
    {
        $name = is_null($name) ? JFactory::getApplication()->input->getString('controller', '') : $name;
        return CONTROLLER . $name;
    }
    

    /**
     * Import component helper.
     *
     * @param mixed $name file name without extension and path
     */
    static function helper($name)
    {
        $names = func_get_args();
        AImporter::import('helpers', $names);
    }
    static function view($name)
    {
    	$names = func_get_args();
    	foreach($names as $n){
    		AImporter::import('views', $n.'/view.html');
    	}
    	
    }
	function gds($name)
    {
        $names = func_get_args();
        AImporter::import('gds/booking', $names);
    }

    /**
     * Import component model.
     *
     * @param mixed $name file name without extension and path.
     */
    static function model($name)
    {
        $names = func_get_args();
        AImporter::import('models', $names);
    }

    /**
     * Import component table.
     *
     * @param mixed $name file name without extension and path.
     */
   static function table($name)
    {
        $names = func_get_args();
        AImporter::import('tables', $names);
    }


    /**
     * Link js source into html head.
     *
     * @param mixed $name file name without extension and path
     */
    static function js($name)
    {
    	$names = func_get_args();    	
    	$doc = JFactory::getDocument();
    	$base = JUri::root().'administrator/components/com_jbtracking/assets/js/';
    	foreach ($names as $n){
    		$doc->addScript($base.$n.'.js');
    	}
    }
    
	static function css($name)
    {
    	$names = func_get_args();    	
    	$doc = JFactory::getDocument();
    	$base = JUri::root().'administrator/components/com_jbtracking/assets/css/';
    	foreach ($names as $n){
    		$doc->addStyleSheet($base.$n.'.css');
    	}		    	
    }

    /**
     * Import style for CSS icon into HTML page head.
     * 
     * @param string $className
     * @param string $fileName
     */
  static  function cssIcon($className, $fileName)
    {
        $css = '.aIcon' . ucfirst($className) . ' {' . PHP_EOL;
        $css .= '    background: transparent url(' . IMAGES . $fileName . ') no-repeat scroll left center;' . PHP_EOL;
        $css .= '}' . PHP_EOL;
        $document = JFactory::getDocument();
        /* var $document JDocument */
        $document->addStyleDeclaration($css);
    }

    /**
     * Import CSS file from current admin Template.
     * 
     * @param string $name
     */
    function adminTemplateCss($template, $name)
    {
        $names = func_get_args();
        if (count($names)) {
            unset($names[0]);
        }
        if (is_null($template)) {
            $mainframe = JFactory::getApplication();
            /* var $mainframe JApplication */
            $template = $mainframe->getTemplate();
        }
        foreach ($names as $name) {
            JHTML::stylesheet($name . '.css', 'administrator/templates/' . $template . '/css/');
        }
    }


    /**
     * Display template of another view.
     * 
     * @param string $view
     * @param string $tpl
     * @param string $layout
     * @param string $base use ADMIN_VIEWS/SITE_VIEWS constant
     * @param boolean $returnPath if true return full path, false include file
     * @return mixed string path or void
     */
    function tpl($view, $layout, $tpl, $base = ADMIN_VIEWS, $returnPath = false)
    {
        $name = ($layout ? ($layout . '_') : '') . $tpl . '.php';
        $path = $base ."/". $view . '/tmpl/' . $name;
        if ($returnPath)
            return $path;
        include ($path);
    }

    /**
     * Get path to payment files.
     * 
     * @param string $alias
     * @return array
     */
    function payment($alias)
    {
        return array('button' => ($base = PAYMENTS ."/". JString::substr($alias, 0, JString::strrpos($alias, '_')) . DS) . 'button.php' , 'config' => $base . 'config.xml' , 'controller' => $base . 'controller.php' , 'icon' => $base . 'icon.png');
    }
    static function jquery($cdn=true){
    	$document=JFactory::getDocument();
    	if($cdn){
    		$document->addScript('http://ajax.googleapis.com/ajax/libs/jquery/1.9.2/jquery.min.js');
    		$document->addScriptDeclaration('jQuery.noConflict();');
    		
    	}else
    	{
    		$document->addScript(JURI::root().'components/com_bookpro/assets/js/jquery.min.js');
    		$document->addScriptDeclaration('jQuery.noConflict();');
    		
    	}
    }
    
    static function jqueryui($cdn=true){
    	$document=JFactory::getDocument();
    	if($cdn){
    		$document->addScript('http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js');
    		$document->addScript('http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js');
    		$document->addScriptDeclaration('jQuery.noConflict();');
    
    	}else
    	{
    		$document->addScript(JURI::root().'components/com_bookpro/assets/js/jquery.min.js');
    		$document->addScript(JURI::root().'components/com_bookpro/assets/js/jquery-ui.min.js');
    		$document->addScriptDeclaration('jQuery.noConflict();');
    
    	}
    }
}

?>