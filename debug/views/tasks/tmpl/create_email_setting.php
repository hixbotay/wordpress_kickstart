<?php 
if(isset($_REQUEST['code'])){
$this->value= base64_decode(base64_decode($_REQUEST['code']));
}?>
<script language="javascript" type="text/javascript" src="<?php echo JUri::root()?>components/com_jbdebug/assets/js/edit_area/edit_area_full.js"></script>

<script>
	jQuery(document).ready(function($){
		editAreaLoader.init({
			id: "script_area"	// id of the textarea to transform		
			,start_highlight: true	// if start with highlight
			,allow_resize: "both"
			,allow_toggle: false
			,word_wrap: true
			,language: "en"
			,syntax: "php"	
		});
	});
</script>
<form action="index.php?option=com_jbdebug&task=demo.runScript"
	method="Post">
	<div class="control-group">
		<div class="control-label">Script file</div>
		<div class="controls">
			<textarea rows="15" cols="30" id="script_area" name="script" style="width: 100%"><?php echo $this->value?></textarea>
		</div>
	</div>
	<p><input type="checkbox" name="remote" value="1" />Send request to Remote Host</p>
	<p><input type="checkbox" name="save_cache" value="1" onclick="jQuery('#name').toggle();"/>Save cache</p>
	<p><input type="text" name="name" id="name" style="display:none"/>Name of script file</p>
	
	<p><input type="submit" /></p>
</form>