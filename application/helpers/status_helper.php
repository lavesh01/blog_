<?php

function edm_status($value='')
{
	if ($value==0)
	{
		return 'Create Template';
	}
	elseif ($value==1) {
		return 'Template Created';
	}
}

function edm_input_status($value='')
{
	if ($value==0)
	{
		return 'Input Pending';
	}
	elseif ($value==1) {
		return 'Input Completed';
	}
}

function edm_input_col_name($value='')
{
	if ($value=="title")
	{
		return $value;
	}
	elseif ($value=="href") {
		return $value;
	}
	elseif ($value=="alias") {
		return $value;
	}
	elseif ($value=="link") {
		return $value;
	}
	elseif ($value=="alt") {
		return "alias";
	}
	elseif ($value=="src") {
		return "href";
	}
}
?>