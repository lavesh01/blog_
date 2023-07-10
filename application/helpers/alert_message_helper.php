<?php

$alert_custom_messagae = "";
$alert_custom_type = "";
function alert_custom($message='', $type='')
{
	if ($message!="")
	{
		$GLOBALS['alert_custom_messagae'] =  $message;
		$GLOBALS['alert_custom_type'] =   $type;
	}
	else {
		return '';
	}
}

function alert_custom_is()
{
	global $alert_custom_messagae;
	if ($alert_custom_messagae == "")
	{
		return true;
	}
	else {
		return false;
	}
}

?>