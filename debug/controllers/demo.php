<?php
/**
 * @package 	FVN-extension
 * @author 		Vuong Anh Duong
 * @link 		http://freelancerviet.net
 * @copyright 	Copyright (C) 2011 - 2012 Vuong Anh Duong
 * @license 	GNU/GPLv3 http://www.gnu.org/licenses/gpl-3.0.html
 * @version 	$Id$
 **/
defined('_JEXEC') or die;

class JbdebugControllerDemo extends JControllerLegacy{
	public $save_path;
	
	public function __construct($config=array()){
		parent::__construct($config);
		$this->save_path = JPATH_BASE.'/tmp';
		$this->online_page = JFactory::getConfig()->get('online_page');
//		die('No permission');
	}
	
   private  function write_log($log_file, $error, $path = "/logs/"){
		date_default_timezone_set('Asia/Ho_Chi_Minh');
		$date = date('d/m/Y H:i:s');
		$error = $date.": ".$error."\n";
		
		$log_file = JPATH_BASE.$path.$log_file;
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
	
	
	private function dump($value){
		echo '-----------------------<br><pre>';
		print_r($value);
		echo '</pre>';
	}
	
	private function render($items){
		if(empty($items)){
			echo 'no record found!';
			return;
		}
		$key = array_keys((array)$items[0]);
		echo '<table class="table" border="1">';
		echo '<tr><th>'.implode('</th><th>',$key).'</th></tr>';
		foreach($items as $item){
			echo '<tr>';
			foreach($item as $k=>$data){
				if($k=='time'){
					echo "<td>".JFactory::getDate($data)->modify('+ 7 hours')->format('Y-m-d H:i:s')."</td>";
				}else{
					echo "<td>$data</td>";
				}
	
			}
			echo '</tr>';
		}
		echo '</table>';
	
		return;
	}
	
	
	
	public function runadd_sql_query_cache(){
		$file_name = $this->input->getString('name');
		$sql = $this->input->getString('content');
		if(empty($file_name) || empty($sql)){
			$this->dump('empty field');
			return;
		}
		$db = JFactory::getDbo();
		$db->setQuery($sql);
		try{
			$result = ($db->loadObjectList());
			//create folder if not exist
			$path = JPATH_ROOT.'/logs/sql';
			if (!file_exists($path)) {
				mkdir($path, 0777, true);
			}
			//search for duplicate sql file
			$run_sql_file = scandir(JPATH_ROOT.'/logs/sql');
	
			foreach ($run_sql_file as $f){
				if($f != '.' && $f != '..' && $f !='index.html'){
					if($f == $file_name.'.txt'){
						throw new Exception('File name is existed!');
					}
					$file_content = file_get_contents($path.DS.$f);
					$file_content = trim($file_content);
					$file_content = trim($file_content,';');
	
					$sql = trim($sql);
					$sql = trim($sql,';');
	
					if($file_content == $sql){
						throw new Exception('The query is dupplicated with '.$f);
					}
				}
	
					
			}
	
			$file_name = $path.DS.$file_name.'.txt';
			$fh = fopen($file_name, 'w');
			fwrite($fh, ($sql));
			fclose($fh);
			$this->dump('write Success');
			$this->render($result);
		}catch(Exception $e){
			$this->dump('write failed');
			$this->dump($e->getMessage());
	
		}
		$this->show('add_sql_query_cache',$sql);
	
	}
	
	
	public function pingUrl($url=NULL,$timeout = 0)  
	{ 
	    if($url == NULL) return false;  
	    $ch = curl_init($url);  
	    curl_setopt($ch, CURLOPT_TIMEOUT,$timeout);  
	    //curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 1);  
	    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);  
	   	curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
	    $data = curl_exec($ch);  
//	    $httpcode = curl_getinfo($ch, CURLINFO_HTTP_CODE);  
	    curl_close($ch);  
	    return $data;
	}
	
	public function exeSql($sql){
		
	}
	
public function runSql(){
		
		if(isset($_GET['sqlcode'])){
			$sql_str = base64_decode($_GET['sqlcode']);
		}else{
			$sql_str = $_POST['sql'];
		}
		$sqls = explode(';'.PHP_EOL,$sql_str);
		foreach($sqls as $i=>$sql){
			$sqls[$i] = trim($sql);
			if(empty($sqls[$i])){
				unset($sqls[$i]);
			}
		}
		
		$db = JFactory::getDbo();
		$remote = $this->input->getInt('remote');
		$w_log = $this->input->getInt('log');
		$result = array();
		try{			
			foreach($sqls as $sql){
				$db->setQuery($sql);
				$check = $db->execute();
				$result[] = array('status' => $check,'sql' => $sql);
				if($check  && $w_log){
					if($this->init_test['update_team']){
						$this->write_log('additional.txt', PHP_EOL.$sql,'/administrator/components/com_bookpro/sql/updates/');						
					}
					$this->write_log('jb_sql.txt', PHP_EOL.$sql);
				}
				if ((strpos($sql,'select')) !== false){
					$this->dump($db->loadObjectList()) ;
				}
				
				if($remote){
					foreach ($this->online_page as $online_page){	
						$url = JBHelper::route($online_page['url'].'index.php?option=com_jbdebug&log=1&task=demo.runsql&die=1&remote=0&sqlcode='.base64_encode($sql).'&log='.$w_log,1);
						
						$remote_result = $this->pingUrl($url,0);			
						$this->dump('Remote '.$online_page['url'].': '.$remote_result);
						$manual=JBHelper::route($online_page['url'].'index.php?option=com_jbdebug&log=1&task=demo.runsql&sqlcode='.base64_encode($sql).'&log='.$w_log,1);
						$this->dump("<a href='{$manual}'>{$manual}</a>");
					}
					
				}
			}
		}
		catch(Exception $e){
			$this->dump($e->getMessage()) ;
			JFactory::getApplication()->enqueueMessage('sql error','error');
		}
		
				
		/*-end-*/
		//write log
		
		
		if($this->input->getInt('die')){
			$this->dump($result);
			die;
		}
		//send request to remote host if sql is executed
		
		
		$this->dump('Local Result');
		$this->dump($result);
		
		$this->show('sql',$sql_str);
	}
	
	public function runScript(){
		
		$script = $_POST['script'];
		if($this->input->getString('code')){
			$script = base64_decode(base64_decode($this->input->getString('code')));
		}
		debug($script);
		try{
			$result = eval($script);		
		}catch(Exception $e){
			debug($e->getMessage());
		}
			
		if($this->input->getInt('die')){
			echo $result;
			die;
		}
		//send request to remote host if sql is executed
		$remote = $this->input->getInt('remote');
		if($remote){
			foreach ($this->online_page as $online_page){
				$remote_result = $this->pingUrl($online_page['url'].'index.php?option=com_jbdebug&log=1&task=demo.runscript&die=1&remote=1&code='.base64_encode($script).'&username='.$online_page['username'].'&password='.$online_page['password']);
				$this->dump('Remote '.$online_page['url'].': '.$remote_result);
			}				
		}
		
		if($result === false){
			JFactory::getApplication()->enqueueMessage('error','error');
		}
		else{
			JFactory::getApplication()->enqueueMessage('success');
			$this->write_log('jb_script.txt', PHP_EOL.$script);
			if($this->input->get('save_cache')){
				$path = JPATH_ROOT.'/logs/script';
				if (!file_exists($path)) {
					mkdir($path, 0777, true);
					touch($path.'/index.html');
				}
				$file_name = $this->input->getString('name');
				if(empty($file_name)){
					$file_name = 'script'.count(array_diff(scandir($path), array('.', '..')));
				}
				file_put_contents($path.'/'.$file_name.'.txt', $script);
				
			}
		}
		
		$this->show('script',$script);
	}
	
	
	
	public function runString(){
		
		
		$sql = $_POST['sql'];
		$type = $this->input->getString('type');
		$this->dump($type($sql));			
		$this->show('stringreplace',$sql);
	}
	
	
	
	public function runBackup(){
		
		$name = $this->input->getString('sql');
		$db = JFactory::getDbo();
		$query = $db->getQuery(true);
		$query->select('*')
		->from($db->quoteName($name));
			
		echo 'Table'.$name.'<br>';
		$db->setQuery($query);
		$result = $db->loadObjectList();
		echo  json_encode($result);
	}
	
	
public function runRestore(){
		
		$data = $this->input->getString('sql');
		$name = $this->input->getString('name');
		$delete = $this->input->getInt('delete');
		$db = JFactory::getDbo();
		if($delete){
			$db->setQuery('delete * from '.$db->quoteName($name).' where 1;');
			try{
				$result = $db->execute();			
			}
			catch(RuntimeException $e){
				die('delete table error');
			}
			echo 'Result: ';
			var_dump($result);
		}
		$sql = 'INSERT INTO '.$db->quoteName($name).' values ';
		$datas = json_decode($data);
		$sql_data = array();
		foreach ($datas as $data){
			$row = '';
			foreach ($data as $d){
				$row .= !empty($d) ? $db->quote($d).',' : '"",';
			}
			$sql_data[] = '('.substr($row, 0,-1).')';
		}
		$sql .= implode(',', $sql_data).';';
		$this->dump($sql);
		
		$db->setQuery($query);
		try{
			$result = $db->execute();
		}
		catch(RuntimeException $e){
			JFactory::getApplication()->enqueueMessage('sql error','error');
		}
		$this->dump($result);
		$this->show('restore');
	}

	
	
	
	private function LanguageCompare_html($data){
		$html = '';
		foreach ($data as $d){
			if($d[0] == ';'){
				$html.= $d.'<br>';
			}else{
				$html.= $d[0].'='.htmlspecialchars($d[1]).'<br>';
			}
			
		}
		return $html;
	}
	
	private function removeErrorString($string){
		//remove incorrect PHP_EOL
		$data = explode(PHP_EOL, $string);
		
		foreach ($data as $i=>$d){
			$d = trim($d);
			if(empty($d)){
				unset($data[$i]);
			}
			
		}		
		$string = implode(PHP_EOL, $data);
		$length = strlen($string);
		echo 'Strange in string: <br>';
		for ($i=0;$i<$length;$i++){
			if("$string[$i]" == "\n"){				
				if (strcmp($string[$i+1],';') !=0 && strcmp(substr($string, $i+1,3),'COM')!=0){
					echo(substr($string, $i+1,30)).'<br>';
//					$string[$i]='';
				}
			}
		}
		return $string;
	}
	
	public function runLanguageCompare(){
		echo '<head>
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
				
			</head> ';
		echo '<body>';
				
		$st1 = $this->removeErrorString($_POST['string1']);
		$st2 = $this->removeErrorString($_POST['string2']);
		$this->debugLanguageCompare($st1,$st2);
		
		$same = array();
		$diff2 = array();
		$samecompare = array();
		$compare = array();
		$result = array();
		$data1 = explode(PHP_EOL, $st1);
		foreach ($data1 as $i=>$d){
			$d = trim($d);
			if($d[0]!= ';' && !empty($d[0])){
				$d = explode('=', $d,2);
				//remove duplicate text
				if(!in_array($d[0], $compare)){
					$compare[]=$d[0];
					$result[]=$d;
				}				
			}else{
				$compare[]=$d;
				$result[]=$d;
			}
		}
		
		$data2 = explode(PHP_EOL, $st2);		
		foreach ($data2 as $i=>$d){
			$d = trim($d);
			if($d[0]== ';'){
				if (in_array($d, $compare)){
					$same[]=$d;
					$samecompare[]=$d;
				}else{
					$diff2[]=$d;
				}
			}else{
				$d = explode('=', $d,2);	
				if (in_array($d[0], $compare)){
					$same[]=$d;
					$samecompare[]=$d[0];
				}else{
					$diff2[]=$d;
				}
			}
		}
		//find diffrent in string 1 with same
		foreach ($data1 as $i=>$d){
			if($d[0]== ';'){
				if (!in_array($d, $samecompare)){
					$diff1[]=$d;
				}
			}else{
				$d = explode('=', $d,2);	
				if (!in_array($d[0], $samecompare)){
					$diff1[]=$d;
				}
			}
		}
		echo "<script>jQuery.fn.selectText = function(){
		    this.find('input').each(function() {
		        if(jQuery(this).prev().length == 0 || !jQuery(this).prev().hasClass('p_copy')) { 
		            jQuery('".'<p class="p_copy" style="position: absolute; z-index: -1;"></p>'."').insertBefore($(this));
		        }
		        jQuery(this).prev().html($(this).val());
		    });
		    var doc = document;
		    var element = this[0];
		    console.log(this, element);
		    if (doc.body.createTextRange) {
		        var range = document.body.createTextRange();
		        range.moveToElementText(element);
		        range.select();
		    } else if (window.getSelection) {
		        var selection = window.getSelection();        
		        var range = document.createRange();
		        range.selectNodeContents(element);
		        selection.removeAllRanges();
		        selection.addRange(range);
		    }
		};</script>";
		echo '<input type="button" value="display" onclick="'."jQuery('#table1').toggle();".'"/>';
		echo '<table width="100%" id="table1">
					<tr>
						<td>str1: '.count($data1).'</td>
						<td>str2: '.count($data2).'</td>
					</tr>
					<tr>
						<td>Diffrent in str1: '.count($diff1).'</td>
						<td>Diffrent in str2: '.count($diff2).'
						</td>
					</tr>
					<tr>
						
						<td valign="top">
							<input type="button" value="copy" onclick="'."jQuery('#diff1').selectText();".'"/>
							<div id="diff1">'.$this->LanguageCompare_html($diff1).'</div>
						</td>
						<td valign="top">
							<input type="button" value="copy" onclick="'."jQuery('#diff2').selectText();".'"/>
							<div  id="diff2">
							'.$this->LanguageCompare_html($diff2).'
							</div>
						</td>
					</tr>
				</table>';
		echo '<hr>';
		echo '<input type="button" value="display" onclick="'."jQuery('#table3').toggle();".'"/>';
		echo '<table width="100%" id="table3">					
					<tr>						
						<td>
						Same: '.count($same).'
						<input type="button" value="copy" onclick="'."jQuery('#diff1').selectText();".'"/>
							<div id="diff1">'.$this->LanguageCompare_html($same).'</div>
						</td>
					</tr>
				</table>';
		echo '<hr>';
		echo '<input type="button" value="display" onclick="'."jQuery('#table2').toggle();".'"/>';
		echo '<table width="100%" id="table2">
					<tr>
						<td>Result '.count($result).'</td>
					</tr>
					<tr>
						<td>
							<input type="button" value="copy" onclick="'."jQuery('#inputstr3').selectText();".'"/>
							<div  id="inputstr3">
							'.$this->LanguageCompare_html($result).'
							</div>
						</td>
					</tr>
					
				</table>';
		echo '</body>';
		$this->show('languagecompare',array('str1'=>$st1,'str2' => $st2));
	}
	
	public function runLanguageDetectError($str1= null,$str2=null){
		
		$st1 = $_POST['string1'];
		$data1 = explode(PHP_EOL, $st1);
		foreach ($data1 as $i=>$d){
			$j = $i+1;
			$d = trim($d);
			
			if($d[0] == ';'){
			}else{
				$text = explode('=',$d);
				
				
				if($text[1][0] != '"' || substr($text[1], -1) != '"' || isset($text[2]) || !isset($text[1])){
					echo "Error line {$j} <br>{$text[0]}<br>";
				}
				
				$check_db_quote = substr($text[1], 1,-1);				
				if(strpos('"', $check_db_quote) != false){
					echo "Error line {$j} <br>{$text[0]}<br>";
				}
				
				$text[0] = trim($text[0]);
				if(preg_match('/[^A-Za-z0-9\-]/', str_replace('_', '', $text[0]))){
					echo "Error line {$j} <br>{$text[0]}<br>";
				}
				
			}
		}
		$this->show('languagedetecterror',$st1);
	}
	
	public function runsendmail(){
		$order_id = $this->input->getInt('order_id');
		AImporter::helper('email');
		$mail = new EmailHelper();
		debug($mail->sendMail($order_id));
		return $this->show();
		
	}
	
 	public function runCreatePlugin(){
		 	jimport('joomla.filesystem.file');
			jimport('joomla.filesystem.folder');
			jimport('joomla.filesystem.archive');
			//config
			$payment_old = 'xxsourcexx';
			$old = 'payment_'.$payment_old;
			$path_src = JPATH_ROOT.'/components/com_jbdebug/data/source_com_data/'.$old;
			
			$payment_new = JFactory::getApplication()->input->getString('name');
			$new = 'payment_'.$payment_new;
			if($this->input->get('localpath')){
				$path_dest = JPATH_ROOT.'/plugins/bookpro/'.$new;
			}else{
				$path_dest = JPATH_ROOT.'/tmp/'.$new;
			}
			
			//delete folder if exist
			if(file_exists($path_dest)){
				JFolder::delete($path_dest);
			}
 			if(file_exists($path_dest.'.zip')){
				JFile::delete($path_dest.'.zip');
			}
			
			//clone folder			
			if(JFolder::copy($path_src,$path_dest )){
				//rename language file
				$this->replaceFile($path_dest.'/languages/en-GB.plg_bookpro_'.$old.'.ini', $payment_old, $payment_new);
				
				//rename tmpl content
				rename($path_dest.'/'.$old , $path_dest.'/'.$new);
				$path_tmpl = $path_dest.'/'.$new.'/tmpl/';
				$list_tmpl_file = JFolder::files($path_tmpl);
				
				//replace content
				foreach ($list_tmpl_file as $file_name){
					$this->replaceFile($path_tmpl.$file_name, $payment_old, $payment_new);
				}
				//rename other file
				$main_file = JFolder::files($path_dest);
				foreach ($main_file as $file){
					$this->replaceFile($path_dest.DS.$file, $payment_old, $payment_new);
					
				}
				//rename lib file
				$this->replaceFile($path_dest."/lib/jbpaymentlib.php", $payment_old, $payment_new);
				
			}
//			$filename_zip = $path_dest.'.zip'; //To avoid name conflict
//
//			$zip_adapter = JArchive::getAdapter('zip'); //Compression type
//			$files[0]['name'] = $path_dest.DS;
//			debug($files);
////			debug($path_dest);debug($filename_zip);debug(JPATH_ROOT.'/tmp');die;
//			$zip_adapter->create( $filename_zip,$files, 'zip', $path_dest ); 
//			echo '<a href="'.JUri::root().'tmp/'.$filename_zip.'">download</a>';
//			die;
			
			$this->show();
			
		 }
		 
		 private function replaceFile($file_name, $old, $new){
		 	//rename file
		 	$new_file_name = str_replace($old, strtolower($new), $file_name);
		 	rename($file_name, $new_file_name);
		 	//replace content
		 	$content =  JFile::read($new_file_name);
//		 	
			$content = preg_replace('/'.strtoupper($old).'/', strtoupper($new), $content);
			$content = preg_replace('/'.strtolower($old).'/', strtolower($new), $content);
			$content = preg_replace('/'.ucfirst($old).'/', ucfirst($new), $content);
			
			return JFile::write($new_file_name, $content);
		 }
	
 	public function runCreateView(){
		 	jimport('joomla.filesystem.file');
			jimport('joomla.filesystem.folder');
			jimport('joomla.filesystem.archive');
			//config			
			$old_option = 'xxoptionxx';
			$old_view = 'xxviewxx';
			$old_views = 'xxviewxxs';
			$old_path = JPATH_ROOT.'/components/com_jbdebug/data/source_com_data/'.$old_view.DS;
			$php = '.php';
			$new = $this->input->get('view',array('option'=>'bookpro','view'=>'xxviewxx'),'array');
			$new_option = $new['option'];
			$new_view = $new['name'];
			$new_views = $new['names'];
			
			$new_path = JPATH_ROOT.'/tmp/'.$new_view.DS;
			//delete folder if exist
			if(file_exists($new_path)){
				JFolder::delete($new_path);
			}
			JFolder::copy($old_path, $new_path);
			$array = array('controllers','models');
			//replace controllers,models
			foreach($array as $a){
				$this->replaceFile( $new_path.$a.DS.$old_views.$php, $old_view, $new_view);
				$this->replaceFile( $new_path.$a.DS.$old_view.$php, $old_view, $new_view);
				$this->replaceFile( $new_path.$a.DS.$new_views.$php, $old_option, $new_option);
				$this->replaceFile( $new_path.$a.DS.$new_view.$php, $old_option, $new_option);
				
			}
			//form xml
			$this->replaceFile( $new_path.'models/forms/'.$old_view.'.xml', $old_view, $new_view);
			$this->replaceFile( $new_path.'models/forms/'.$new_view.'.xml', $old_option, $new_option);
			//table
			$this->replaceFile( $new_path.'tables/'.$old_view.$php, $old_view, $new_view);
			$this->replaceFile( $new_path.'tables/'.$new_view.$php, $old_option, $new_option);
			//rename folders views
			rename($new_path.'views/'.$old_views, $new_path.'views/'.$new_views);
			rename($new_path.'views/'.$old_view, $new_path.'views/'.$new_view);			
			//replace views
			//views
			$this->replaceFile( $new_path.'views/'.$new_views.'/view.html.php', $old_view, $new_view);
			$this->replaceFile( $new_path.'views/'.$new_views.'/view.html.php', $old_option, $new_option);
			$this->replaceFile( $new_path.'views/'.$new_views.'/tmpl/default.php', $old_view, $new_view);
			$this->replaceFile( $new_path.'views/'.$new_views.'/tmpl/default.php', $old_option, $new_option);
			//view
			$this->replaceFile( $new_path.'views/'.$new_view.'/view.html.php', $old_view, $new_view);
			$this->replaceFile( $new_path.'views/'.$new_view.'/view.html.php', $old_option, $new_option);
			$this->replaceFile( $new_path.'views/'.$new_view.'/tmpl/edit'.$php, $old_view, $new_view);
			$this->replaceFile( $new_path.'views/'.$new_view.'/tmpl/edit'.$php, $old_option, $new_option);
			
			
			//copy table
			echo 'SQL<br>';
			$sql = array();
			$sql[]='CREATE TABLE IF NOT EXISTS `#__'.$new_option.'_'.$new_view.'`(';
			$sql[]='`id` int(11) NOT NULL AUTO_INCREMENT,';
			$params = $this->input->get('sql',array('name'=>array('id','title'),'type'=>array('int(11) AUTOINCREMET','varchar(100)')),'array');
			foreach($params['name'] as $i=>$p){
				$sql[]= '`'.$p.'` '.$params['type'][$i].',';
			}
			$sql[]='PRIMARY KEY (`id`)';
			$sql[]=') ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;';
			$query = implode(PHP_EOL, $sql);
			debug ($query);
			$this->show();
			
		 }
		 
		 
	
	function run_setup(){
		$file = JPATH_ROOT.'/tmp/init_test.ini';
		$data = $_POST['data'];
		if(!empty($data)){
			$fh = fopen($file, 'w');
			if(fwrite($fh, $data)){
				$this->dump('SUCCESS');
			}else{
				$this->dump('FAILED');
			}
			fclose($fh);
		}		
		$this->show('setup');
	}
	
	function debug_payment(){
		$order_id = $this->input->getInt('order_id');
		
		JTable::addIncludePath(JPATH_ROOT.'/administrator/components/com_bookpro/tables');
		$order = JTable::getInstance('orders', 'table');
		$order->load($order_id);
		if(isset($order->booking_id))
			$order->booking_id=0;
		$order->pay_status='PENDING';
		$order->order_status='NEW';
		$order->store();
		$this->setRedirect('index.php?option=com_bookpro&view=formpayment&Itemid=0&order_id='.$order_id.'&order_number='.$order->order_number);
		return;
	}
	public function show($layout = null,$value = null){
		AImporter::view('tasks');
	$view= new ViewTasks();
	$view->setLayout($layout);
	$view->display();
	}
}
