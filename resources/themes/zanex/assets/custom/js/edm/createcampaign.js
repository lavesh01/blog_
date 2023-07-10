

$(function(){
  
  var campaign_id = $("#campaign_id").val();
   //defaults
   //$.fn.editable.defaults.url = '/post'; 
//$.fn.editable.defaults.mode = 'inline';
  $.fn.editable.defaults.mode = 'popup';$.fn.size = function() {return this.length;};
  $.fn.size = function() {return this.length;};
   $.fn.editableform.buttons =
'<button type="submit" class="btn btn-primary btn-sm editable-submit">' +
    '<i class="fa fa-fw fa-check"></i>' +
    '</button>' +
'<button type="button" class="btn btn-warning btn-sm editable-cancel">' +
    '<i class="fa fa-fw fa-times"></i>' +
    '</button>';
'<button type="submit" class="btn btn-primary btn-sm editable-submit"><i class="fa fa-fw fa-check"></i></button><button type="button" class="btn btn-warning btn-sm editable-cancel"><i class="fa fa-fw fa-times"></i></button>'
    //enable / disable
    $('.inline_editable_date').editable({
       // tpl: "<input type='text' class='form-control'></input>",
        container: 'body',
        sourceCache: true,
        emptytext: 'empty', 
        placement: 'left',
        format: 'yyyy-mm-dd hh:ii',    
        viewformat: 'yyyy-mm-dd hh:ii',    
        datetimepicker: {
                weekStart: 1
           },
        validate: function(value){
        if(value=="")
          return "Please Provide Value. ";
        }  
    });

    $('.trackingenabled').editable({
        value: $("#trackingenabled").val(),    
        source: [
              {value: 1, text: 'Enabled'},
              {value: 2, text: 'Disabled'}
           ]
    });

    $('.runimmediately').editable({
        value: $("#runimmediately").val(),    
        source: [
              {value: 1, text: 'Yes'},
              {value: 2, text: 'No'}
           ]
    });

    $('.ed_status').editable({
        value: $("#ed_status").val(),    
        source: [
              {value: 0, text: 'Draft'},
              {value: 1, text: 'Live'},
           ]
    });
    

   //editables 
    $('.inline_editable').editable({
        container: 'body',
        sourceCache: true,
        emptytext: 'empty', 
       validate: function(value){
       if(value=="")
          return "Please Provide Value. ";
       }  
    });

    select2_ajax(".select2_campaign", "Udc/Udc/campaign", "Select Campaign");
    select2_ajax(".select2_email_list", "Udc/Udc/email_list", "Select Email List Name");

    select2_preselected_ajax(".select2_campaign", "Edm/get_udc/2/"+ campaign_id); 
    select2_preselected_ajax(".select2_email_list", "Edm/get_udc/1/"+ campaign_id); 

    select2_select_unselected_ajax(".select2_campaign", "Edm/savedelete/2", "campaign_id=" + campaign_id); 
    select2_select_unselected_ajax(".select2_email_list", "Edm/savedelete/1", "campaign_id=" + campaign_id);



/*
 tinymce.init({
        selector: '.summernote-air',
        height: 650,
       theme: 'silver',
         apply_source_formatting : false,                //added option
        verify_html : false,          
        valid_children : "+body[style], +style[type]",
        height: 650,
         
         cleanup : false,
     extended_valid_elements : 'iframe[*]',
      cleanup_on_startup : false,
      allow_unsafe_link_target: true,
         menubar: false,
         element_format : 'html',
         entity_encoding : 'raw',
         forced_root_block : '',
         keep_styles: false,schema: 'html5',
         plugins: [
       'code', 'a11ychecker','advlist','advcode','advtable','autolink','checklist','export',
       'lists','link','image','charmap','preview','anchor','searchreplace','visualblocks',
       'powerpaste','fullscreen','formatpainter','insertdatetime','media','table','help','wordcount',
       "advlist autolink autosave link image lists charmap print preview hr anchor pagebreak spellchecker",
        "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
        "save table contextmenu directionality emoticons template textcolor paste fullpage textcolor colorpicker"
     ],

     toolbar: 'code'
    });

    $("#txtsaved").Editor();    

$('.Editor-editor').html($('#txtsaved').text());

*/
     $("#savehtml_template").click(function(){
      var campaign_id = $("#campaign_id").val();
      var url = "Edm/html_template/"  + campaign_id;
     // var campaign_script = tinymce.get('campaign_script').getContent();
      //var campaign_script = $("#txtsaved").Editor("getText")
      var campaign_script = $("#txtsaved").val();
      var send_data = $.param({'campaign_script':campaign_script});
      var adata = ajax_call(url, send_data,true,2) ;
      return true;
    })

$("#sendtest").click(function (argument) {
     $('#test_send_model').appendTo("body").modal('show');
    })

    $("#sendemailtestrun").click(function(){
      $('#test_send_model').appendTo("body").modal('hide');
      var campaign_id = $("#campaign_id").val();
      var url = "Edm/tes_send/"  + campaign_id;
      var test_email_id = $("#test_email_id").val();
      var send_data = $.param({'test_email_id':test_email_id});
      var adata = ajax_call(url, send_data,true,1) ;
      return true;
    })

 

    
});    

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
                    var adata = ajax_call("Edm/delete_asset/",send_data );
                    if (adata.type == "success") {
                      $("#delete_assets" + assets_id).remove();
                    }
                  } 
             })
        });
    }
delete_assests();

Dropzone.options.dpAcceptFiles = {
    paramName: "file", // The name that will be used to transfer the file
    maxFilesize: 10, // MB
    //acceptedFiles: 'image/*',
    url: site_url + "Edm/uploadCampaignAssets",
    init: function() {
        this.on("sending", function(file, xhr, formData) {
          var campaign_id = $("#campaign_id").val();
          formData.append("campaign_id", campaign_id);
        });
      },    
    success: function(file, response){
        $("#asset_list").prepend('<li class="list-group-item" id="delete_assets'+response.id+'"><a class="badge badge-danger float-right delete_assets" data-id="'+response.id+'"><i class="fa fa-trash bg-danger"></i></a><a href="' + response.url  + '" target="_blank" >'+ response.client_name + '</a></li>');
        delete_assests();
    }
}
    var count_nxt = 0;
$( document ).ready(function() {

$("#smartwizard").on("showStep", function(e, anchorObject, stepIndex, stepDirection, stepPosition) {
                $("#prev-btn").removeClass('disabled').prop('disabled', false);
                $("#next-btn").removeClass('disabled').prop('disabled', false);
                if(stepPosition === 'first') {
                    $("#prev-btn").addClass('disabled').prop('disabled', true);
                } else if(stepPosition === 'last') {
                    $("#next-btn").addClass('disabled').prop('disabled', true);
                } else {
                    $("#prev-btn").removeClass('disabled').prop('disabled', false);
                    $("#next-btn").removeClass('disabled').prop('disabled', false);
                }

                // Get step info from Smart Wizard
                let stepInfo = $('#smartwizard').smartWizard("getStepInfo");
                $("#sw-current-step").text(stepInfo.currentStep + 1);
                $("#sw-total-step").text(stepInfo.totalSteps);
            });

    setTimeout(function () {
        $('#smartwizard').smartWizard({
            selected: 0,
            transitionEffect: 'fade',
            toolbarSettings: {
                toolbarPosition: 'none',
            }
        });

        $("#prev-btn").on("click", function () {
            // Navigate previous
            $('#smartwizard').smartWizard("prev");
            count_nxt = count_nxt - 1;
            btn_hide_show(count_nxt);
            return true;
        });

        $("#next-btn").on("click", function () {
            // Navigate next
           
           
            $('#smartwizard').smartWizard("next");
            count_nxt = count_nxt + 1;
            btn_hide_show(count_nxt); 
            
            return true;
        });

        $("#validate-btn").click(function(){
          var campaign_id = $("#campaign_id").val();
          var url = "Edm/validatecampaign/"  + campaign_id;
          var adata = ajax_call(url, "",true,1) ;
          return true;
        });

        $("#syncdata").click(function(){
          var send_data = $.param({"id":$("#campaign_id").val()});
          var url = "Edm/ajax_campaigndatasync/";
          var adata = ajax_call(url, send_data,true,1) ;
          return true;
        });
       
        
    }, 0);
});

 btn_hide_show(count_nxt);

function btn_hide_show(val) {
  return true; 
  if (val==0) {
     $("#prev-btn").hide();
  }
  else{
     $("#prev-btn").show();
  }
  if ($("#smartwizard > ul").find('li').length <= val +1  ) {
     $("#next-btn").hide();
  }
  else{
    $("#next-btn").show();
  }
}