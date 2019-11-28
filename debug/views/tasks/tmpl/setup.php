<?php
$file = JPATH_ROOT.'/tmp/init_test.ini';
$data = file_get_contents($file);
if(empty($data)){
	$data = "update_team=1
	localhost='localhost/myproject'
[online_page]
0[url]='http://flight.joombooking.com/'
0[username]='admin'
0[password]='123@123a'";
}?>

<form method="post" action="index.php?option=com_jbdebug&task=demo.run_setup" name="debug">
	<textarea rows="15" style="width:100%" name="data"><?php echo $data?></textarea>
	<button type="submit">Submit</button>
</form>