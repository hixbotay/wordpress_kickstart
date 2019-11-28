<form method="Post"
	action="index.php?option=com_jbdebug&task=demo.runadd_sql_query_cache"
	name="debug">
	Name:<input type="text" required name="name" value="" style="width:100%"/><br> 
	SQL: <textarea required name="content" rows="10" style="width:100%"><?php echo $this->value?></textarea>
	<br> <input type="submit" />
</form>