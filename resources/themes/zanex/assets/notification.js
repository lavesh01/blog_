

var notification = site_url + 'notification/';

$.ajax({
	'type': "POST",
	url: notification,
	dataType: "json",
	async: true,
	success: function(response) {
		response = response.notification;
		//var obj = jQuery.parseJSON(response);
		$.each(response, function(key,value) {
		 notifiation_li(value.subject,value.message, value.created_date);
		}); 
		
	}
});

function notifiation_li(subject, message ,creeatedtime)
{
	var new_li = '<a class="dropdown-item d-flex countnotification_a" href="#"><div class="me-3 notifyimg  bg-primary-gradient brround box-shadow-primary"><i class="fe fe-message-square"></i>'+
				'</div><div class="mt-1 wd-80p"> <h5 class="notification-label mb-1">'+subject+'</h5>'+
				'<span class="notification-subtext">'+creeatedtime+'</span></div></a>';
    $('#notifications_area').append(new_li);
    countnotification();
}	






function countnotification(argument) {
	if ($('.countnotification_a').length > 5 ) { return false;}
	$("#countnotification").text($('.countnotification_a').length);
}