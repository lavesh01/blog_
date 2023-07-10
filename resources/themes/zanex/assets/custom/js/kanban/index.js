function resizedragboard() {
    return false;
    var kanbanboardheigth = 0;
    $( ".kanban-drag" ).each(function( index ) {
      //console.log( );
      if ( kanbanboardheigth < $( this ).height())
        {
            kanbanboardheigth = $( this ).height();
        }
    });
     $(".kanban-drag").css("height", kanbanboardheigth);
}

var theme_settings = $("#kanbanitemsettingmodal");
function renderboard(boardId_from_tab) {
    var ismanager = $("#ismanager").val();
    $("#myKanban").html("");
    $('#pagetitle').html("Kanban Board - " + boardId_from_tab);
    var kanbanjsonData =  ajax_call_no_alert("kanban/getKanBanBoard/"+boardId_from_tab+"/" + ismanager ,{});
    kanbanjsonData.push( { id: "addnewboard_default",
            title: '<a href="javascript:void(0);" class="btn btn-info" id="addnewboard_default_btn">Add New Section</a>' } );
    var KanbanTest = new jKanban({
            element: "#myKanban",
            gutter: "10px",
            dragBoards       : true,  
            click: function(el) {
                $('#kanbanitemsettingmodal').modal('show');
                block_ajax_ui('#kanbanitemsettingmodal')
                var send_data = $.param({"id": el.dataset.eid});
                var adata = ajax_call_no_alert("kanban/ajax_load_business_item",send_data );
                $("#kanbanitemsettingmodalcontent").html(adata.html);
                init_page(el.dataset.eid);
                unblock_ajax_ui('#kanbanitemsettingmodal')
            },
            dropEl: function(el, target, source, sibling){
               var send_data = $.param({"id": el.dataset.eid, "boardId": target.parentElement.getAttribute('data-id')});
               ajax_call_no_alert("kanban/changestatus",send_data,true );
            },
            buttonClick: function(el, boardId) {
              // create a form to enter element
                 //resizedragboard(350);
              var formItem = document.createElement("form");
              formItem.setAttribute("class", "itemform");
              formItem.innerHTML =
                
                `<div class="main-card card">
                                            <div class="card-body"><h5 class="card-title">Add New Item</h5>
                                                <div>
                                                    <div class="input-group input-group-sm">
                                                        <div class="input-group-prepend"><span class="input-group-text">Title</span></div>
                                                        <input type="text" class="form-control" name="title" required="required">
                                                    </div>
                                                    <div class="input-group input-group-sm">
                                                        <div class="input-group-prepend"><span class="input-group-text">Notes</span></div>
                                                        <input type="textarea" class="form-control" name="notes" required="required">
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
                var adata = ajax_call_no_alert("kanban/add_new_opportunity_title", $.param(send_data));
                if (adata.type == "success") {
                  KanbanTest.addElement(boardId, {
                    created_on  :adata.created_on   ,
                    cssClass    :adata.cssClass ,
                    enddate :adata.enddate  ,
                    id  :adata.id   ,
                    profile_url :adata.profile_url  ,
                    reminder    :adata.reminder ,
                    tags    :adata.tags ,
                    title   :adata.title    ,
                    notes:adata.notes,
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
              content: 'Add New Item',
              class: 'custom-button',
              footer: true
            },
            boards: kanbanjsonData,
            dragendBoard: function (el) {
                getBoardSectionOrder();
            },        
          });

        
        $(".kanban-drag").css("height", $(".kanban-container").height() + 200);
        $('.kanban-title-board').after(` 
                                <div class="ms-auto fs-13 me-2 fw-semibold custom-button-delete text-primary"><i class="fa fa-trash-o"></i></div>
                                <div class="ms-auto fs-13 me-2 fw-semibold custom-button-edit text-primary"><i class="fa fa-edit"></i></div>
                                `);
        $('[data-id="addnewboard_default"] > footer > .custom-button').remove();
        $('[data-id="addnewboard_default"] > main').remove();
        $('[data-id="addnewboard_default"] > .kanban-board-header > .custom-button-delete').remove();
        $('[data-id="addnewboard_default"] > .kanban-board-header > .custom-button-edit').remove();
}

    $(document).on("click",".custom-button-delete",function(e) {
        var statusid = ($(this).closest(".kanban-board").data("id"));
        var send_data = $.param({"id":statusid});
        var adata = ajax_call_no_alert("kanban/ajax_delete_status", send_data);
        if (adata.type == "success") {
            $('.kanban-board[data-id="'+statusid+'"]').remove();
        }
        return false;
    });

    $(document).on("click",".custom-button-edit",function(e) {
         var divstatus =  ($(this).closest(".kanban-board"));
         var statusid = divstatus.data("id");
         var t = divstatus.find('.kanban-title-board').text();
        $("#hidden_divstatuscount").val( t.split('-').pop().trim()); 
        $("#in_renameboardstatus").val( t.substring(0, t.lastIndexOf(" ") ));
        $("#hidden_renameboardstatus").val(statusid);
        $('#modal_renameboardstatus').appendTo("body").modal('show')
        return false;
    });

    $(document).on("click","#save_renameboardstatus",function(e) {
       
        var send_data = $.param({"id":$("#hidden_renameboardstatus").val(), "name": $("#in_renameboardstatus").val()});
        var adata = ajax_call_no_alert("kanban/ajax_rename_status", send_data);
        if (adata.type == "success") {
            var newname =$("#in_renameboardstatus").val() + " " +  $("#hidden_divstatuscount").val( );
            $('.kanban-board[data-id="'+$("#hidden_renameboardstatus").val()+'"]').find('.kanban-title-board').text( newname);
        }
        return false;
    });

    $(document).on("click",".custom-button",function(e) {
        $(".custom-button").hide();
        return false;
    });

    $(document).on("click",".updateItem",function() {
        var send_data = $("#itemForm").serialize();
        var adata = ajax_call_no_alert("kanban/updateItem",send_data );
        if (adata.type == "success") {

          //$('#kanbanitemsettingmodal').appendTo("body").modal('hide')
        }
        return false;
    });


$(document).on("click","#x",function(e) {
      $('#kanbanitemsettingmodal').appendTo("body").modal('hide')
  });




/////////////////////////////////////////////////

////////////////////////////////////////////////////////////
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
    enable_common_dataTable( 'Kanban/ajax_asset_details' ,"#edm_dataTable",action,aocolumnDefs,"", send_dataa);
   

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
        var adata = ajax_call_no_alert("Kanban/removeItem",send_data );
        if (adata.type == "success") {
          $("div[data-eid='"+adata.item_id+"']").remove();
          $('#kanbanitemsettingmodal').modal('toggle');
        }
        return false;
    });

   // ajax_call_no_alert('Udc/Udc/country/text', '',true,'JSON','xeditable_select(".inline_editable_country",data)');
   // ajax_call_no_alert('Udc/Udc/BusinessSecretName/text', '',true,'JSON','xeditable_select(".inline_editable_BusinessSecretName",data)');

    $("#upload_prospect_file").click(function (argument) {
   block_ajax_ui();
   var url =site_url + "Kanban/ajax_upload" ;
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
                enable_common_dataTable( 'Kanban/ajax_asset_details' ,"#edm_dataTable",action,aocolumnDefs,"", send_dataa);
               
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
    comment_fn();
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

//////////////////////////////////////////////


    

var comment_action = []; 
var comment_aocolumnDefs =  [
                        {    
                           "aTargets": [0],
                           //"mData": "first_name",
                           "mRender": function (data, type, full) {
                            return `
                                    <div class="chat-box-wrapper" style="padding:0px !important">
                                        <div>
                                            <div class="avatar-icon-wrapper mr-1">
                                                <div class="badge badge-bottom btn-shine badge-success badge-dot badge-dot-lg"></div>
                                                <div class="avatar-icon avatar-icon-lg rounded">
                                                    <img src="` + site_url+ full.profile_url+`" alt="`+ full.username+`"></div>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="chat-box">`+full.comment+`
                                            </div>
                                            <small class="opacity-6">
                                            `+ full.username+`
                                                <i class="fa fa-calendar-alt mr-1"></i>
                                                `+full.created_on+`
                                            </small>
                                        </div>
                                    </div>
                                    `;
                           }
                       },
                       {    
                           "aTargets": [1],
                           "bVisible":false,
                           "visible":false,
                       },
                       {    
                           "aTargets": [2],
                           "bVisible":false,"visible":false,
                       },
                       {    
                           "aTargets": [3],
                           "bVisible":false,"visible":false,
                       },
                       {    
                           "aTargets": [4],
                           "bVisible":false,"visible":false,
                       }];
var get_comment_send_dataa=[];
function comment_fn (argument) {                       
    get_comment_send_dataa.push({'key':'module', 'value' : 'kanban'});
    get_comment_send_dataa.push({'key':'ref_id', 'value' : $('#itemForm').val()});
    enable_common_dataTable( 'Kanban/getComments' ,"#comments_dataTable",comment_action,comment_aocolumnDefs,"", get_comment_send_dataa);
}

$(document).on("click","#add_comment",function(e) {
    var set_comment_send_data = $.param({'comment':$("#Comment_box").val(), 'module':'kanban', 'ref_id': $('#itemForm').val()});        
    var adata = ajax_call_no_alert("Kanban/setComments",set_comment_send_data );
    if (adata.type == "success") {
        $("#Comment_box").val("")
     enable_common_dataTable( 'Kanban/getComments' ,"#comments_dataTable",comment_action,comment_aocolumnDefs,"", get_comment_send_dataa);
    }
    return false;
});

$(document).on('click','.click_add_user_to_group_access',function(){
    if ($("#groupid").val() == "")
    {
        toastr["warning"]("select board first");
        return false;
    }
    var send_data = [];
    var aocolumnDefs_1 =  [
                    {    
                        "aTargets": [0],
                        "mRender": function (data, type, full) {
                           var chked = "";
                           if (full.cid != '' && full.cid != null && full.cid !== undefined ) {
                             chked = "checked";   
                            }
                            return '<label><input type="checkbox"  title="Check enable this group" data-toggle="tooltip"  data-placement="top" class="click_enable_user"  value="'+data+'" '+chked+' > </label> ';
                        }
                      },
                      {
                        "aTargets": [2],
                        visible: false
                      }
                   ];  
    send_data.push({'key':'group_id', 'value' : $("#groupid").val()});
    $('#agentsubdispositionModel').appendTo("body").modal('show');
    $('#subdisposition_data').html('');
    enable_common_dataTable( 'Usergroupaccess/listCampaignUserOfAGroup/' ,"#subdisposition_data",'',aocolumnDefs_1,"",send_data);
});

$(document).on("click",".boardname",function() {
    $("#groupid").val( $(this).data("id"));
    $("#selectedboardname").val($(this).data("name"))
    renderboard($(this).data("name"));
    return false;
});

$(document).on("change",".click_enable_user",function() {
    if(this.checked) {
    ajax_call('Usergroupaccess/addUserFromGroup/', "group_id="+$("#groupid").val()+"&user_id="+$(this).val() ); 
    }
    else
    {
     ajax_call('Usergroupaccess/removeUserFromGroup/', "group_id="+$("#groupid").val()+"&user_id="+$(this).val() ); 
    }
});

$(document).on("click","#create_api",function() {
    $('#modal_create_api').appendTo("body").modal('show');
});

$('#save_btn').on('click', function () {
    var send_data = $("#insert_api_details").serialize();
    var send_data = $.param({ "name": $("#name").val()});
       
    var adata = ajax_call("Kanban/add_new_category",send_data );
    if(adata.type=="success")
    {
       var name = $("#name").val();
       $('#modal_create_api').modal('hide');
       $("#groupid").val(adata.group_id);
       $('#boardlist').after('<li><a href="javascript:void(0);" data-id ="'+adata.group_id+'" class="boardname" data-name="'+name+'"> '+name+' </a></li>');
       renderboard($("#name").val());
       return false;
    }
});

$(document).on('click','#delete_add_user_to_group_access',function(){
    if ($("#groupid").val() == "")
    {
        toastr["warning"]("select board first");
        return false;
    }
    
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
        var send_data = $.param({"deletegroupid":$("#groupid").val()});
        var adata = ajax_call("Usergroupaccess/delete",send_data);
        if (adata.type == "success") {
          $('li a[data-id="'+$("#groupid").val()+'"]').remove();
          $("#groupid").val("");
          $("#pagetitle").val("Kanban Board");
        }
      } else if (result.dismiss === Swal.DismissReason.cancel) {
        Swal.fire({
          title: 'Cancelled',
          text: 'Designation is safe :)',
          type: 'error',
          confirmButtonClass: 'btn btn-success',
        })
      }
    })
});


$(document).on('click','#addnewboard_default_btn',function(){
   $('#addboardsection').appendTo("body").modal('show');
});

$(document).on('click','#add_new_field',function(){
     
    var id = $("#groupid").val();
    var send_data = $("#addinputmodalform").serialize();
    var adata = ajax_call("Kanban/add_new_status/" + $("#selectedboardname").val(),send_data,false,2 );
    if(adata.type=="success")
    {
       renderboard($("#selectedboardname").val());
       return false;
    }
});

function getBoardSectionOrder(){
    var order= $(".kanban-board").map(function() {       
        if ($(this).data("id")!="addnewboard_default"  ) {
            return $(this).data("id");  
        } 
    }).get();
    var f='order='+order;
    ajax_call_no_alert("Kanban/ajax_order_status",f)
}