<?php
$db = JFactory::getDbo();
$db->setQuery('select * from #__bookpro_orders limit 0,10');
$orders = $db->loadObjectList();

foreach ($orders as $i=>$order){
	echo '<a href="index.php?option=com_bookpro&controller=payment&task=urlsendmail&order_id='.$order->id.'">'.$order->id.'</a><br>';
}