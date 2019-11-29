<?php
ini_set('memory_limit', '-1');
ini_set('max_execution_time', 60000);
$path = 'C:\Users\DEV-AnhDV.DESKTOP-ISVK6BD\Downloads\doviweb\flatsome\Full giao diện flatsome';
$path_sql = 'C:\Users\DEV-AnhDV.DESKTOP-ISVK6BD\Downloads\doviweb\flatsome\Sql';
$wp_source = 'D:\xampp\htdocs\wordpress';
$des = 'D:\xampp\htdocs\convert';
$zips = getFiles($path);
$result = [];
foreach($zips as $r){
    $file_name = substr($r,0,-4);
    $new_folder_name = getNewFolder($file_name,$des);
    $sql_file = $path_sql.'/admin_'.$file_name.'.sql';
    if(is_file($sql_file)){
        copyFolder($wp_source,$des.'/'.$new_folder_name);
        copy($sql_file, $des.'/'.$new_folder_name.'/database.sql');
        copy($path.'/'.$r, $des.'/'.$new_folder_name.'/wp-content/content.zip');
        unzipFile($des.'/'.$new_folder_name.'/wp-content/content.zip',$des.'/'.$new_folder_name.'/wp-content/');
        unlink($des.'/'.$new_folder_name.'/wp-content/content.zip');
        echo "Finish {$new_folder_name}\n";
    }else{
        echo "File {$r} ERROR\n";
    }
    
}
echo "FINISH\n";

function getNewFolder($file_name, $des){
    preg_match("|\d+|", $file_name, $m);  
    if(count($m)){
        $new_folder_name = preg_replace('/[0-9]+/', '', $file_name).'_demo'.reset($m);
    }else{
        $new_folder_name = $file_name.'_demo1';
    }
    if(is_file($des.'/'.$new_folder_name)){
        $m = reset($m);
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