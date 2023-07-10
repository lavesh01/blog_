var t = 0;
$(function() {
	$.ajax({
		type: 'POST',
		url: site_url+'Timetracker/get_current_task',
		dataType: 'json',
		success : function(response){
			window.clearInterval(timeclock); 
			t = response.tt_in_sec.t;
			$('#timeclocklock').text("");
			if (response.type == 'success' && response.task != 'ideal' ) {
				var start = new Date(response.task.created_on);
				$("#timeclocklockDropdown").val(response.task.task);
				 timeclock = setInterval(function() {
			      var total_seconds = (new Date - start) / 1000;   
			      var hours = Math.floor(total_seconds / 3600);
			      total_seconds = total_seconds % 3600;
			      var minutes = Math.floor(total_seconds / 60);
			      total_seconds = total_seconds % 60;
			      var seconds = Math.floor(total_seconds);
			      hours = pretty_time_string(hours);
			      minutes = pretty_time_string(minutes);
			      seconds = pretty_time_string(seconds);
			      var currentTimeString = hours + ":" + minutes + ":" + seconds;
			      $('#timeclocklock').text(currentTimeString);
			      var t =  (t+1)*100/570/60;
			      $("#timeclocklock").css("width", t+"%");
			    }, 1000);
				 $("#timeclocklockDropdown").removeClass('icon-anim-pulse');
			}
			else{

				$("#timeclocklockDropdown").addClass('icon-anim-pulse');
				window.clearInterval(timeclock); 
				$("#timeclocklockDropdown").val("");
				var t_progress =  (response.tt_in_sec.t)*100/570/60;
				$("#timeclocklock").css("width",t_progress+"%");
				$("#timeclocklockDropdown").addClass('icon-anim-pulse');
			}
			
		}
	});
});

function pretty_time_string(num) {
	return ( num < 10 ? "0" : "" ) + num;
}

var timeclock ;
$("#timeclocklockDropdown").change(function() {
	var task = $("#timeclocklockDropdown").val();
	var adata = ajax_call_no_alert("Timetracker/insert/" +task,"",false,"JSON");
	var t_progress =  (adata.tt_in_sec.t)*100/570/60;
	$("#timeclocklock").css("width", t_progress+"%");
	
	if (task == 8 || task == "" ) {
		$("#timeclocklockDropdown").addClass('icon-anim-pulse');
		window.clearInterval(timeclock); 
		return false;
	}

	$("#timeclocklockDropdown").removeClass('icon-anim-pulse');
	//ajax_call_no_alert("Timetracker/insert/" +task,"",true,"JSON");
    var start = new Date;   
    window.clearInterval(timeclock); 
    timeclock = setInterval(function() {
      var total_seconds = (new Date - start) / 1000;   
      var hours = Math.floor(total_seconds / 3600);
      total_seconds = total_seconds % 3600;
      var minutes = Math.floor(total_seconds / 60);
      total_seconds = total_seconds % 60;
      var seconds = Math.floor(total_seconds);
      hours = pretty_time_string(hours);
      minutes = pretty_time_string(minutes);
      seconds = pretty_time_string(seconds);
      var currentTimeString = hours + ":" + minutes + ":" + seconds;
      $('#timeclocklock').text(currentTimeString);
    }, 1000);
});