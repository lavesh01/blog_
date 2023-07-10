var action = [
               { "class":"view_audio_files","icon":"fa fa-eye icon-gradient bg-happy-fisher", "id":"vaf_", "href":"#", "title":"view audio files"},
               { "class":"approve_audio_files","icon":"fa fa-check-circle icon-gradient bg-mixed-hopes", "id":"approve_", "href":"#", "title":"approve audio files"},
             ];

var return_datatable = enable_common_dataTable( 'dnc/getDNCPendingList' ,"#dnc_datatable",action);

$(document).on('click','.view_audio_files',function(){
  var lead_id = $(this).attr("id").replace("vaf_","");
  var send_data = $.param({ "lead_id":lead_id});
  var adata = ajax_call_no_alert("lead_ajax/view_lead_audio/",send_data );
  if (adata.type == "success" && adata.audio != false) {
    if (adata.type == "success" && adata.audio != false) {
      for (var i = adata.audio.length - 1; i >= 0; i--) {
         add_external_supp_li(adata.audio[i].url, adata.audio[i].file_type);
      }
    }
  }
  else
  {
     swal("Audio Files Not Available", "Audio Record Not Available", "success");
  }
});


$(document).on('click','.approve_audio_files',function(){

  var lead_id = $(this).attr("id").replace("approve_","");
  var send_data = $.param({ "lead_id":lead_id});
  var adata = ajax_call("lead_ajax/changeApproveDataStatus",send_data );
  draw_table();
   return false;

});

function add_external_supp_li(filepath,mime_type) {
   var li =  '<li class="list-group-item"><div class="widget-content p-0">'+
    '<div class="widget-content-wrapper">'+
    '<div class="widget-content-left flex2"><div class="widget-heading">'+
    '<audio controls>'+
  '<source src="'+filepath+'" type="'+mime_type+'">'+
   'Your browser does not support the audio element.'+
  '</audio>'+
    '</div></div></div></div></li>';
    $("#audio_li").html(li);
   
}




var dt_test;
function draw_table(type="") {
 
  var action = [
               { "class":"view_audio_files","icon":"fa fa-eye icon-gradient bg-happy-fisher", "id":"vaf_", "href":"#", "title":"view audio files"},
               { "class":"approve_audio_files","icon":"fa fa-check-circle icon-gradient bg-mixed-hopes", "id":"approve_", "href":"#", "title":"approve audio files"},
             ];
  if (type=="") {
    dt_test =enable_common_dataTable( 'dnc/getDNCPendingList' ,"#dnc_datatable",action);

  }
  else
  {
    dt_test.destroy();
    dt_test = enable_common_dataTable( 'dnc/getDNCPendingList' ,"#dnc_datatable",action);

  }

}

//Approve Leads table
$(document).ready(function() {
  var action = ""; 
enable_common_dataTable( 'dnc/getDNCApproveList' ,"#dnc_datatable_approve",action);

 

 } );