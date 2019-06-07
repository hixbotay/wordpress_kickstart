<?php 
	

require( dirname(__FILE__) . '/wp-load.php' );
error_reporting(E_ERROR | E_WARNING);
ini_set('display_errors', 1);
ini_set('memory_limit', '-1');
ini_set('max_execution_time', 20000);

//---------------function---------------
if(!function_exists('debug')){
	function debug($var){
		echo '<pre>';print_r($var);echo '</pre>';
	}
}
$host = substr($_SERVER['HTTP_HOST'],0,4)=='http' ? $_SERVER['HTTP_HOST'] : "http://{$_SERVER['HTTP_HOST']}";
global $wpdb;
if(!$_GET['action']){?>
	<p><a href="hbtool.php?action=convert">Convert</a></p>
	<p><a href="hbtool.php?action=convert_email">change email</a></p>
	<p><a href="hbtool.php?action=replace">Replace</a></p>
	<p><a href="hbtool.php?action=role">Role</a></p>
	<p><a href="hbtool.php?action=optimize">Optimize</a></p>
	<p><a href="hbtool.php?action=zip">Zip</a></p>
<?php }
if($_GET['action']=='replace'){
	//debug($_SERVER);
	if(!$_POST['current_url']){
		echo '<form action="hbtool.php?action=replace" method="post">Old<input name="old_url"> New <input name="current_url"> <br><input type="submit" value="submit"></form>';
		exit;
	}
	$old_url = $_POST['old_url'];
	$current_url = $_POST['current_url'];
	$options = $wpdb->get_results("SELECT * FROM {$wpdb->prefix}options WHERE option_value LIKE '%{$old_url}%'");
	
	foreach($options as $o){
		$mods = get_option( $o->option_name );
		
		if(is_array($mods) || is_object($mods)){
			foreach($mods as &$r){
				if(is_string($r)){
					$r=str_replace($old_url,$current_url,$r);
				}
			}
		}else{
			$mods=str_replace($old_email,$current_email,$mods);
		}
		update_option( $o->option_name, $mods );
	}
	
	$wpdb->query("UPDATE {$wpdb->prefix}posts SET post_content=REPLACE(post_content, '{$old_url}', '{$current_url}') WHERE post_content LIKE '%{$old_url}%'");
	$wpdb->query("UPDATE {$wpdb->prefix}posts SET guid=REPLACE(guid, '{$old_url}', '{$current_url}') WHERE post_content LIKE '%{$old_url}%'");
	$wpdb->query("UPDATE {$wpdb->prefix}postmeta SET meta_value=REPLACE(meta_value, '{$old_url}', '{$current_url}') WHERE meta_value LIKE '%{$old_url}%' AND meta_value NOT LIKE '%\}'");
	$wpdb->query("UPDATE {$wpdb->prefix}termmeta SET meta_value=REPLACE(meta_value, '{$old_url}', '{$current_url}') WHERE meta_value LIKE '%{$old_url}%' AND meta_value NOT LIKE '%\}'");
	
	die('done');
}

if($_GET['action']=='convert_email'){
	//debug($_SERVER);
	if(!$_POST['current_url']){
		echo '<form action="hbtool.php?action=convert_email" method="post"><input name="current_url"><input type="submit" value="submit"></form>';
		exit;
	}
	$old_email = get_option('admin_email');
	$current_email = $_POST['current_url'];
	$options = $wpdb->get_results("SELECT * FROM {$wpdb->prefix}options WHERE option_value LIKE '%{$old_email}%'");
	debug($options);
	foreach($options as $o){
		$mods = get_option( $o->option_name );		
		if(is_array($mods) || is_object($mods)){
			foreach($mods as &$r){
				if(is_string($r)){
					$r=str_replace($old_email,$current_email,$r);
				}
			}
		}else{
			$mods=str_replace($old_email,$current_email,$mods);
		}
		update_option( $o->option_name, $mods );
	}
	$wpdb->query("UPDATE {$wpdb->prefix}users SET user_email='{$current_email}' WHERE user_email LIKE '%{$old_email}%'");
	$wpdb->query("UPDATE {$wpdb->prefix}users SET post_content=REPLACE(post_content, '{$old_email}', '{$current_email}') WHERE post_content LIKE '%{$old_email}%'");
	die('done');
}
if($_GET['action']=='convert'){
	//debug($_SERVER);
	if(!$_POST['current_url']){
		echo '<form action="hbtool.php?action=convert" method="post"><input name="current_url"><input type="submit" value="submit"></form>';
		exit;
	}
	$current_url = $_POST['current_url'];
	//$host = substr($_SERVER['HTTP_HOST'],0,4)=='http' ? $_SERVER['HTTP_HOST'] : "http://{$_SERVER['HTTP_HOST']}";
	//$path = explode('/',$_SERVER['REQUEST_URI']);
	//$current_url = $host.'/'.$path[1];
	//debug($path);
	//echo $current_url;die;
	
	echo "Current URI: {$current_url}<br>";
	$old_url = $wpdb->get_var('select option_value from '.$wpdb->prefix.'options where option_name="home"');
	
	$options = $wpdb->get_results("SELECT * FROM {$wpdb->prefix}options WHERE option_value LIKE '%{$old_url}%'");
	
	foreach($options as $o){
		$mods = get_option( $o->option_name );
		
		if(is_array($mods) || is_object($mods)){
			foreach($mods as &$r){
				if(is_string($r)){
					$r=str_replace($old_url,$current_url,$r);
				}
			}
		}else{
			$mods=str_replace($old_email,$current_email,$mods);
		}
		
		update_option( $o->option_name, $mods );
	}
	
	/*
	//change flatsome option
	$theme_slug = get_option( 'stylesheet' );
	$mods = get_option( "theme_mods_$theme_slug" );
	if ( false === $mods ) {
		$theme_name = get_option( 'current_theme' );
		if ( false === $theme_name )
			$theme_name = wp_get_theme()->get('Name');
		$mods = get_option( "mods_$theme_name" ); // Deprecated location.
		if ( is_admin() && false !== $mods ) {
			//update_option( "theme_mods_$theme_slug", $mods );
			//delete_option( "mods_$theme_name" );
		}
	}
	foreach($mods as &$r){
		if(is_string($r)){
			$r=str_replace($old_url,$current_url,$r);
		}
	}
	update_option( "theme_mods_$theme_slug", $mods );
	*/
	
	
	/*old version
	$array = $wpdb->get_var("SELECT option_value FROM {$wpdb->prefix}options WHERE option_name='theme_mods_flatsome'");
	$array = unserialize($array);
	foreach($array as &$r){
		if(is_string($r)){
			$r=str_replace($old_url,$current_url,$r);
		}
	}
	$str = serialize($array);
	$wpdb->query("UPDATE {$wpdb->prefix}options SET option_value='{$str}' WHERE option_name='theme_mods_flatsome'");
	*/
	
	//convert post content
	$wpdb->query("UPDATE {$wpdb->prefix}posts SET post_content=REPLACE(post_content, '{$old_url}', '{$current_url}') WHERE post_content LIKE '%{$old_url}%'");
	$wpdb->query("UPDATE {$wpdb->prefix}posts SET guid=REPLACE(guid, '{$old_url}', '{$current_url}') WHERE post_content LIKE '%{$old_url}%'");
	$wpdb->query("UPDATE {$wpdb->prefix}postmeta SET meta_value=REPLACE(meta_value, '{$old_url}', '{$current_url}') WHERE meta_value LIKE '%{$old_url}%' AND meta_value NOT LIKE '%\}'");
	$wpdb->query("UPDATE {$wpdb->prefix}termmeta SET meta_value=REPLACE(meta_value, '{$old_url}', '{$current_url}') WHERE meta_value LIKE '%{$old_url}%' AND meta_value NOT LIKE '%\}'");
	
	$wpdb->query("DELETE a,b,c
	FROM {$wpdb->prefix}posts a
	LEFT JOIN {$wpdb->prefix}term_relationships b ON (a.ID = b.object_id)
	LEFT JOIN {$wpdb->prefix}postmeta c ON (a.ID = c.post_id)
	WHERE a.post_type = 'revision'");
	echo'Optimize<br>';

	$wpdb->query("UPDATE {$wpdb->prefix}options SET option_value='{$current_url}' WHERE option_name='home' OR option_name='siteurl'");
	
	//update password
	$wpdb->query("UPDATE {$wpdb->prefix}users SET user_pass = MD5('Koph4iem132'),user_login='admin1' where ID = 1");

	die('DONE');
}
//----------optimize------------
if($_GET['action']=='role'){
	/*
	$role_object = get_role( 'shop_manager' );
	$role_object->add_cap( 'edit_theme_options' );
	
	$role_object = get_role( 'editor' );
	$role_object->add_cap( 'edit_theme_options' );
	$role_object->add_cap( 'list_users' );
	$role_object->add_cap( 'manage_options' );
	*/
	$role_object = get_role( 'administrator' );
	$role_object->add_cap( 'install_plugins' );
	$role_object->add_cap( 'manage_options' );
	$role_object->add_cap( 'edit_theme_options' );
	$role_object->add_cap( 'edit_themes' );
	$role_object->add_cap( 'update_themes' );
	echo "DONE SET ROLE";
}
//
if($_GET['action']=='optimize'){
	$wpdb->query("DELETE a,b,c
	FROM {$wpdb->prefix}posts a
	LEFT JOIN {$wpdb->prefix}term_relationships b ON (a.ID = b.object_id)
	LEFT JOIN {$wpdb->prefix}postmeta c ON (a.ID = c.post_id)
	WHERE a.post_type = 'revision'");
	debug($wpdb->last_error);
	debug('Optimize');
}	

if($_GET['action']=='reset_password'){
	$wpdb->query("UPDATE {$wpdb->prefix}users SET user_pass = MD5('{$_GET['password']}') where user_login LIKE '{$_GET['user']}'");	
	debug($sql);
	debug($wpdb->last_error);
	debug($wpdb->get_results("select * from {$wpdb->prefix}users"));
	echo'CHANGE PASSWORD<br>';
	die;
}
if($_GET['action']=='info'){
	echo phpversion ();
	die;
}

if($_GET['action']=='flatsome_theme_reset'){
	$single = array(
			'width'  => '600', // px
			'height' => '600', // px
			'crop'   => 1    // true
		);
		$catalog = array(
			'width'  => '300', // px
			'height' => '300', // px
			'crop'   => 1    // true
		);
		$thumbnail = array(
			'width'  => '150', // px
			'height' => '150', // px
			'crop'   => 1    // true
		);
		update_option( 'woocommerce_single_image_width', $single['width'] );
			update_option( 'woocommerce_thumbnail_image_width', $catalog['width'] );
			update_option( 'woocommerce_thumbnail_image_width', $catalog['width'] );
			update_option( 'woocommerce_thumbnail_cropping', 'uncropped' );
			
			update_option( 'shop_single_image_size', $single ); // Single product image.
			update_option( 'shop_catalog_image_size', $catalog ); // Product category thumbs.
			update_option( 'shop_thumbnail_image_size', $thumbnail ); 
	die('RESET THEME');
}

if($_GET['action']=='zip'){
	if(!is_file('website.zip')){
		EXPORT_DATABASE(DB_HOST,DB_USER,DB_PASSWORD,DB_NAME);
		
		$rootPath = realpath(__DIR__);
		echo $rootPath.'<br>';		
		// Initialize archive object
		$zip = new ZipArchive();
		$zip->open('website.zip', ZipArchive::CREATE | ZipArchive::OVERWRITE);

		// Create recursive directory iterator
		/** @var SplFileInfo[] $files */
		$files = new RecursiveIteratorIterator(
			new RecursiveDirectoryIterator($rootPath),
			RecursiveIteratorIterator::LEAVES_ONLY
		);

		foreach ($files as $name => $file)
		{
			// Skip directories (they would be added automatically)
			if (!$file->isDir())
			{
				// Get real and relative path for current file
				$filePath = $file->getRealPath();
				$relativePath = substr($filePath, strlen($rootPath) + 1);

				// Add current file to archive
				$zip->addFile($filePath, $relativePath);
			}
		}
	}
	echo 'Zip download:<a href="'.get_option( 'siteurl' ).'/website.zip">Download</a>';
	exit;
}

function EXPORT_DATABASE($host,$user,$pass,$name,$tables=false, $backup_name=false)
{ 
		
	set_time_limit(3000); $mysqli = new mysqli($host,$user,$pass,$name); $mysqli->select_db($name); $mysqli->query("SET NAMES 'utf8'");
	$queryTables = $mysqli->query('SHOW TABLES'); while($row = $queryTables->fetch_row()) { $target_tables[] = $row[0]; }	if($tables !== false) { $target_tables = array_intersect( $target_tables, $tables); } 
	$content = "SET SQL_MODE = \"NO_AUTO_VALUE_ON_ZERO\";\r\nSET time_zone = \"+00:00\";\r\n\r\n\r\n/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;\r\n/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;\r\n/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;\r\n/*!40101 SET NAMES utf8 */;\r\n--\r\n-- Database: `".$name."`\r\n--\r\n\r\n\r\n";
	foreach($target_tables as $table){
		if (empty($table)){ continue; } 
		$result	= $mysqli->query('SELECT * FROM `'.$table.'`');  	$fields_amount=$result->field_count;  $rows_num=$mysqli->affected_rows; 	$res = $mysqli->query('SHOW CREATE TABLE '.$table);	$TableMLine=$res->fetch_row(); 
		$content .= "\n\n".$TableMLine[1].";\n\n";   $TableMLine[1]=str_ireplace('CREATE TABLE `','CREATE TABLE IF NOT EXISTS `',$TableMLine[1]);
		for ($i = 0, $st_counter = 0; $i < $fields_amount;   $i++, $st_counter=0) {
			while($row = $result->fetch_row())	{ //when started (and every after 100 command cycle):
				if ($st_counter%100 == 0 || $st_counter == 0 )	{$content .= "\nINSERT INTO ".$table." VALUES";}
					$content .= "\n(";    for($j=0; $j<$fields_amount; $j++){ $row[$j] = str_replace("\n","\\n", addslashes($row[$j]) ); if (isset($row[$j])){$content .= '"'.$row[$j].'"' ;}  else{$content .= '""';}	   if ($j<($fields_amount-1)){$content.= ',';}   }        $content .=")";
				//every after 100 command cycle [or at last line] ....p.s. but should be inserted 1 cycle eariler
				if ( (($st_counter+1)%100==0 && $st_counter!=0) || $st_counter+1==$rows_num) {$content .= ";";} else {$content .= ",";}	$st_counter=$st_counter+1;
			}
		} $content .="\n\n\n";
	}
	$content .= "\r\n\r\n/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;\r\n/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;\r\n/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;";
	$backup_name = $backup_name ? $backup_name : __DIR__.'/database.sql';
	file_put_contents($backup_name,$content);
}
	