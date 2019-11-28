<?php
$array = array('json_decode','json_encode','html_entity_decode','htmlentities','base64_decode','base64_encode');
$val = isset($_POST['sql']) ? $_POST['sql'] : '';

if(isset($_POST['type'])){
	$type= $_POST['type'];
	$this->dump($type($val));
}
?>
<form method="Post" action="index.php?option=com_jbdebug&view=tasks&layout=decode_string" name="debug">
	String: <textarea name="sql" rows="15" style="width:100%"><?php echo $val?></textarea>
	Type
	<select name="type">
		<?php foreach ($array as $a){
			if(isset($_POST['type'])){
				if($a == $_POST['type']){
					echo '<option value="'.$a.'" selected="selected">'.$a.'</option>';
				}else{
					echo '<option value="'.$a.'" >'.$a.'</option>';
				}
			}else{
				echo '<option value="'.$a.'" >'.$a.'</option>';
			}
			
		}?>
	</select>
	<input type="submit"/>
</form>