$(function() {
	$("#userModel").click(function(a) {
		$('#exampleModalScrollable').appendTo("body").modal('show');
	});
	
    $( "#inputfields" ).sortable();
    //$( "#inputfields" ).disableSelection();
     $("#new_input_field_form").submit(function(){
	 	var outputForm = $(this);
	 	var form_id = $("#hidden_form_id").val();
	 	data = outputForm.serialize();
	 	//console.log(data);
		$.ajax({
	        type: "POST",
	        cache:false,
	        dataType: "text",
	        url: site_url + "Form/add_new_field/" + form_id,
	        data:data,
	        success: function (data) {
	        	console.log(data);
	            if (data== "1") {
	            	$("#inputfields").append('<li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>'+$("#label").val()+'</li>');
	            }
	            else if (data== "2") 
	            {
	            	alert_message("Field name already exits!!");
	            }
	            else
	            {
	            	alert_message("Please try again.");
	            }
	        },
	        error: function () {
	            alert('Error');
	        }
	    });
	 	return false;
	 });
  } );

$(function() {
    $("#inputype").change(function() {
        alert( $('option:selected').val() );
    });
});

