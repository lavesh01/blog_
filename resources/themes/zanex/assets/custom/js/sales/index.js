function resizedragboard(el,t,s) {
    var kanbanboardheigth = 0;
    $( ".kanban-drag" ).each(function( index ) {
      if ( kanbanboardheigth < $( this ).height())
        {
            kanbanboardheigth = $( this ).height();
        }
    });
    kanbanboardheigth = kanbanboardheigth + 10;
    if ( t.clientHeight - 20 >=   kanbanboardheigth)
    {
         kanbanboardheigth = t.clientHeight + el.clientHeight + 10;
    }
    $(".kanban-drag").css("height", kanbanboardheigth );
}

var ismanager = $("#ismanager").val();
var kanbanjsonData =  ajax_call_no_alert("sales_ajax/getKanBanBoard/sales/" + ismanager ,{});
var theme_settings = $(".ui-theme-settings");
var KanbanTest = new jKanban({
        element: "#myKanban",
        gutter: "10px",
        dragBoards       : true,  
        click: function(el) {
          
            $('#kanbanitemsettingmodal').modal('show');
            block_ajax_ui('#kanbanitemsettingmodal')
            var send_data = $.param({"id": el.dataset.eid});
            var adata = ajax_call_no_alert("sales_ajax/ajax_load_business_item",send_data );
            $("#kanbanitemsettingmodalcontent").html(adata.html);
            init_page(el.dataset.eid);
            unblock_ajax_ui('#kanbanitemsettingmodal')
        },
        dropEl: function(el, target, source, sibling){
           var send_data = $.param({"id": el.dataset.eid, "boardId": target.parentElement.getAttribute('data-id')});
           ajax_call_no_alert("sales_ajax/changestatus",send_data,true );
           resizedragboard(el,target,source);
        },
        buttonClick: function(el, boardId) {
          // create a form to enter element
             resizedragboard(350);
          var formItem = document.createElement("form");
          formItem.setAttribute("class", "itemform");
          formItem.innerHTML =
            
            `<div class="main-card card">
                                        <div class="card-body"><h5 class="card-title">Add New Lead</h5>
                                            <div>
                                                <div class="input-group input-group-sm">
                                                    <div class="input-group-prepend"><span class="input-group-text">Name</span></div>
                                                    <input type="text" class="form-control" name="name" required="required">
                                                </div>
                                                <div class="input-group input-group-sm">
                                                    <div class="input-group-prepend"><span class="input-group-text">Email</span></div>
                                                    <input type="business_email" class="form-control" name="business_email" required="required">
                                                </div>
                                                <div class="input-group input-group-sm">
                                                    <div class="input-group-prepend"><span class="input-group-text">Company</span></div>
                                                    <input type="text" class="form-control" name="business_name" required="required">
                                                </div>
                                                <div class="input-group input-group-sm">
                                                    <div class="input-group-prepend"><span class="input-group-text">Designation</span></div>
                                                    <input type="text" class="form-control" name="designation" required="required">
                                                </div>
                                                <div class="input-group input-group-sm">
                                                    <div class="input-group-prepend"><span class="input-group-text">Leads</span></div>
                                                    <input type="number" class="form-control" name="leadsrequired" required="required">
                                                </div>
                                                <div class="input-group input-group-sm">
                                                    <div class="input-group-prepend"><span class="input-group-text">ETA Dates</span></div>
                                                    <input type="date" class="form-control" name="enddate" required="required">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
        <div class="row"><div class="form-group"><button  type="submit" name="submit" class="btn btn-info btn-xs pull-right">Submit</button><button type="button" id="CancelBtn" class="btn btn-default btn-xs pull-right">Cancel</button></div></div>`;
          KanbanTest.addForm(boardId, formItem);
          formItem.addEventListener("submit", function(e) {
            formItem.submit.disabled = true;
            e.preventDefault();
           
            var send_data = {} ;
            for (var i = 0; i < e.target.length; i++) {
                send_data[e.target[i].name]= e.target[i].value;
            }
            send_data["boardId"]= boardId;
            //var text = e.target[0].name;
           //  $.param({"title": text, "boardId": boardId});
            var data = new FormData(formItem);
            var adata = ajax_call_no_alert("sales_ajax/add_new_opportunity_title", $.param(send_data));
            if (adata.type == "success") {
              KanbanTest.addElement(boardId, {
                business_email  :adata.business_email   ,
                business_name   :adata.business_name    ,
                created_on  :adata.created_on   ,
                cssClass    :adata.cssClass ,
                designation :adata.designation  ,
                enddate :adata.enddate  ,
                id  :adata.id   ,
                leadsrequired   :adata.leadsrequired    ,
                name    :adata.name ,
                profile_url :adata.profile_url  ,
                reminder    :adata.reminder ,
                tags    :adata.tags ,
                title   :adata.title    ,
                username    :adata.username 
              });
              formItem.parentNode.removeChild(formItem);
              $(".custom-button").show();
            }
          });
          document.getElementById("CancelBtn").onclick = function() {
            formItem.parentNode.removeChild(formItem);
            $(".custom-button").show();
          };
        },
        addItemButton: true,
        itemAddOptions: {
          enabled: true,
          content: '+',
          class: 'custom-button',
          header: true
        },
        boards: kanbanjsonData
      });
      

   

    $(document).on("click",".custom-button",function(e) {
        $(".custom-button").hide();
        return false;
    });

    $(document).on("click",".updateItem",function() {
        var send_data = $("#itemForm").serialize();
        var adata = ajax_call_no_alert("sales_ajax/updateItem",send_data );
        if (adata.type == "success") {

          $('.ui-theme-settings').modal('toggle');
        }
        return false;
    });


$(document).on("click","#x",function(e) {
      $('.ui-theme-settings').modal('toggle');
  });



function checkEmailID()
{
  var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    var p_email_id=$('#p_email_id').val();
    if(!regex.test(p_email_id))
    {
      $('#p_email_id').val("");
      $('#p_email_id').focus();
      swal("Invalid..!", "Enter Valid Email ID")
      return false;
    } 
} 

function checkFirstName()
{
   var regex = /^[a-z A-Z]*$/;
   var p_f_name=$('#p_f_name').val();
   if(!regex.test(p_f_name))
  {
     $('#p_f_name').val("");
      $('#p_f_name').focus();
    swal("Invalid..!", "Enter Characters Only")
      return false;
  }
}

function checkLastName()
{
   var regex = /^[a-z A-Z]*$/;
   var p_l_name=$('#p_l_name').val();
   if(!regex.test(p_l_name))
  {
     $('#p_l_name').val("");
      $('#p_l_name').focus();
    swal("Invalid..!", "Enter Characters Only")
      return false;
  }
}



function checkMobile()
{
   
   var p_business_phone=$("#p_business_phone").val();
       
          if(!p_business_phone.match('[0-9]{10}')){   
           $('#p_business_phone').val("");
           $('#p_business_phone').focus(); 
              swal("Invalid..!", "Enter Valid Mobile No")
              return false;
   }
}
function checkPersonalMobile()
{
   
   var p_personal_phone=$("#p_personal_phone").val();
       
          if(!p_personal_phone.match('[0-9]{10}')){  
           $('#p_personal_phone').val("");
           $('#p_personal_phone').focus();  
              swal("Invalid..!", "Enter Valid Mobile No")
              return false;
   }
}


var send_data=[];
var action = []; 
  var aocolumnDefs =  [
                        {    
                           "aTargets": [0],
                           //"mData": "first_name",
                           "mRender": function (data, type, full) {
                            return '<p data-toggle="tooltip" data-title="'+ data + '">'+ stringshort(data,15) + '</p>';
                           }
                       },
                       {    
                           "aTargets": [2],
                           //"mData": "first_name",
                           "mRender": function (data, type, full) {
                            return '<p data-toggle="tooltip" data-title="'+ data + '">'+ stringshort(data,10) + '</p>';
                           }
                       },
                      {    
                           "aTargets": [3],
                           //"mData": "first_name",
                           "mRender": function (data, type, full) {
                            return '<a href="'+site_url+"Prospects/assetsdownloadlog/assets/"+ data + '/url" target="_blank"><i class="pe-7s-cloud-download"> </i></a>';
                           }
                       } ];




 ////////////////////////////////////////////////////////////
   $.fn.editable.defaults.mode = 'popup';$.fn.size = function() {return this.length;};
   $.fn.editableform.buttons =
'<button type="submit" class="btn btn-primary btn-sm editable-submit">' +
    '<i class="fa fa-fw fa-check"></i>' +
    '</button>' +
'<button type="button" class="btn btn-warning btn-sm editable-cancel">' +
    '<i class="fa fa-fw fa-times"></i>' +
    '</button>';
'<button type="submit" class="btn btn-primary btn-sm editable-submit"><i class="fa fa-fw fa-check"></i></button><button type="button" class="btn btn-warning btn-sm editable-cancel"><i class="fa fa-fw fa-times"></i></button>'

function init_page(argument) {
    var send_dataa=[];
    send_dataa.push({'key':'id', 'value' : argument});
    enable_common_dataTable( 'Sales_ajax/ajax_asset_details' ,"#edm_dataTable",action,aocolumnDefs,"", send_dataa);
   

     $('.inline_editable').editable({
        container: 'body',
        sourceCache: true,
        emptytext: 'empty', 
        placement: 'left',
        validate: function(value){
        if(value=="")
          return "Please Provide Value. ";
        }  
    });

     
    $('.inline_editable_reminder').editable({
        container: 'body',
        sourceCache: true,
        emptytext: 'empty', 
        placement: 'left',
        format: 'yyyy-mm-dd hh:ii',    
        viewformat: 'dd/mm/yyyy hh:ii',    
        datetimepicker: {
                weekStart: 1
           },
        validate: function(value){
        if(value=="")
          return "Please Provide Value. ";
        }  

    });
    $(document).on("click",".removeItem",function(e) {
        var send_data = $.param({'item_id':$("#itemForm").val()});
        var adata = ajax_call_no_alert("sales_ajax/removeItem",send_data );
        if (adata.type == "success") {
          $("div[data-eid='"+adata.item_id+"']").remove();
          $('.ui-theme-settings').modal('toggle');
        }
        return false;
    });

    ajax_call_no_alert('Udc/Udc/country/text', '',true,'JSON','xeditable_select(".inline_editable_country",data)');
    ajax_call_no_alert('Udc/Udc/BusinessSecretName/text', '',true,'JSON','xeditable_select(".inline_editable_BusinessSecretName",data)');

    $("#upload_prospect_file").click(function (argument) {
   block_ajax_ui();
   var url =site_url + "Sales_ajax/ajax_upload" ;
   event.preventDefault();
   var send_data = new FormData($("#right_content_setting")[0]);
   $.ajax({
            url: url,
            type: "POST",
            dataType: "JSON",
            data: send_data,
            processData: false,
            contentType: false,
            success: function (data, status)
            {
              if (data.type == "success") {
                var send_dataa=[];
                send_dataa.push({'key':'id', 'value' : $("#itemForm").val()});
                enable_common_dataTable( 'Sales_ajax/ajax_asset_details' ,"#edm_dataTable",action,aocolumnDefs,"", send_dataa);
               
                $("#exampleFile").val("");
                 unblock_ajax_ui();
              }
              else
              {
                unblock_ajax_ui();
                Swal.fire({
                  type: "warning",
                  title: "Not process. try again!!",
                  text: "Please Check your file and try re-uploading",
                  
                });
              }
              
            },
            error: function (xhr, desc, err)
            {
              unblock_ajax_ui();
              Swal.fire({
                  type: "danger",
                  title: "Pleas contact help desk.",
                  text: "Please Check your file and try re-uploading",
                  
                });
            }
        });

    });
}

    function xeditable_select(css_selector,adata)
    {
        $(css_selector).editable({
            source: adata,
            container: 'body',
             tpl: '<select></select>',
            select2: {
                 //minimumResultsForSearch: -1,
                placeholder: 'Select',
                //allowClear: true,
                 dropdownParent   : '.popover:last',
                width: '20em',
                dropdownAutoWidth: true,
                theme: 'bootstrap',
            } 
        });   
    }
/*$(function(){
    



$(document).ready(function() {
 ajax_call_no_alert('Udc/Udc/nic', send_data,true,'JSON','xeditable_select(".inline_editable_nic",data)')
 ajax_call_no_alert('Udc/Udc/sic', send_data,true,'JSON','xeditable_select(".inline_editable_sic",data)')
 ajax_call_no_alert('Udc/Udc/industry', send_data,true,'JSON','xeditable_select(".inline_editable_industry",data)')
 ajax_call_no_alert('Udc/Udc/revenue', send_data,true,'JSON','xeditable_select(".inline_editable_revenue",data)')
 ajax_call_no_alert('Udc/Udc/employee', send_data,true,'JSON','xeditable_select(".inline_editable_employee",data)')
 ajax_call_no_alert('Udc/Udc/country', send_data,true,'JSON','xeditable_select(".inline_editable_country",data)')


 $('.inline_editable,.inline_editable_nic, .inline_editable_sic, .inline_editable_industry,.inline_editable_revenue,.inline_editable_employee').on('shown', function(e, editable) {
        $('.editable-error-block').html('<div class="alert alert-warning alert-dismissible fade show" role="alert"><span class="pr-2"><i class="fa fa-question-circle"></i></span>Warning : Updating records will impact existing leads data. </div>').show();
    });
});

*/