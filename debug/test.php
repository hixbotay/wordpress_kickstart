<?php

const _JEXEC = 1;

$_SESSION['flag'] = TRUE;
if (file_exists(__DIR__ . '/jbdefines.php'))
{	
	require_once __DIR__ . '/jbdefines.php';
}


JBHelper::write_log('test.txt',json_encode($_SERVER));
echo 'DONE';