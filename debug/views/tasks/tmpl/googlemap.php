<form method="post"
	action="index.php?option=com_jbdebug&view=tasks&layout=googlemap"
	name="debug">
	<input type="text" name="keyword" value="<?php echo isset($_REQUEST['keyword']) ? $_REQUEST['keyword'] : ''?>" style="width:300px"/><br>
	<textarea name="json" style="width:300px"/><?php echo isset($_REQUEST['json']) ? $_REQUEST['json'] : ''?></textarea>
	<input type="submit" /><br>
	<table style="width:100%">
		<tr>
			<td valign="top">
				<?php if(isset($_REQUEST['keyword']) && !empty($_REQUEST['keyword'])){
					$url = "http://maps.google.com/maps/api/geocode/json?types=route&address=".str_replace(' ', '+', $_REQUEST['keyword']);
					$google_results = file_get_contents($url);
					$google_results = json_decode($google_results);
					foreach ($google_results->results as $item){
						print_map($item);				 
					}
				}else if(isset($_REQUEST['json']) && !empty($_REQUEST['json'])){
					$item = json_decode($_REQUEST['json']);
					print_map($item);
					$google_results = $item;
				}else{
				
				}?>
			</td>
			<td>
				<pre><?php print_r($google_results);?></pre>
			</td>
		</tr>
	</table>
	
	
</form>
<?php 
function get_distance($latitudeFrom, $longitudeFrom, $latitudeTo, $longitudeTo)
{
	$latFrom = deg2rad($latitudeFrom);
	$lonFrom = deg2rad($longitudeFrom);
	$latTo = deg2rad($latitudeTo);
	$lonTo = deg2rad($longitudeTo);

	$latDelta = $latTo - $latFrom;
	$lonDelta = $lonTo - $lonFrom;

	$angle = 2 * asin(sqrt(pow(sin($latDelta / 2), 2) +
			cos($latFrom) * cos($latTo) * pow(sin($lonDelta / 2), 2)));
	return round(($angle * 6378),2,PHP_ROUND_HALF_UP);
}

function print_map($item){
	$center = $item->geometry->location->lat.','.$item->geometry->location->lng;
	$nor = $item->geometry->viewport->northeast->lat.','.$item->geometry->viewport->northeast->lng;
	$sou = $item->geometry->viewport->southwest->lat.','.$item->geometry->viewport->southwest->lng;
	?>
	<div style="clear:both">
	<?php echo $item->formatted_address?><br>
	<img width="550px" src="http://maps.google.com/maps/api/staticmap?center=<?php echo $center?>&markers=color:red|label:C|<?php echo $center?>&markers=color:green|label:N|<?php echo $nor?>&markers=color:green|label:S|<?php echo $sou?>&zoom=13&size=512x512&maptype=roadmap"/>
	</div>
	<?php 
}
?>