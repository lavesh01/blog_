<?php 

function multi_select_inputs()
{
	return  array("selectmultiple2", "select2", "selectmultiple", "select" );
}

function select_choices($row)
{
	if ( in_array($row["type"], multi_select_inputs())) {
		$split = explode("||", $row["placeholder"]);
		$choices = array();
		foreach ($split as $key1 => $value1) {
			$arr = array();
			$arr[] = trim($value1);
			$arr[] = trim($value1);
			$choices[] = $arr;
		}
		$row["choices"] =  $choices;
		return $row;
	}
	else
	{
		return $row;
	}
}

function get_input_html($datavalue_type,$datavalue_value )
{
	$html = "";
	$input_multi = multi_select_inputs();
	if ($datavalue_type == "file") {	
		$images = explode("||",$datavalue_value);
		$image_html_strt = "";
		$image_html="";
		$image_html_end = "";
		foreach ($images as $key => $value) {
			$image_html .= '<img width="100%" class="fb_img" src="'. site_url().$value .'" />';
		}
		$html = $image_html_strt .$image_html. $image_html_end;
		
	}
	else if ($datavalue_type == "filedoc") {
		$opt_arr = explode("||",$datavalue_value);
    	//$html = "";
		foreach ($opt_arr as $key => $value) {
			$html .= '<a class="col fb_label" target="_blank" href="'.site_url(). $value .'">'.basename($value).'</a>';
		}
	}
	else if ( in_array($datavalue_type ,$input_multi ))
    {
    	$opt_arr = explode("||",$datavalue_value);
    	//$opt_str = "";
		foreach ($opt_arr as $key => $value) {
			$html .= '<div class="col fb_label">'. $value .'</div>';
		}
		//$html = str_replace("__". $datavalue["field_id"] ."__",$opt_str,$html);
    }
	else
	{
		$html = $datavalue_value;
	}
	return $html;
}
?>