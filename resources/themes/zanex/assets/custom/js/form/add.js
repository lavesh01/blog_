		$(document).ready(function() {

			var demoInput, example, outputForm;
			outputForm = $('#form-demo-output');
			outputForm.submit(function(e) { 
				 e.preventDefault(); 
				var data = new FormData(this); // outputForm.serialize();
		    	//alert(data);
		    	save_data(data);

		    	return false
		    	}
		    );

//			formFields = <?php echo $data; ?>;

			//formFields = JSON.stringify(example);
			form = new FormForm( outputForm, formFields );
			form.render();


function save_data(data)
{
	var form_id = $('#form_id').val();
	$.ajax({
        type: "POST",
        cache:false,
        dataType: "text",
        url: site_url + "Form/add_data_to_form/" + form_id,
        data:data,
        processData:false,
	    contentType:false,
	    cache:false,
	    async:false,
        success: function (data) {
            console.log(data);
            $('#form-demo-output input[type="text"]').val('');
            return false;
        },
        error: function () {
            alert('Error');
        }
    });
}


});