<?php
class CsvFileHelper{
	
	static function read($filepath){
		$file = fopen($filepath,"r");
		$data = fgetcsv($file);
		fclose($file);
		return $data;
	}
	
	static function write($filepath, array $fields, $header = true){
		if ( $fh = fopen($filepath, 'w') ) {
			if($header){
				fputcsv($fh, array_keys($fields[0]));
			}
			foreach ($fields as $data) {
			    fputcsv($fh, (array)$data);
			}				
			fclose($fh);
			return true;
		}
		return false;
	}
	
	static function download($datas,$name,$header = true) {	
		try{				
			// Open the output stream
			$fh = fopen('php://output', 'w');
// 			fputs($fh, $bom =( chr(0xEF) . chr(0xBB) . chr(0xBF) ));
// 			fputs($fh, pack("CCC",0xef,0xbb,0xbf)); 
// 			fputs($fh, chr(255) . chr(254)); 
			
			// Start output buffering (to capture stream contents)
			ob_start();
			
			if($header){
				fputcsv($fh, array_keys(reset($datas)));
			}
			foreach ($datas as $data) {			
				fputcsv($fh, $data);
			}
			fputs( $fh, "\xEF\xBB\xBF" );
			fputs($fh, pack("CCC",0xef,0xbb,0xbf)); 
			$string = ob_get_clean();
			
			header('Content-Encoding: UTF-8');
			header('Content-Type: application/octet-stream charset=UTF-8');
			header('Content-Disposition: attachment; filename="' . $name . '.csv";');
			header('Content-Transfer-Encoding: binary');
			header('Pragma: public');
			header('Expires: 0');
			header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
			header('Cache-Control: private', false);
			//stream_encoding($fh, 'UTF-8'); 
			// Stream the CSV data
			echo $string;
			//echo chr(255) . chr(254) . mb_convert_encoding($string, 'UTF-16LE', 'UTF-8');
			exit;
		}
		catch( RuntimeException $e ) {			
			JError::raiseError ( 500, $e->getMessage () );
			return false;
		}
		
	}
	
	static function fputcsv2 ($filepath, array $fields, $delimiter = ',', $enclosure = '"', $mysql_null = false) {
		if ( $fh = fopen($filepath, 'w') ) {
			$delimiter_esc = preg_quote($delimiter, '/');
			$enclosure_esc = preg_quote($enclosure, '/');
			
			$output = array();
			foreach ($fields as $field) {
				if ($field === null && $mysql_null) {
					$output[] = 'NULL';
					continue;
				}
				$field = (array)$field;
				$output[] = preg_match("/(?:${delimiter_esc}|${enclosure_esc}|\s)/", $field) ? (
						$enclosure . str_replace($enclosure, $enclosure . $enclosure, $field) . $enclosure
						) : $field;
			}
			
			fwrite($fh, join($delimiter, $output) . "\n");
			fclose($fh);
			return true;
		}
		return false;
		
	}
	
	
	static function mssafe_csv($filepath, $data, $header = array())
	{
		if ( $fp = fopen($filepath, 'w') ) {
			$show_header = true;
			if ( empty($header) ) {
				$show_header = false;
				reset($data);
				$line = current($data);
				if ( !empty($line) ) {
					reset($line);
					$first = current($line);
					if ( substr($first, 0, 2) == 'ID' && !preg_match('/["\\s,]/', $first) ) {
						array_shift($data);
						array_shift($line);
						if ( empty($line) ) {
							fwrite($fp, "\"{$first}\"\r\n");
						} else {
							fwrite($fp, "\"{$first}\",");
							fputcsv($fp, $line);
							fseek($fp, -1, SEEK_CUR);
							fwrite($fp, "\r\n");
						}
					}
				}
			} else {
				reset($header);
				$first = current($header);
				if ( substr($first, 0, 2) == 'ID' && !preg_match('/["\\s,]/', $first) ) {
					array_shift($header);
					if ( empty($header) ) {
						$show_header = false;
						fwrite($fp, "\"{$first}\"\r\n");
					} else {
						fwrite($fp, "\"{$first}\",");
					}
				}
			}
			if ( $show_header ) {
				fputcsv($fp, $header);
				fseek($fp, -1, SEEK_CUR);
				fwrite($fp, "\r\n");
			}
			foreach ( $data as $line ) {
				fputcsv($fp, $line);
				fseek($fp, -1, SEEK_CUR);
				fwrite($fp, "\r\n");
			}
			fclose($fp);
		} else {
			return false;
		}
		return true;
	}
}