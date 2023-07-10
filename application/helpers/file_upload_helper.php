<?php

function multi_upload_files($element_name='')
{
	if (isset($postData[$element_name])) {
		$multiple_file_upload = $postData[$element_name];
		$images_path ="";
		foreach ($multiple_file_upload as $key => $file_input) {
		    $countfiles = count($_FILES[$file_input]['name']);
		    for($i=0;$i<$countfiles;$i++){		
		        if(!empty($_FILES[$file_input]['name'][$i])){
			          $_FILES['file']['name'] = $_FILES[$file_input]['name'][$i];
			          $_FILES['file']['type'] = $_FILES[$file_input]['type'][$i];
			          $_FILES['file']['tmp_name'] = $_FILES[$file_input]['tmp_name'][$i];
			          $_FILES['file']['error'] = $_FILES[$file_input]['error'][$i];
			          $_FILES['file']['size'] = $_FILES[$file_input]['size'][$i];
			          $images_path .= '||'. $this->do_upload( $_FILES[$file_input]['name'][$i]);
			    }
			    else
			    {
			    	$images_path .= "error";
			    }
			    
		    }
		}
		//echo $file_input;
		$postData[$file_input] =ltrim( $images_path,'||');   
	}
}


?>