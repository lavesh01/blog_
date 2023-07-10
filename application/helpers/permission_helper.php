<?php 
function createLi($arr, $key, $title, $url)
{
	if (in_array( $key, $arr))
	{
	  echo '<li><a class="menu-item" href="' . site_url($url). '"><i class="la la-cart-plus"></i><span>'.$title.'</span></a></li>' ; 
	}                              
}
?>