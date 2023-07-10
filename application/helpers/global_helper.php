<?php

function generateSalt() {
        $salt = "xiORG17N6ayoEn6X3";
        return $salt;
}

function generateVerificationKey() {
            $length = 10;
            $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
            $charactersLength = strlen($characters);
            $randomString = '';
            for ($i = 0; $i < $length; $i++) {
                $randomString .= $characters[rand(0, $charactersLength - 1)];
            }
            return $randomString;
    }

function getUserIP() {
	    $ipaddress = '';
	    if (isset($_SERVER['HTTP_CLIENT_IP']))
	        $ipaddress = $_SERVER['HTTP_CLIENT_IP'];
	    else if(isset($_SERVER['HTTP_X_FORWARDED_FOR']))
	        $ipaddress = $_SERVER['HTTP_X_FORWARDED_FOR'];
	    else if(isset($_SERVER['HTTP_X_FORWARDED']))
	        $ipaddress = $_SERVER['HTTP_X_FORWARDED'];
	    else if(isset($_SERVER['HTTP_X_CLUSTER_CLIENT_IP']))
	        $ipaddress = $_SERVER['HTTP_X_CLUSTER_CLIENT_IP'];
	    else if(isset($_SERVER['HTTP_FORWARDED_FOR']))
	        $ipaddress = $_SERVER['HTTP_FORWARDED_FOR'];
	    else if(isset($_SERVER['HTTP_FORWARDED']))
	        $ipaddress = $_SERVER['HTTP_FORWARDED'];
	    else if(isset($_SERVER['REMOTE_ADDR']))
	        $ipaddress = $_SERVER['REMOTE_ADDR'];
	    else
	        $ipaddress = 'UNKNOWN';
	    return $ipaddress;
   }

function createMenuLi($arr, $key, $title, $url, $class="")
{

	if (!empty($arr) && in_array( $key, $arr) && !empty($arr))
	{
	  echo '<li><a class="menu-item" href="' . site_url($url). '"><i class="la la-cart-plus"></i><span>'.$title.'</span></a></li>' ; 
	}                              
}

function createSingleMenuLi($arr, $key, $title, $url, $class="")
{
	
	if (!empty($arr) && in_array( $key, $arr) )
	{
		echo '<li><a href="'.site_url($url).'"><i class="'.$class.'"></i>'.$title.'</a></li>';
	}                              
}

function parentMenu($arr, $key)
{
	// Get rid of attribute on product tag
	if (isset($arr)) {
		# code...
		for($i = 0; $i < count($arr); $i++){
			if(strpos($arr[$i], $key) !== false){
			    return True;
			}
		}
	}
	return False;
}

function ifurlcontainshttp($url="")
{
	if ($url=="" || substr($url, 0, 7) == "http://" || substr($url, 0, 8) == "https://") {
		return $url;
	}
	else
	{
		return 'http://'.$url ;
	}	
}

function getstringbetween2text($str,$start,$end)
{
		$start = strtolower($start);
		$end = strtolower($end);
		$str = strtolower($str);
	
        $startPos = strpos($str, $start);
        if ($startPos !== false) {
            $startPos += strlen($start);
            $endPos = strpos($str, $end, $startPos);
            if ($endPos !== false) {
               return substr($str, $startPos, $endPos - $startPos);
            }
        } 
}

function callback_date_valid($date){
    $day = (int) substr($date, 0, 2);
    $month = (int) substr($date, 3, 2);
    $year = (int) substr($date, 6, 4);
    return checkdate($month, $day, $year);
}

?>