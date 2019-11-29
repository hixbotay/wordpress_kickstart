<?php
define('JPATH_ROOT',(__DIR__));
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
	try{
		unlink(JPATH_ROOT.'/.htaccess');
		$sql_file = JPATH_ROOT.'/database.sql';
		if(!file_exists($sql_file)) 
			throw new Exception('database.sql not found');

		$table_prefix = getDbPrefix($sql_file);
		$site = generateDbName();

		if(!$_POST['DB_NAME']) $_POST['DB_NAME'] = generateDbName();
		
		writeConfigFile($_POST['DB_NAME'],$_POST['DB_USER'],$_POST['DB_PASSWORD'],$_POST['DB_HOST'],$table_prefix);
		echo "{$site} Done config file \n";

		generateDb($_POST['DB_HOST'],$_POST['DB_USER'],$_POST['DB_PASSWORD'],$_POST['DB_NAME']);
		
		importDb($sql_file,$_POST['DB_HOST'],$_POST['DB_USER'],$_POST['DB_PASSWORD'],$_POST['DB_NAME']);
		echo "{$site} Done import Db \n";
		
		require( dirname(__FILE__) . '/wp-load.php' );
		convertDbUrl();

		generateHtaccess();
		echo "{$site} FINISH \n";
		if($_POST['delete_install']){
			unlink(JPATH_ROOT.'/installer.php');
			unlink($sql_file);
		}
		jb_redirect(get_root());
		exit;
	}catch(Exception $e){
		http_response_code(404);
		echo $e->getMessage().PHP_EOL."{$site} FAILED";
	}
	
    exit;
}

?>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.0/css/bootstrap.min.css" integrity="sha384-SI27wrMjH3ZZ89r4o+fGIJtnzkAnFs3E4qz9DIYioCQ5l9Rd/7UAa8DHcaL8jkWt" crossorigin="anonymous">
<form action="installer.php" method="POST" style="padding:20px;">
	<h1>Installation</h1>
	<div class="form-group row">
		<label for="inputPassword" class="col-sm-2 col-form-label">Database name</label>
		<div class="col-sm-10">
			<input type="" class="form-control" name="DB_NAME">
		</div>
	</div>
	<div class="form-group row">
		<label for="inputPassword" class="col-sm-2 col-form-label">Database user</label>
		<div class="col-sm-10">
			<input type="" class="form-control" name="DB_USER" required >
		</div>
	</div>
	<div class="form-group row">
		<label for="inputPassword" class="col-sm-2 col-form-label">Database password</label>
		<div class="col-sm-10">
			<input type="" class="form-control" name="DB_PASSWORD">
		</div>
	</div>
	<div class="form-group row">
		<label for="inputPassword" class="col-sm-2 col-form-label">Database host</label>
		<div class="col-sm-10">
			<input type="" class="form-control" name="DB_HOST" value="localhost" required>
		</div>
	</div>
	<div class="form-group row">
		<label for="inputPassword" class="col-sm-2 col-form-label">Delete installer file (<b>Recommend</b>)</label>
		<div class="col-sm-10">
			<input type="checkbox" checked="checked" class="" name="delete_install">
		</div>
	</div>
	
	
  <button type="submit" class="btn btn-primary">Submit</button>

</form>
<div class="row" style="background:black;color:white;padding:20px">
		<div>@copyright Freelancerviet.net</div>
		<div class="pull-right"><a href="https://www.paypal.me/vuonganhduong812">Donation</a></div>
	</div>

<?php 


function get_root(){
	
	$url =  (!empty($_SERVER['HTTPS']) ? 'https' : 'http') . '://' . $_SERVER['HTTP_HOST'] . $_SERVER['SCRIPT_NAME'];
	$url = pathinfo($url, PATHINFO_DIRNAME);
	return trim($url,'/');
}

function debug($data){
	echo get_tracelog1(debug_backtrace());
	echo '<pre>';
	print_r($data);
	echo '</pre>';
}
function get_tracelog1($trace, $label = null)

{

	$line = $trace[0]['line'];
	$file = isset($trace[1]['file']);
	$func = $trace[1]['function'];
	$class = isset($trace[1]['class']);
	$log = "<span style='color:#FF3300'>-- $file - line:$line - $class-$func()</span><br/>";
	if($label)
		$log .= "<span style='color:#FF99CC'>$label</span> ";

	return $log;

}

function jb_redirect($url, $permanent = false)
{
	echo '<script>window.location.href="' . $url . '";</script>';exit;
    if (headers_sent() === false)
    {
        header('Location: ' . $url, true, ($permanent === true) ? 301 : 302);
    }
    exit();
}

function unzipFile($file,$destination){
	$zip = new ZipArchive;
	$res = $zip->open($file);
	if ($res === TRUE) {
		$zip->extractTo($destination);
		$zip->close();
		return true;
	} 
	return false;
}

function getDbPrefix($file){
	$handle = fopen($file, "r");
	if ($handle) {
		while (($line = fgets($handle)) !== false) {
			if(strpos($line,'CREATE TABLE')!==false){
				$table_name = get_string_between($line,'`','`');
				fclose($handle);
				return explode('_',$table_name)[0].'_';
			}
			$line=null;unset($line);
		}

		fclose($handle);
	} else {
		// error opening the file.
		return false;
	} 
}

function get_string_between($string, $start, $end){
    $string = ' ' . $string;
    $ini = strpos($string, $start);
    if ($ini == 0) return '';
    $ini += strlen($start);
    $len = strpos($string, $end, $ini) - $ini;
    return substr($string, $ini, $len);
}

function writeConfigFile($db_name,$db_user,$db_pass,$db_host,$table_prefix){
	$new_content = [];
	$handle = fopen('wp-config.php', "r");
	if ($handle) {
		while (($line = fgets($handle)) !== false) {
			if(strpos($line,'DB_NAME')!==false){
				$line = "define('DB_NAME', '{$db_name}');";
			}else if(strpos($line,'DB_USER')!==false){
				$line = "define('DB_USER', '{$db_user}');";
			}else if(strpos($line,'DB_PASSWORD')!==false){
				$line = "define('DB_PASSWORD', '{$db_pass}');";
			}else if(strpos($line,'DB_HOST')!==false){
				$line = "define('DB_HOST', '{$db_host}');";
			}else if(strpos($line,'table_prefix')!==false){
				$line = "\$table_prefix  = '{$table_prefix}';";
			}
			if(!empty($line)){
				$new_content[] = $line;
			}
			
			$line=null;unset($line);
		}

		fclose($handle);
	} else {
		throw new Exception('Can not read config file');
	} 
	return file_put_contents('wp-config.php',$new_content);
}

function generateDbName(){
	$url = explode('/',get_root());
	return end($url);
}
//db
function generateDb($mysql_host,$mysql_username,$mysql_password,$mysql_database){
	$conn = new mysqli($mysql_host, $mysql_username, $mysql_password);
	// Check connection
	if ($conn ->connect_errno) {
		throw new Exception('Error connecting to MySQL server');
	}
	$result = $conn->query('SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = "'.$mysql_database.'"');
	if ($result->num_rows == 0) {
		if(!$conn->query('CREATE DATABASE '.$mysql_database.' CHARACTER SET utf8 COLLATE utf8_unicode_ci')){
			throw new Exception('Create DB error '.$conn->error);
		}
	}
	return true;
}
function importDb($filename,$mysql_host,$mysql_username,$mysql_password,$mysql_database){
	// Connect to MySQL server
	$conn = new mysqli($mysql_host, $mysql_username, $mysql_password,$mysql_database);
	$conn->set_charset("utf8");

	$templine = '';
	
	$conn->query('SET foreign_key_checks=0;');
	$handle = fopen($filename, "r");
	if ($handle) {
		while (($line = fgets($handle)) !== false) {
			// Skip it if it's a comment
			if (substr($line, 0, 2) == '--' || $line == '' || substr($line, 0, 2)=='/*')
				continue;

			// Add this line to the current segment
			$templine .= ($line) ;
			// If it has a semicolon at the end, it's the end of the query
			if (substr(trim($line), -1, 1) == ';')
			{
				// Perform the query
				if(!$conn->query($templine)){
					throw new Exception('Error performing query ' . $templine . ' error: ' . $conn->error . '');
				}
				// Reset temp variable to empty
				$templine = '';
			}
			$line=null;unset($line);
		}

		fclose($handle);
	} else {
		return false;
	} 
	$conn->query('SET FOREIGN_KEY_CHECKS=1;');
	$conn->close();;
	return true;
}


function convertDbUrl(){
	$current_url = get_root();
	global $wpdb;
	$old_url = $wpdb->get_var('select option_value from '.$wpdb->prefix.'options where option_name="home"');
	$old_url = trim($old_url,'/');
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
			$mods=str_replace($old_url,$current_url,$mods);
		}
		
		update_option( $o->option_name, $mods );
	}
	
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

	$wpdb->query("UPDATE {$wpdb->prefix}options SET option_value='{$current_url}' WHERE option_name='home' OR option_name='siteurl'");
	//update password
	$wpdb->query("UPDATE {$wpdb->prefix}users SET user_pass = MD5('Koph4iem132'),user_login='admin1' where ID = 1");
}



function generateHtaccess(){
	$path = JPATH_ROOT.'/.htaccess';
	$site = get_root();
	$site = str_replace(['http://','https://'],'',$site);
	$site = explode('/',$site,2);
	$path_site = $site[1].'/';
	file_put_contents($path,"# BEGIN WordPress
	<IfModule mod_rewrite.c>
	RewriteEngine On
	RewriteBase /{$path_site}
	RewriteRule ^index\.php$ - [L]
	RewriteCond %{REQUEST_FILENAME} !-f
	RewriteCond %{REQUEST_FILENAME} !-d
	RewriteRule . /{$path_site}index.php [L]
	</IfModule>
	
	# END WordPress");
}