$(document).ready(function() {
			$('#log_table').dataTable({
				"pageLength": 50
			});

			$('#apply').click( function() {
				window.location.href = site_url + "log/" + $('#log_date').val();
			});
		});