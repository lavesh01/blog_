var htmldatatable_id = "#common_dataTable";

$(document).ready(function() {

	var action = [
                    { "class":"view_leads","icon":"fa fa-eye icon-gradient bg-ripe-malin", "id":"view", "href":site_url +"ContentDiscovery/leadWorkReportDetails/","title":"View Lead Details"}
                   
                 ];   
enable_common_dataTable( 'ContentDiscovery/leadWorkReport' ,htmldatatable_id,action);

 } );

//search result
var htmldatatable_id1="#filter_dataTable";


	   $('#search_result_details').on('click', function () {
          
          $('#loadbtn').show();
          $('#search_result_details').hide();
           var from_date=$('#from_date').val();
          var to_date=$('#to_date').val();
          
          //validation
           if(from_date=="" && to_date=="")
           {
                $('#loadbtn').hide();
                $('#search_result_details').show();
              swal("Form Fileds Missing","Enter From Date, Enter To Date");
              return false;
           }
           else if(from_date=="")
           {
                $('#loadbtn').hide();
                $('#search_result_details').show();
               swal("Form Fileds Missing","Enter From Date");
              return false;
           }
           else if(to_date=="")
           {
                $('#loadbtn').hide();
                $('#search_result_details').show();
               swal("Form Fileds Missing","Enter To Date");
              return false;
           }
          var action="";
         
          enable_common_dataTable( 'ContentDiscovery/leadWorkReportFilterList' ,htmldatatable_id,action);
         
          $('#loadbtn').hide();
          $('#search_result_details').show();
 
          

    });	

	   