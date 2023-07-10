
$(document).ready(function() {
    $('#saveButton').click(function(e) {
        e.preventDefault(); // Prevent the form from submitting

        var name = $('#name').val();
        var description = $('#description').val();
        var uniqueUrl = $('#uniqueurl').val();
      
        // Perform validation
        var isValid = true;

        if (name === '') {
            alert('Name is required.');
            isValid = false;
        }

        if (description === '') {
            alert('Description is required.');
            isValid = false;
        }

        if (uniqueUrl !== '' && uniqueUrl.length > 255) {
            alert('Unique URL must be 255 characters or less.');
            isValid = false;
        }

        // If the form is valid, submit it
        if (isValid) {
            var send_data = $.param({"uniqueurl":uniqueUrl,'description':description,'name':name});
            var aa = ajax_call("Report/ajax_newcustomreport/",send_data,false,2  );
            if (aa.type == 'success') {
              ajaxpageload(site_url+'Report/customreportview/'+ aa.id + '/edit');
              return false;
            }
        }
    });
});





$('#add_new_report').click(function(argument) {
  $('#name').val("") ;
  $('#description').val("") ;
  $('#uniqueurl').val("") ;
  $('#reportModal').appendTo("body").modal('show');
});

var action = [
                    { "class":"customreportaction primary","icon":"fa fa-edit icon-gradient bg-happy-fisher", "id":"customreportaction", "href":site_url + "Report/customreportview/", "title":"Edit"},
          { "class":"customreportaction primary","icon":"fa fa-keyboard icon-gradient bg-mixed-hopes", "id":"customreportaction", "href": site_url + "ContentDiscovery/manual/",
           "title":"Manual Data"},
           { "class":"customreportaction primary","icon":"fa fa-upload icon-gradient bg-sunny-morning", "id":"customreportaction", "href": site_url + "ContentDiscovery/uploadrpf/",
           "title":"Data Upload"},
                    { "class":"customreportaction primary","icon":"fa fa-phone icon-gradient bg-ripe-malin", "id":"customreportaction", "href":site_url +"agent/manual/", "title":"Mannual Dailer"},
          { "class":"customreportaction primary","icon":"fa fa-rocket icon-gradient bg-malibu-beach", "id":"customreportaction", "href": site_url + "quality/leads/",
           "title":"Quality"},
          { "class":"uploadrejection","icon":"fa fa-user  icon-gradient bg-mixed-hopes", "id":"customreportaction", "href": site_url + "sales/clientRejection/","title":"Upload Customer Rejection"},
          { "class":"campaigndata","icon":"fa fa-database  icon-gradient bg-premium-dark", "id":"customreportaction", "href": site_url + "campaign/leads/","title":"Lead Data"}
           
                ];
enable_common_dataTable( 'Report/getcustomreportlist' ,"#customrreport_dataTable",action);    


