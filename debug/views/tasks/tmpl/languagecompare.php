<form method="Post"
	action="index.php?option=com_jbdebug&task=demo.runLanguageCompare"
	name="debug">
	<table>
		<tr>
			<td><textarea style="width: 400px;" rows="20" name="string1"><?php echo $this->value['str1']?></textarea></td>
			<td><textarea style="width: 400px;" rows="20" name="string2"><?php echo $this->value['str2']?></textarea></td>
		</tr>
	</table>
	<input type="submit" />
</form>