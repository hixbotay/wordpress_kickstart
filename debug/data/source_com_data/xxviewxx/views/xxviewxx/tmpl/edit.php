<?php
/**
 * 
 * @package 	Xxoptionxx
 * @author 		Vuong Anh Duong
 * @link 		http://freelancerviet.net
 * @copyright 	Copyright (C) 2011 - 2012 Vuong Anh Duong
 * @license 	GNU/GPLv3 http://www.gnu.org/licenses/gpl-3.0.html
 * @version 	$Id$
 **/

defined( '_JEXEC' ) or die( 'Direct Access to this location is not allowed.' );

?>

<form action="<?php echo JRoute::_('index.php?option=com_xxoptionxx&view=xxviewxx&layout=edit&id='.(int)$this->item->id);?>" method="post" name="adminForm" id="adminForm" class="form-validate">
	<div class="form-horizontal">	
			<!--<div class="control-group">
					<div class="control-label"><?php echo $this->form->getLabel('code'); ?></div>
					<div class="controls"><?php echo $this->form->getInput('code'); ?></div>
			</div>-->
			<?php echo $this->form->renderFieldSet(null)?>
	</div>
	
	<input type="hidden" name="task" value="" />				
	<?php echo JHtml::_('form.token');?>		
</form>