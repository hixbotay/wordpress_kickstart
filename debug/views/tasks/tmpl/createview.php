
<form action="index.php?option=com_jbdebug&task=demo.runCreateView" method="Post">
Option: <input type="text" rows="4" cols="30" name="view[option]" style="width:100%" required value="bookpro"/><br>
Name: <input type="text" rows="4" cols="30" name="view[name]" style="width:100%" required /><br>
Names: <input type="text" rows="4" cols="30" name="view[names]" style="width:100%" required /><br>
<!--Save to tmp: <input type="radio"  name="view[tmp]" value="1" onclick="jQuery('#path').show()"/>Yes<input type="radio"  name="view[tmp]" value="0" onclick="jQuery('#path').hide()"/>No<br>-->
<span id="path" style="display:none">Frontend/Backend: <input type="radio" name="view[admin]" style="width:100%" value="1" />Backend<input type="radio" name="view[admin]" style="width:100%" value="0" />Frontend<br></span>
SQL<br>
<div>
<div class="clearfix sql">
Field: <input type="text" class="input-mini" name="sql[name][]" required />
Type: <input type="text" class="input-medium" name="sql[type][]" required />
</div>
<button type="button" class="btn btn-success btn-tiny" onclick="var clone = jQuery(this).parent().children().eq(0).clone();clone.insertBefore(jQuery(this));"><icon class="icon-new"></icon>Add</button>
</div>
	
	
	
<input type="submit"/>
</form>