		$(document).ready(function() {

			var demoInput, example, outputForm;
			outputForm = $('#form-demo-output');
			outputForm.submit(function(e) { 
				 e.preventDefault(); 
		    	return false
		    	}
		    );

			

			//formFields = JSON.stringify(example);
			form = new FormForm( outputForm, formFields );
			form.render();
			var base_url = site_url;
			
			$.each(json_inputdata, function(i, item) {
			   var v = item.value;
			   if (json_select.indexOf(item.type) > -1) {	
			   		var s = v.split("||");	
			   		if ( (item.type =="select2") || (item.type =="selectmultiple2")) {
			   			 $("#"+item.field_id).select2({theme: 'bootstrap'}).val(s).trigger('change');;
			   		}
			   		else{
			   			$("#"+item.field_id).val(s);
			   		}
			   }
			   else if (item.type == "checkboxinput" && item.value == "on") {
			   	     $("#"+item.field_id).checked;
			   }
			   else if (item.type == "file" ) {
			   	var v = item.value;
			   	var s = v.split("||");	
			   	var image_html = "<div class='form-group' ><div class='controls'>";
			   	 for (var i = s.length - 1; i >= 0; i--) {
			   	 	 var a = "<img class='responsive btn_delete' width='100px'  src='" +  base_url + s[i] + "' />";
			   	 	 image_html = image_html + a;
			   	 }
			   	 image_html = image_html + "</div></div>"; 
			   	 $("#"+item.field_id).parent().parent().parent().parent().parent().after(image_html);;
			   }
			   else if (item.type == "filedoc") {
			   	var v = item.value;
			   	var s = v.split("||");	
			   	var image_html = "<div class='form-group' ><div class='controls'>";
			   	 for (var i = s.length - 1; i >= 0; i--) {
			   	 	var file_name = (s[i]).split('/').pop();
			   	 	 var a = "<a class='responsive btn_delete' width='100px'  data-href='" +  s[i] + "' > "+file_name+"</a>";
			   	 	 image_html = image_html + a;
			   	 }
			   	 image_html = image_html + "</div></div>"; 
			   	 $("#"+item.field_id).parent().parent().parent().parent().parent().after(image_html);
;			   }
			   else
			   {
					$("#"+item.field_id).val(v);
			   }
			});
});