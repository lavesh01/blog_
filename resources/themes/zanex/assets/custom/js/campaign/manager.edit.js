
open_common_htmlform_model("#customer_question_form_builder_1","campaign/htmlform/campaign-models-custom_questions");

$(document).ready(function() {
    $(".dedup").change(function() {
      var dedup_tr = $(this).closest('tr').attr("id");
      var select_dedup = 0;
      if(this.checked) {
          select_dedup = 1;
      }
     
      ajax_call('Campaign_ajax/ajax_update_campaignmandateColumn', "name="+$(this).attr("id")+"&select="+select_dedup+"&id="+dedup_tr+"&campaign_id="+ $("#Campaign_id").val() + "&col_type="+$(this).data("col_type"),"",0);
  });

 tinymce.init({
        selector: '.summernote-air',
        height: 350,
        theme: 'silver',
        plugins: [
            'advlist'
        ],
        toolbar1: 'undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
        
    });

   var campaign_id = $("#Campaign_id").val();

  
   question_delete_add_button();
   
   var seeted_suppression_type =  $("#seeted_suppression_type").val() ;
   if ( seeted_suppression_type == "0") {
      $("#suppress_none").attr('checked', 'checked');
   }
   else if ( seeted_suppression_type == "1") {
      $("#suppress_org_level").attr('checked', 'checked');
      $('#suppression_selected').val($("#seeted_suppression_days").val());
      $("#suppression_selected_div").show();
   }
   else if ( seeted_suppression_type == "2") {
      $("#suppress_client_level").attr('checked', 'checked');
      $('#suppression_selected').val($("#seeted_suppression_days").val());
      $("#suppression_selected_div").show();
   }

   $("#suppress_org_level, #suppress_client_level").click(function(argument) {
    $("#suppression_selected_div").show();
   });

   $("#suppress_none").click(function(argument) {
      $("#suppression_selected_div").hide();
   });
});

$(document).on('change','.pacing_leads',function(){
    var pacing_leads=$(this).val();
    if(pacing_leads<=0)
    {
        swal("Alert", "Enter Value greater than 0", "warning");
        $(this).val() = 0;
    }
});

function pacingcheck() {

    var a = 0 ;$('.pacing_leads').each(function(i, obj) {
        if($(obj).val() !="") {a = a + parseInt($(obj).val());}
    });
    if (parseInt($("#target_lead_pacing").val() ) < a) {
        swal("Alert", "Total Pacing is not matching to Target Lead", "warning");
    }
    return false;
}
$(document).on('keyup','.pacing_leads',function(){
 pacingcheck();
    
})

$("#suppress_org_level, #suppress_client_level").click(function(argument) {
    $("#suppression_selected_div").show();
});

$("#suppress_none").click(function(argument) {
    $("#suppression_selected_div").hide();
});

// Wizard tabs with icons setup
$("#save_external_suppression").click(function (argument) {
block_ajax_ui();
  var campaign_id = $("#Campaign_id").val();
  var url =site_url + "/campaign_ajax/external_suppression/"  + campaign_id;
   event.preventDefault();
   var send_data = $("#form_suppression")[0];
   $.ajax({
        url: url,
        type: "POST",
        dataType: "JSON",
        data: new FormData(send_data),
        processData: false,
        contentType: false,
        success: function (data, status)
        {
          if (data.type == "success") {
            add_external_supp_li(data.file_name, data.field_type,data.encryption_type, data.batch, data.rowcount);
          }
          
            Swal.fire({
              type: data.type,
              title: data.title,
              text: data.text,
              confirmButtonClass: data.confirmButtonClass,
            });
          
          unblock_ajax_ui();
        },
        error: function (xhr, desc, err)
        {
          unblock_ajax_ui();
          //console.log("error");
        }
    });

});




function delete_external_suppression() {
  $(".deleteextsupp").click(function(){
      swal.fire({
                title: "Notice",
                text: "Are you sure ?",
                showCancelButton: true,
                type: 'error',
                cancelButtonColor: '#d33',
            })
            .then((res) => {
                if(res.value){
                    var campaign_id = $("#Campaign_id").val();
                    var url = "campaign_ajax/deleteCampaignExternalSupp/"  + campaign_id;
                    var batch = $(this).data("batch");
                    var send_data = $.param({"batch":batch});
                    var adata = ajax_call(url, send_data, true) ;
                    $(this).closest(".list-group-item").remove();
                }
            });
  });
}

delete_external_suppression();

$("#save_internal_suppression").click(function (argument) {
  var campaign_id = $("#Campaign_id").val();
  var url = "campaign_ajax/add_campaign/"  + campaign_id;
  var send_data = $("#form_suppression").serialize();
  var adata = ajax_call(url, send_data) ;
  return true;
});

$("#save_script").click(function(){
  var campaign_id = $("#Campaign_id").val();
  var url = "campaign_ajax/add_campaign/"  + campaign_id;
  var section = $("#section_script").val();
  var campaign_script = tinymce.get('campaign_script').getContent();
  var send_data = $.param({'campaign_script':campaign_script, 'section':section});
  var adata = ajax_call(url, send_data) ;
  return true;
})

datetime_range();
function datetime_range() {
   // Date & Time Range
    $('.datetime').daterangepicker({
        timePicker: true,
        timePickerIncrement: 30,
        locale: {
            format: 'MM/DD/YYYY h:mm A'
        }
    });
}



(function(window, document, $) {
    'use strict';

var campaign_id = $("#Campaign_id").val();
select2_ajax(".select2_level", "/Udc/Udc/level", "Select Job Levels");
select2_ajax(".select2_function", "Udc/Udc/function", "Select Job Function");
select2_ajax(".select2_country", "Udc/Udc/country", "Select Country");
select2_ajax(".select2_employee", "Udc/Udc/employee", "Select Employee Size");
select2_ajax(".select2_industry", "Udc/Udc/industry", "Select industry");
select2_ajax(".select2_revenue", "Udc/Udc/revenue", "Select Revenue");



select2_preselected_ajax(".select2_level", "campaign_ajax/get_campaign_udc/level/"+ campaign_id); 
select2_preselected_ajax(".select2_function", "campaign_ajax/get_campaign_udc/function/"+ campaign_id); 
select2_preselected_ajax(".select2_country", "campaign_ajax/get_campaign_udc/country/"+ campaign_id); 
select2_preselected_ajax(".select2_employee", "campaign_ajax/get_campaign_udc/employee/"+ campaign_id); 
select2_preselected_ajax(".select2_industry", "campaign_ajax/get_campaign_udc/industry/"+ campaign_id); 
select2_preselected_ajax(".select2_revenue", "campaign_ajax/get_campaign_udc/revenue/"+ campaign_id); 

select2_select_unselected_ajax(".select2_level", "campaign_ajax/udc/level", "campaign_id=" + campaign_id); 
select2_select_unselected_ajax(".select2_function", "campaign_ajax/udc/function", "campaign_id=" + campaign_id); 
select2_select_unselected_ajax(".select2_country", "campaign_ajax/udc/country", "campaign_id=" + campaign_id); 
select2_select_unselected_ajax(".select2_employee", "campaign_ajax/udc/employee", "campaign_id=" + campaign_id); 
select2_select_unselected_ajax(".select2_industry", "campaign_ajax/udc/industry", "campaign_id=" + campaign_id); 
select2_select_unselected_ajax(".select2_revenue", "campaign_ajax/udc/revenue", "campaign_id=" + campaign_id); 

select2_ajax(".select2_campaign", "Udc/Udc/campaign", "Select Campaign");
select2_preselected_ajax(".select2_campaign", "campaign_ajax/get_campaign_udc/campaign_sup/"+ campaign_id); 
select2_select_unselected_ajax(".select2_campaign", "campaign_ajax/udc/campaign_sup", "campaign_id=" + campaign_id);

Dropzone.options.dpAcceptFiles = {
    paramName: "file", // The name that will be used to transfer the file
    maxFilesize: 1, // MB
    //acceptedFiles: 'image/*',
    url: site_url + "campaign_ajax/upload",
    init: function() {
        this.on("sending", function(file, xhr, formData) {
          var campaign_id = $("#Campaign_id").val();
          formData.append("campaign_id", campaign_id);
        });
      },    
    success: function(file, response){
        $("#asset_list").prepend('<li class="list-group-item" id="delete_assets'+response.id+'"><a class="badge badge-danger float-right delete_assets" data-id="'+response.id+'"><i class="fa fa-trash bg-danger"></i></a><a href="' + response.url  + '" target="_blank" >'+ response.client_name + '</a></li>');
        delete_assests();
    }
}


// Custom Show / Hide Configurations
$('.file-repeater, .contact-repeater').repeater({
    show: function () {
        $(this).slideDown();
        datetime_range();
    },
    hide: function(remove) {
        /*
        if (confirm('Are you sure you want to remove this item?')) {
            $(this).slideUp(remove);
        }
        */
    }
});


})(window, document, jQuery);





function delete_assests()
{


    $('.delete_assets').click(function() {
        var assets_id = $(this).data("id");
        Swal.fire({

          title: 'Are you sure?',

          text: "You won't be able to revert this!",

          type: 'warning',

          showCancelButton: true,

          confirmButtonColor: '#3085d6',

          cancelButtonColor: '#d33',

          confirmButtonText: 'Yes, delete it!',

          confirmButtonClass: 'btn btn-warning',

          cancelButtonClass: 'btn btn-danger ml-1',

          buttonsStyling: false,

        }).then(function (result) {

          if (result.value) {
            
            var send_data = $.param({"id":assets_id});
            var adata = ajax_call("campaign_ajax/delete_asset/",send_data );
            if (adata.type == "success") {
              $("#delete_assets" + assets_id).remove();
            }

          } 
    })
        
    });

}

delete_assests();



function ajax_init()
{
    $('#save_new_question').on('click', function (e) {
        e.preventDefault();
        var campaign_id = $("#Campaign_id").val();
        var send_data = $("#model_form").serialize();
        var adata = ajax_call("campaign_ajax/add_new_question/" + campaign_id,send_data );
        $("#form-question-output").empty();
        var  outputForm = $("#form-question-output");
        var form = new FormForm( outputForm, adata.form_inputs );
        form.render();
        question_delete_add_button();
    });
}


function question_delete_add_button() {
  var  outputForm = $("#form-question-output");
  var question_detele_html = '<span class="float-right question_detele"><i class="fa fa-trash icon-gradient bg-love-kiss"></i></span>';
  outputForm.find(".form-group").prepend(question_detele_html);

    $('.question_detele').click(function() {
        var aaa = $(this).closest("div.form-group");;
        Swal.fire({

      title: 'Are you sure?',

      text: "You won't be able to revert this!",

      type: 'warning',

      showCancelButton: true,

      confirmButtonColor: '#3085d6',

      cancelButtonColor: '#d33',

      confirmButtonText: 'Yes, delete it!',

      confirmButtonClass: 'btn btn-warning',

      cancelButtonClass: 'btn btn-danger ml-1',

      buttonsStyling: false,

    }).then(function (result) {

      if (result.value) {
       
       var send_data = $.param({"id":aaa.data("id")});
        var adata = ajax_call_no_alert("campaign_ajax/delete_question/",send_data );
        if (adata.type == "success") {
            aaa.remove();
        }

      } else if (result.dismiss === Swal.DismissReason.cancel) {

        Swal.fire({

          title: 'Cancelled',

          text: 'User is safe :)',

          type: 'error',

          confirmButtonClass: 'btn btn-success',

        })

      }

    })
        
    });
}



$(document).on('click','.pacing-action',function(){
  var type = $(this).data("type");
  var pace_div =  $(this).closest(".reapter_peacing");
  if ( pacingcheck() == false) {
    return false;
  }

  var campaign_id = $("#Campaign_id").val();
  var url = "campaign_ajax/add_campaign/"  + campaign_id;
  var pace_date = "";
  var pace_leads = "";
  var id = ""; 
  if (type == "insert") {
    pace_date = pace_div.find('.datetime').val();
    pace_leads = pace_div.find('.pacing_leads').val();
  }
  else
  {
    pace_date = pace_div.find('input[name="pacing_date"]').val();
    pace_leads = pace_div.find('input[name="pacing_leads"]').val();
    id = $(this).data("id");
  }
   
  var send_data = $.param({'pacing_leads': pace_leads , 'pacing_date':pace_date,"type":type, "section":"form_pacing", "id":id });
  var adata = ajax_call(url,send_data );
  if (type == "delete" && adata.type=="success") {
    pace_div.remove();
  }

})

function add_external_supp_li(filename, stype,etype, batch, count) {
   var li =  '<li class="list-group-item"><div class="todo-indicator bg-success"></div><div class="widget-content p-0">'+
    '<div class="widget-content-wrapper"><div class="widget-content-left mr-2"></div>'+
    '<div class="widget-content-left flex2"><div class="widget-heading" data-toggle="tooltip"  title="'+filename+'">'+
    stringshort(filename) +
    '</div><div class="widget-subheading">'+
    stype + " : " + etype +
    '</div></div><div class="widget-content-right"><div class="badge badge-warning mr-2">'+
    count + 
    '</div></div><div class="widget-content-right"><a class="deleteextsupp" data-batch="'+batch+'">'+
     '<i class="fa fa-trash  icon-gradient bg-love-kiss"></i></button> </div></div></div></li>';
    $("#ext_supp_li").append(li);
    delete_external_suppression();
}


function changestatus()
{
    var status=$('#status').val();
    var Campaign_id=$('#Campaign_id').val();

     $.ajax({
    url:site_url + "Campaign_ajax/change_status",
    method:"POST",
    data:{status:status,Campaign_id:Campaign_id},
    success:function(data)
    {
               
        location = location
        location = location.href
        location = window.location
        location = self.location
        location = window.location.href
        location = self.location.href
    }
   });

}


/*

function group_access() {
 

    $('.add_user_to_group').click(function() {
       var group_id = $(this).attr("id").replace("autg_","");
       $("#selected_access_group_name").val(group_id);
    });

}

var action = [
              ];
  
  var aocolumnDefs =  [
                    {    
                        "aTargets": [1],
                        "mRender": function (data, type, full) {
                           var chked = "";
 
                           if (data ) {
                             var user_group =data.split(",");
                             if(user_group.indexOf(user_id) != -1){
                               var chked = "checked";   
                              }
                            }
                            return '<label><input type="checkbox"   data-toggle="tooltip"  data-placement="top" class="click_add_user_to_group_access"  value="'+full.id+'" '+chked+' > Add </label> ';
                        }
                      }
                   ];  
  enable_common_dataTable( 'campaign_ajax/getAllCustomerUserByGroup' ,"#common_dataTable",action,aocolumnDefs,"",user_id);
 
//Add User To Group Modal Popup 
/*
$(document).on('click','.add_user',function(){
  var user_id = $(this).attr("id").replace("add_user","");
  $('#group_id').val(user_id);
  var action = [
              ];
  
  var aocolumnDefs =  [
                    {    
                        "aTargets": [1],
                        "mRender": function (data, type, full) {
                           var chked = "";
 
                           if (data ) {
                             var user_group =data.split(",");
                             if(user_group.indexOf(user_id) != -1){
                               var chked = "checked";   
                              }
                            }
                            return '<label><input type="checkbox"   data-toggle="tooltip"  data-placement="top" class="click_add_user_to_group_access"  value="'+full.id+'" '+chked+' > Add </label> ';
                        }
                      }
                   ];  
  enable_common_dataTable( 'campaign_ajax/getAllCustomerUserByGroup' ,"#common_dataTable",action,aocolumnDefs,"",user_id);
 
  //$('#user_detail_modal').appendTo("body").modal('show');

});
 
*/
 //Assign User To Group
 /*
 $(document).on('click','.click_add_user_to_group_access',function(){
       if($(this).is(":checked")) {
          activate = 1;
       }
       else
       {
        activate = 0;
       }
       var user_id = $(this).val();
       var group_id = $("#group_id").val();
       var send_data = $.param({'user_id':user_id,"group_id":group_id,  'activate':activate});
       var adata = ajax_call("campaign_ajax/add_user_to_group_access",send_data );
       if(adata.type=="success")
       {
          $('#user_detail_modal').modal('hide');
          return false;
         
       }
       else
       {
         $('#user_detail_modal').modal('show');
          return false;

       }

    });
*/
 /*Auto refreshing
 var htmldatatable_id = "#common_dataTable";
var dt_test;
function draw_table(type="") {
 
 var action =   [
                     { "class":"add_user","icon":"fa fa-user icon-gradient bg-mixed-hopes", "id":"add_user", "href":"#","title":"Add User"},
                ];
         
  if (type=="") {
    dt_test = enable_common_dataTable( 'campaign_ajax/getGroup' ,htmldatatable_id,action); 

  }
  else
  {
    dt_test.destroy();
    dt_test = enable_common_dataTable( 'campaign_ajax/getGroup' ,htmldatatable_id,action); 

  }

}


//Open Group Campaign Access Modal
$(document).ready(function() {
      $("#add_user").click(function (argument) {
      $('#group_model').appendTo("body").modal('show');
    })
} );



//Assign Group To Campaign
var htmldatatable_id1 = "#user_group_data";
$(document).ready(function() {

    var action = "";
    var aocolumnDefs =  [
                    {    
                        "aTargets": [0],
                        "mRender": function (data, type, full) {
                           
                             if(data == "1"){
                              
                                var chked = "checked";
                              }
                              else
                              {
                                var chked = "";
                              }
                          
                            return '<label><input type="checkbox" id="access_"  value="'+full.id+'" class="group_access_data"  '+chked+' >&nbsp;Allow</label> ';
                        }
                      }
                   ];
                              
    enable_common_dataTable( 'campaign_ajax/getGroupAccess' ,htmldatatable_id1,action,aocolumnDefs);

} );

//Give Access To campaign
$(document).on('click','.group_access_data',function(){
    
    if($(this).is(":checked")) {
          activate = 1;
       }
       else
       {
        activate = 0;
       }
       var campaign_id = $("#Campaign_id").val();
       var group_id = $(this).val().replace("access_","");
       var send_data = $.param({'campaign_id':campaign_id,"group_id":group_id,'activate':activate});
       var adata = ajax_call("campaign_ajax/addgrouptocampaign",send_data );

  });

*/

// ajax_call_no_alert(url, send_data,async= false,dataType = "JSON",function_name='1' )
    function  formrenerdingquestion(data) {
        $("#form-question-output").empty();
        var  outputForm = $("#form-question-output");
        form = new FormForm( outputForm, data );
        form.render();
        question_delete_add_button()
        if ($("#status").val() != '0')
        {
            $("#dp-accept-files").hide();
            $('.tab-content').find('input, textarea, button, select').attr('disabled','disabled');
            $('.tab-content').find('a').unbind('click');;
            $('.tab-content').find('a').attr("disabled","disabled");
            $('.tab-content').find('a').addClass("disable-click");
            tinymce.activeEditor.setMode('readonly');
            $('.tab-content').find(':input[type="submit"]').prop('disabled', true);
            $('input[type="text"]').keyup(function() {
                if($(this).val() != '') {
                   $('.tab-content').find(':input[type="submit"]').prop('disabled', false);
                }
            });
        }
    }
    ajax_call_no_alert("campaign_ajax/form_question_data/" +$("#Campaign_id").val(),"",true,"JSON","formrenerdingquestion(adata)");

$(document).ready(function() {

   
    if ($("#status").val() != '0')
    {
        $("#dp-accept-files").hide();
        $('.tab-content').find('input, textarea, button, select').attr('disabled','disabled');
        $('.tab-content').find('a').unbind('click');;
        $('.tab-content').find('a').attr("disabled","disabled");
        $('.tab-content').find('a').addClass("disable-click");
        tinymce.activeEditor.setMode('readonly');
        $('.tab-content').find(':input[type="submit"]').prop('disabled', true);
        $('input[type="text"]').keyup(function() {
            if($(this).val() != '') {
               $('.tab-content').find(':input[type="submit"]').prop('disabled', false);
            }
        });
    }

});