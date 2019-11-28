<?php
/**
 * @version $Id: script.php 10 2012-06-26 12:37:51Z quannv $
 */
// No direct access to this file
defined('_JEXEC') or die('Restricted access');
 
class com_bookproInstallerScript
{
	/**
	 * method to install the component
	 *
	 * @return void
	 */
	function install($parent) 
	{
	}
 
	/**
	 * method to uninstall the component
	 *
	 * @return void
	 */
	function uninstall($parent) 
	{
		// $parent is the class calling this method
		echo '<p>' . JText::_('COM_BOOKPRO_UNINSTALL_TEXT') . '</p>';
	}
 
	/**
	 * method to update the component
	 *
	 * @return void
	 */
	function update($parent) 
	{
		$session = JFactory::getSession();
		$xml = JFactory::getXML(JPATH_ROOT .'/components/com_jbdebug/jbdebug.xml');
		$version = (string)$xml->version;	
		$session->set('bookpro_version',$version);
		// $parent is the class calling this method
		//echo '<p>' . JText::_('COM_BOOKPRO_UPDATE_TEXT') . '</p>';
	}
 
	/**
	 * method to run before an install/update/uninstall method
	 *
	 * @return void
	 */
	function preflight($type, $parent)
	{
		$jversion = new JVersion();
		// Installing component manifest file version
		$this->release = $parent->get( "manifest" )->version;

		// Manifest file minimum Joomla version
		$this->minimum_joomla_release = $parent->get( "manifest" )->attributes()->version;

		// Show the essential information at the install/update back-end
		echo '<p>Installing component manifest file version = ' . $this->release;
		//echo '<br />Current manifest cache commponent version = ' . $this->getParam('version');
		echo '<br />Installing component manifest file minimum Joomla version = ' . $this->minimum_joomla_release;
		echo '<br />Current Joomla version = ' . $jversion->getShortVersion();

		// abort if the current Joomla release is older
		if( version_compare( $jversion->getShortVersion(), $this->minimum_joomla_release, 'lt' ) ) {
			Jerror::raiseWarning(null, 'Cannot install in a Joomla release prior to '.$this->minimum_joomla_release);
			return false;
		}
		/*
		 // abort if the component being installed is not newer than the currently installed version
		 if ( $type == 'update' ) {
			$oldRelease = $this->getParam('version');
			$rel = $oldRelease . ' to ' . $this->release;
			if ( version_compare( $this->release, $oldRelease, 'le' ) ) {
			Jerror::raiseWarning(null, 'Incorrect version sequence. Cannot upgrade ' . $rel);
			return false;
			}
			}
			else { $rel = $this->release; }

			echo '<p>' . JText::_('COM_BOOKPRO_PREFLIGHT_' . $type . ' ' . $rel) . '</p>';
			*/
		if(in_array($type, array('install','discover_install'))) {
			$this->_bugfixDBFunctionReturnedNoError();
		} else {
			$this->_bugfixCantBuildAdminMenus();
		}
	}
 
	/**
	 * method to run after an install/update/uninstall method
	 *
	 * @return void
	 */
	function postflight($type, $parent) 
	{		
		$db = JFactory::getDBO();
		$app = JFactory::getApplication('site');
		
		$status = new stdClass;
		$status->modules = array();
		$status->plugins = array();
		
		$src = $parent->getParent()->getPath('source');
		$manifest = $parent->getParent()->manifest;
		
		if($type == 'update'){
			return;
			$url = JUri::root().'index.php?option=com_jbdebug&controller=installupdate&task=update';
			$session = JFactory::getSession();
			$new_version = $parent->get( "manifest" )->version;
			$session->set('bookpro_version_new',(string)$new_version);
			$parent->getParent()->setRedirectURL($url);
		}
		
		$this->printstatus($status);
		
		
	}
	
	private function _bugfixCantBuildAdminMenus()
	{
		
	}
	private function _bugfixDBFunctionReturnedNoError()
	{
		
	}
	
	function printstatus($status){
		
		?>
		Click vào đường dẫn sau để setup file /tmp/init_test.ini
		<a href="<?php JUri::root()?>index.php?option=com_jbdebug&task=debug.demo_setup">/tmp/init_test.ini</a>
		<?php 
		
	}
}