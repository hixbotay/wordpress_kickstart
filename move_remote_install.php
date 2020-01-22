<?php
ini_set('memory_limit', '-1');
ini_set('max_execution_time', 60000);

$list = file_get_contents('http://freelancerviet.net/api/get-none-install-list');
$list = json_decode($list);
echo '<pre>';print_r($list);
$failed= [];
foreach($list as $l){
	$url = 'http://demo.freelancerviet.net/'.$l.'/installer.php?v='.randomString(11);
	
	$t = microtime(1);
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, $url);
	curl_setopt($ch, CURLOPT_POST, true);
	curl_setopt($ch, CURLOPT_HEADER, true);
	curl_setopt($ch, CURLOPT_POSTFIELDS, [
		'DB_HOST'=>'localhost',
		'DB_USER'=>'demo',
		'DB_PASSWORD'=>'Koph4iem132',
		'admin_username'=>'admin1',
		'admin_password'=>'Koph4iem132',
		'change_url'=>'1',
		'delete_install'=>'1',
		'drop_db_existed' => '1'
	]);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		
	$response = curl_exec($ch);
	$httpcode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
	curl_close($ch);
	
	if($httpcode != '200'){
		write_log('install-failed.txt',$l.PHP_EOL.$response);	
		$failed[] = $l;
	}
	write_log('install.txt',$response.PHP_EOL.'excutetime '.(microtime(1) - $t));
	//echo $response.'<br>';
	
	
}
write_log('install-failed.txt','FAILED '.json_encode($failed));
echo 'FAILED '.json_encode($failed);
echo "FINISH\n";

function getNewFolder($file_name, $des){
    preg_match("|\d+|", $file_name, $m);  
    if(count($m)){
        $new_folder_name = preg_replace('/[0-9]+/', '', $file_name).''.reset($m);
    }else{
        $new_folder_name = $file_name;
    }
    if(is_file($des.'/'.$new_folder_name)){
        $m = count($m) ? (int)reset($m) : 0;
        $m++;
        return getNewFolder(preg_replace('/[0-9]+/', '', $file_name).$m,$des);
    }
    return $new_folder_name;
}

function getFiles($directory){
    $scanned_directory = array_diff(scandir($directory), array('..', '.'));
    return $scanned_directory;
}

function copyFolder($src,$dst) { 
    $dir = opendir($src); 
    @mkdir($dst); 
    while(false !== ( $file = readdir($dir)) ) { 
        if (( $file != '.' ) && ( $file != '..' )) { 
            if ( is_dir($src . '/' . $file) ) { 
                copyFolder($src . '/' . $file,$dst . '/' . $file); 
            } 
            else { 
                copy($src . '/' . $file,$dst . '/' . $file); 
            } 
        } 
    } 
    closedir($dir); 
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


function get_data_from_url($method,$url,$postFields=array(),$header=array(),$params=array()){
	
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, $url);
	if($method=='POST'){
		curl_setopt($ch, CURLOPT_POST, true);
		curl_setopt($ch, CURLOPT_POSTFIELDS, $postFields);
	}
	
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	curl_setopt($ch, CURLOPT_FOLLOWLOCATION, TRUE);
	if(!empty($params)){
		foreach($params as $key=>$val){
			curl_setopt($ch, $key, $val);
		}
	}
	
// 	debug($url);
	if(!empty($header)){
// 		debug($header);
		curl_setopt($ch, CURLOPT_HEADER, FALSE);
		curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
	}
		
	$response = curl_exec($ch);
	curl_close($ch);	
	return $response;
}

function write_log($log_file, $error){
	date_default_timezone_set('Asia/Ho_Chi_Minh');
	$date = date('d/m/Y H:i:s');
	$error = $date.": ".$error."\n--------------------\n";
	
	$log_file = "logs/".$log_file;
	if(filesize($log_file) > 1048576 || !file_exists($log_file)){
		$fh = fopen($log_file, 'w');
	}
	else{
		//echo "Append log to log file ".$log_file;
		$fh = fopen($log_file, 'a');
	}
	
	fwrite($fh, $error);
	fclose($fh);
}
function randomString($length){
		$order = '';
		$chars = "0123456789abcdefghijklmnopqrstwvxyzABCDEFGHIJKLMNOPQRSTWVXYZ";
		srand((double)microtime()*1000000);
		$i = 0;
		$total_length = strlen($chars);
		while ($i < $length) {
			$num = rand() % $total_length;
			$tmp = substr($chars, $num, 1);
			$order = $order . $tmp;
			$i++;
		}
		return $order;
// 		JFactory::getDbo()->getQuery()->;
	}