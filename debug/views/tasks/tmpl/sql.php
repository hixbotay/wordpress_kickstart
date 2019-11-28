
<form method="Post" action="<?php echo JBHelper::route('index.php?option=com_jbdebug&task=demo.runsql')?>" name="debug">
SQL query: <br>
<textarea name="sql" style="width:100%" rows="15"><?php echo $this->value?></textarea><br>
<input type="checkbox" name="log" value="1"/>Save log<br>
<input type="checkbox" name="remote" value="1"/>Send request to Remote Host<br>
<input type="submit"/>
</form>