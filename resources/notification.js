

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
	var new_li = '<div class="vertical-timeline-item vertical-timeline-element"><div><span class="vertical-timeline-element-icon bounce-in"><i class="badge badge-dot badge-dot-xl badge-success"> </i></span>' +
                                                            '<div class="vertical-timeline-element-content bounce-in"><h4 class="timeline-title"> ' + subject+ ' </h4>'+
                                                             '  <p>'+ message+ " " + creeatedtime + '</p></div>'+
                                                        '</div> </div>';
    $('#notifications_area').append(new_li);
}	





