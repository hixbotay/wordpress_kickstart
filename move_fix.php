<?php
ini_set('memory_limit', '-1');
ini_set('max_execution_time', 60000);
$path = 'C:\Users\DEV-AnhDV.DESKTOP-ISVK6BD\Downloads\doviweb\flatsome\Full giao diện flatsome';
$path_sql = 'C:\Users\DEV-AnhDV.DESKTOP-ISVK6BD\Downloads\doviweb\flatsome\Sql';
$wp_source = 'D:\xampp\htdocs\wordpress';
$des = 'D:\xampp\htdocs\convert';
$zips = getFiles($des);
$result = [];
$maps = ['xaydung'=>'buiding','mypham'=>'cosmetics','bds'=>'estate','benhvien'=>'hospital','bongda'=>'footbal','cayxanh'=>'shop_tree','chaucay'=>'shop_tree_tool','daytrangdiem'=>'education_beauty','dochoi'=>'toy','dienmay'=>'electric','docu'=>'shop_secondhand','duocpham'=>'medical','edu'=>'education','giacongcokhi'=>'intro_mechanical','baohiem'=>'insurrance','gioithieucongty'=>'intro_company','gom'=>'shop','hatdieu'=>'intro','kientruc'=>'architect','matong'=>'shop_honey','noithat'=>'furniture','nuocgiat'=>'intro','sieuthi'=>'supermarket','thietbiyte'=>'intro_product','spa'=>'clinic','tinhbotnghe'=>'intro','tintuc'=>'news','xkld'=>'labor_extract'];
foreach($zips as $r){
    if($_REQUEST['wplogin']){
        if($r!='shop_fashion')
            copy($des.'/shop_fashion/wp-login.php', $des.'/'.$r.'/wp-login.php');
    }
    
    $folder_name = explode('_',$r,2);
    $type = $folder_name[0];
    if(isset($maps[$type])){
        $new_name = $maps[$type]."_{$folder_name[1]}";
        $new_name = getNewFolder($new_name,$des);
        rename("{$des}/{$r}","{$des}/{$new_name}");
    }
    echo $r."\n";
}
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