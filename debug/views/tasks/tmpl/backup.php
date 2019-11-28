<?php
echo '<form method="Post" action="'.JRoute::_('index.php?option=com_jbdebug&task=demo.runBackup').'" name="debug">
				Table name: <input type="text" name="sql" style="width:100%"/><br>
				<input type="submit"/>
				</form>';