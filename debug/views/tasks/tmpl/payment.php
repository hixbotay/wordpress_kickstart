<?php
$db = JFactory::getDbo();
$db->setQuery('select * from #__bookpro_orders order by id DESC limit 0,10');
$orders = $db->loadObjectList();

foreach ($orders as $i=>$order){
	echo '<a href="index.php?option=com_jbdebug&task=demo.debug_payment&order_id='.$order->id.'">'.$order->id.' .'.$order->order_number.'</a><br>';
}