          toastr.options = {
            "closeButton": true,
            "debug": false,
            "newestOnTop": true,
            "progressBar": true,
            "positionClass": "toast-top-right",
            "preventDuplicates": false,
            "onclick": null,
            "showDuration": "100",
            "hideDuration": "500",
            "timeOut": "500",
            "extendedTimeOut": "500",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
          }

function replaceAll(str, term, replacement) {
  return str.replace(new RegExp(escapeRegExp(term), 'g'), replacement);
}

function ajax_call(url, send_data,async= false , noti=1) {
  block_ajax_ui();
  var adata;
  $.ajax({
      type: "POST",
      async: async,
      cache:false,
      dataType: "JSON",
      url: site_url + url,
      data: send_data + "&" + $("#crsf_value").attr("name") +"="+ $("#crsf_value").val() ,
      success: function (data) {
        
        adata =  data;
        if ('Logged out' == data.title || data.title == "Access Required") {
          Swal.fire({
              type: data.type,
              title: data.title,
              html: data.text,
              confirmButtonClass: data.confirmButtonClass,
          });
        }
        
        if (noti == 1) {
         Swal.fire({
              type: data.type,
              title: data.title,
              html: data.text,
              confirmButtonClass: data.confirmButtonClass,
          });
        }
        else
        {
          if(data.type == "danger"){data.type = "error";}
          toastr[data.type](data.title, data.text);
        }

        unblock_ajax_ui();
        $('#crsf_value').val(data.csrf_value);
        
      },
      error: function (data) {
        unblock_ajax_ui()
          Swal.fire({
              type: data.type,
              title: data.title,
              html: data.text,
              confirmButtonClass: data.confirmButtonClass,
          })
        $('#crsf_value').val(data.csrf_value);
        adata =  data;
      }
  });
  return adata;
}


function ajax_call_no_alert(url, send_data="",async= false,dataType = "JSON",function_name='1' ) {
  var adata;
  unblock_ajax_ui()
  $.ajax({
      type: "POST",
      async: async,
      cache:false,
      dataType: dataType,
      url: site_url + url,
      data: send_data + "&" + $("#crsf_value").attr("name") +"="+ $("#crsf_value").val() ,
      success: function (data) {
       unblock_ajax_ui()
       if ('Logged out' == data.title || data.title == "Access Required") {
          Swal.fire({
              type: data.type,
              title: data.title,
              html: data.text,
              confirmButtonClass: data.confirmButtonClass,
          });
        }
        $('#crsf_value').val(data.csrf_value);
         adata = data;
         eval(function_name);
      },
      error: function (data) {
        unblock_ajax_ui()
      }
  });
  return adata;
}

function ajax_init(argument) {
  // body...
}

function open_common_htmlform_model(css_selector,form_path, function_name="ajax_init()") {
  $(css_selector).click(function(argument) {
    var adata = ajax_call_no_alert(form_path,"" );
    $("#model_form").html(adata.message);
    $('#commonModel').appendTo("body").modal('show');
    eval(function_name);
  });
}



//dom = '<"pull-left"l><"pull-left"i><"pull-right"f><"pull-right"p><"clear">'
var token ;

//{ "class":"group_access","icon":"ft-eye", "id":"access_", "href":"#", "title":" Allow", "html_element":"checkbox", "function":""},
function enable_common_dataTable(ajax_url,table_css_selector="", action="", columnDefs = {},
 custom_function = "", send_data = "" ,
button = [{ extend: 'colvis',
                text: 'Show/Hide'}],  
dom = "",
searchfield = "" )
{

  var table_selector_id = table_css_selector.substring(1, table_css_selector.length);
 if (dom == '') {
  dom = '<"pull-left"l><"pull-left"i><"pull-right"B><"pull-right"f><"pull-right"p><"clear">' ;
 }
 var aocolumnDefs =  [];
 if (action!="" && action !== "undefined") {
    var action_html = "";
    for (var i = 0; i < action.length; i++) {
      if (typeof action[i].html_element === "undefined") {
        action_html = action_html + '<a title="'+action[i].title+'" href="'+action[i].href+'_id" data-tooltip="tooltip" data-placement="top" class="fonticon-wrap '+action[i].class+'" id="'+action[i].id+'_id"><i class="'+action[i].icon+'"></i></a> ';
      }
      if ( action[i].html_element =="checkbox") {
        if (action[i].title === "undefined" ) {
          //action_html = action_html + '<input type="checkbox"   data-toggle="tooltip"  data-placement="top" class="fonticon-wrap '+action[i].class+'" id="'+action[i].id+'_id" value="'+action[i].id+'_id"/>';  
          //action_html = action_html + '<input type="checkbox"   data-toggle="tooltip"  data-placement="top" class="fonticon-wrap '+action[i].class+'" id="'+action[i].id+'" value="'+action[i].id+'/>';  
        } 
        else{
         action_html = action_html + '<input type="checkbox"   data-tooltip="tooltip"  data-placement="top" class="checkbox_datatable fonticon-wrap '+action[i].class+'" id="'+action[i].id+'" value="'+action[i].id+'"/>';    
         // action_html = action_html + '<label><input type="checkbox"   data-toggle="tooltip"  data-placement="top" class="fonticon-wrap '+action[i].class+'" id="'+action[i].id+'_id" value="'+action[i].id+'_id"> '+action[i].title+' </label> ';
        }
      }
    }
    if (action_html != "") {
              aocolumnDefs =  [
                 {    
                      "aTargets": [0],
                      //"mData": "first_name",
                      "mRender": function (data, type, full) {
                         
                          var new_action_html = action_html;
                          new_action_html = new_action_html.replace( /_id/g, data);
                          return new_action_html;
                         
                      }
                  }
               ];
    }
  }

  if (table_css_selector=="") {
    table_css_selector = "#common_dataTable";
  }
  
  for (var i = columnDefs.length - 1; i >= 0; i--) {
      aocolumnDefs.push(columnDefs[i]);
  }                 
  
  
  //console.log(aocolumnDefs);
  var fieldsenddata   = "";
              $.each(send_data, function(key, value) {
                   fieldsenddata = fieldsenddata +  value.key + "=" + value.value + "&";
              });
  fieldsenddata = fieldsenddata + "searchfield="+searchfield;

var fields = ajax_call_no_alert(ajax_url + '/field', fieldsenddata,async= false,dataType = "JSON" ); 

 if (fields !== undefined && fields.data.length >  aocolumnDefs.length) {
  for (var i = aocolumnDefs.length - 1; i >= 0; i--) {
    if (aocolumnDefs[i].hasOwnProperty('aTargets')) {
      $.each(aocolumnDefs[i], function (index, data) {
           fields.data[aocolumnDefs[i]["aTargets"][0]][index] = data;
      })
    }
  } 
 }
  if (fields.data.length <  columnDefs.length) {
  aocolumnDefs = "";
  columnDefs = "";
 }
  var return_datatable = $(table_css_selector).DataTable({

      "ajax": {
            "url": site_url + ajax_url,
            "type": "POST",

            "data": function(d){ 
              $.each(send_data, function(key, value) {
                    d[value.key] = value.value;
              });
              d["searchfield"] = searchfield;
              return d;
            },

            complete: function(response) {
                $('#crsf_value').val(response.responseJSON.csrf_value);
                if ( response.responseJSON.title =='Logged out')
                {
                  Swal.fire({
                      type: response.responseJSON.type,
                      title: response.responseJSON.text,
                      html: response.responseJSON.title
                  });
                  return;
                }
                token = (response.responseJSON.csrf_value);
                
                 //ajax_init();
                   for (var i = 0; i < action.length; i++) {
                    if (typeof action[i].function !== "undefined" || action[i].function != "") {
                      eval(action[i].function);
                    }
                  }
                  
                if (custom_function != "") {eval(custom_function)};
                
            },
      },
      buttons:    button,  
      "dom": dom,
      "responsive": true,
        "fixedHeader": true,
        "colReorder": true,
      "stateSave": true,
      "bAutoWidth" : true,
      "sScrollXInner": "100%",
      "scrollX": false,
      "processing": true,
      "serverSide": true,
      "destroy": true,
      "bDestroy":true,
      "scrollCollapse": true,
      "bLengthChange": true,
      "bFilter": true,
      "bSort": false,
      "bInfo": true,
      "bAutoWidth": false,
      "bJQueryUI": false,
      
      "pagingType": "numbers",
      "lengthMenu": [[10,25, 50, 100], [10, 25, 50, 100]],
      "language": {
            "emptyTable":       "No data available",
            "info":             "Total Records : _TOTAL_", //" Showing _START_ to _END_ of _TOTAL_ entries",
            "infoEmpty":        " Showing 0 to 0 of 0 entries",
            "infoFiltered":     "", //" (filtered from _MAX_ total entries)",
            "infoPostFix":      "",
            "lengthMenu":       "_MENU_",
            "loadingRecords":   "Loading...",
            "processing":       "Processing...",
            "search":           "",
            "zeroRecords":      "No data available",
            "paginate": {
                "first":        "First",
                "previous":     "Previous",
                "next":         "Next",
                "last":         "Last"
            },
            "aria": {
                "sortAscending":    ": activate to sort column ascending",
                "sortDescending":   ": activate to sort column descending"
            },
            "decimal":          "",
            "thousands":        ","
        },
      "fixedHeader": {
              header: false,
              headerOffset: $('.header-navbar').outerHeight()
      },
      "aoColumns": fields.data,
      //"aoColumnDefs": aocolumnDefs,
      'select': {
         'style': 'multi'
      },
      "createdRow": function( row, data, dataIndex ) {
          $(row).addClass( table_selector_id+'_datatable_row dataIndex_'+dataIndex );
          var firstKey = Object.keys(data)[0];
          $(row).attr('id', table_selector_id +'_'+ data[firstKey]);
          $(row).attr('data-id', data[firstKey]);
        },
    } );

      // Add event listener for opening and closing details
    $( table_css_selector+ ' tbody').on('click', 'td.details-control', function(){
        var tr = $(this).closest('tr');
        var row = table.row( tr );

        if(row.child.isShown()){
            // This row is already open - close it
            row.child.hide();
            tr.removeClass('shown');
        } else {
            // Open this row
            row.child(format(row.data())).show();
            tr.addClass('shown');
        }
    });

    
   
    if ($('body').hasClass('vertical-layout')) {
        var menuWidth = $('.main-menu').outerWidth();
        $('.fixedHeader-floating').css('margin-left',menuWidth+'px');
    }
    
    $(table_css_selector).on( 'column-visibility.dt', function ( e, settings, column, state ) {
         console.log('Column '+ column +' has changed to '+ (state ? 'visible' : 'hidden'));
    } );
    return_datatable.on( 'column-reorder', function ( e, settings, details ) {
      console.log('Hey!! You are fired, column-reorder');
    });
   /* 
   $('#common_dataTable tbody').on('click', '.action_view', function() {
        $('#common_dataTable tbody tr').removeClass("selected");
        $(this).addClass('selected');
    });
    */

       return return_datatable;
    
}


function select2_ajax(css_selector, ajax_url, placeholder="",multiple=true) {
    $(css_selector).select2({
        //dropdownAutoWidth: true,
        width: '100%',
        //maximumSelectionSize: 10,
        minimumResultsForSearch: Infinity,
        multiple: multiple,
        minimumInputLength: 2,
        allowClear: true,
        placeholder: {
          id: '-1', // the value of the option
          text: placeholder
        },
        ajax: { 
           url: site_url +  ajax_url,
           type: "post",
           dataType: 'json',
           delay: 250,
           data: function (params) {
            return {
              searchTerm: params.term // search term
            };
           },
           processResults: function (response) {
             return {
                results: response
             };
           },
           cache: true
          }
    });
}

function select2_preselected_ajax(css_selector, ajax_url) {
  var userSelect = $(css_selector);
  $.ajax({
            type: 'GET',
           url:site_url +  ajax_url,
           async : true,
          }).then(function (data) {
            data = JSON.parse(data);
            for (i = 0; i < data.length; ++i) {
                var currentObject = data[i];
                var option = new Option(currentObject.text, currentObject.id, true, true);
                userSelect.append(option).trigger('change');
            }
          });
}

function select2_select_unselected_ajax(css_selector, ajax_url, additional_param="") {
  $(css_selector).on('select2:select', function (e) {
    
    var id = e.params.data.id;
    if (additional_param =="") {
      var send_data = "select=yes&id=" + id ;
    }
    else
    {
      var send_data = "select=yes&id=" + id + "&" + additional_param;
    }
    
    var return_data = ajax_call_no_alert(ajax_url, send_data,true);
    
  });
  
  $(css_selector).on('select2:unselect', function (e) {
    
    var id = e.params.data.id;
    if (additional_param =="") {
      var send_data = "select=no&id=" + id ;
    }
    else
    {
      var send_data = "select=no&id=" + id + "&" + additional_param;
    }
    
    var return_data = ajax_call_no_alert(ajax_url, send_data,true);
    
  });


}


function dynamic_form(css_selector_to_render, json_data) {
     var  outputForm = $(css_selector_to_render);
     form = new FormForm( outputForm, json_data );
     form.render();
}

function unblock_ajax_ui(container=".app-container") {
  $(container).unblock();
}

function block_ajax_ui(container=".app-container")
{

   $.blockUI.defaults = {
          fadeIn: 200,
          fadeOut: 400,
  };
  $(container).block({
      message: $(
          '<div class="loader mx-auto">\n' +
          '                            <div class="ball-grid-pulse">\n' +
          '                                <div class="bg-white"></div>\n' +
          '                                <div class="bg-white"></div>\n' +
          '                                <div class="bg-white"></div>\n' +
          '                                <div class="bg-white"></div>\n' +
          '                                <div class="bg-white"></div>\n' +
          '                                <div class="bg-white"></div>\n' +
          '                                <div class="bg-white"></div>\n' +
          '                                <div class="bg-white"></div>\n' +
          '                                <div class="bg-white"></div>\n' +
          "                            </div>\n" +
          "                            Do not Refresh\n" +
          "                        </div>"
      ),
  });
}



function sumoselectretunvaue(css_selector)
{
  var obj = [],items = '';
  $(css_selector + ' option:selected').each(function(i) {
    obj.push($(this).val());
    //$(css_selector)[0].sumo.unSelectItem(i);
  });
  for(var i=0;i<obj.length;i++) {items += ',' + obj[i]};
  return (items);
}

//////////////////////session/////////////////
var currentSessionValue = 1;
    // pseudo code
    //setTimeout(checkSession, 10000);
    function checkSession() {
         $.ajax({
            url: site_url+"CheckSession/check_session", //Change this URL as per your settings
            success: function(newVal) {
                if (newVal != currentSessionValue);
                    currentSessionValue = newVal;
                    alert('Session expired.');
                    //window.location = 'Your redirect login URL goes here.';
                }
         });
    }

////////////// strig short 

function stringshort(str,limit=15, readmore='...'){
  console.log(str);
  if (str == '' || str === undefined || typeof str === 'undefined') {return str;}
  if (str.length > limit) {
    return jQuery.trim(str).substring(0, limit) + readmore;
  }
  else
  {
    return str;
  }
  
}  


/////////////////////mime icons////////////////////////////////////

  // List of official MIME Types: http://www.iana.org/assignments/media-types/media-types.xhtml
  var icon_classes = {
    // Media
    image: "fa-file-image-o",
    audio: "fa-file-audio-o",
    video: "fa-file-video-o",
    // Documents
    "application/pdf": "fa-file-pdf-o",
    "application/msword": "fa-file-word-o",
    "application/vnd.ms-word": "fa-file-word-o",
    "application/vnd.oasis.opendocument.text": "fa-file-word-o",
    "application/vnd.openxmlformats-officedocument.wordprocessingml":
      "fa-file-word-o",
    "application/vnd.ms-excel": "fa-file-excel-o",
    "application/vnd.openxmlformats-officedocument.spreadsheetml":
      "fa-file-excel-o",
    "application/vnd.oasis.opendocument.spreadsheet": "fa-file-excel-o",
    "application/vnd.ms-powerpoint": "fa-file-powerpoint-o",
    "application/vnd.openxmlformats-officedocument.presentationml":
      "fa-file-powerpoint-o",
    "application/vnd.oasis.opendocument.presentation": "fa-file-powerpoint-o",
    "text/plain": "fa-file-text-o",
    "text/html": "fa-file-code-o",
    "application/json": "fa-file-code-o",
    // Archives
    "application/gzip": "fa-file-archive-o",
    "application/zip": "fa-file-archive-o",
    //image
    'text/png' : "fa-file-image-o",
    'text/jpeg' : "fa-file-image-o",
    'text/jpg' : "fa-file-image-o",
    'text/gif' : "fa-file-image-o",
  };

////////////// random bootstrap classs 

var bootclasses = ["primary", "secondary", "info", "warning", "focus", "alternate","dark"];


function randomBootCss() {
  var bootclassesCopy = bootclasses.slice();
  if (!bootclassesCopy.length) {
    bootclassesCopy = classes.slice();
  } 
  return bootclassesCopy.splice(Math.floor(Math.random() * bootclassesCopy.length), 1);
};




$(document).ready(function() {

/*
      window.history.pushState(null, "", window.location.href);        

      window.onpopstate = function() {

          window.history.pushState(null, "", window.location.href);

      };
      */
    $(window).keydown(function(event){
        if(event.keyCode == 13) {
          event.preventDefault();
          return false;
        }
      });

   // $('body').bind('copy', function(event){event.preventDefault();});

    document.onContextMenu=new Function('return false');

});

function validatePhoneNumber(txtPhone) {
  return true;
    var filter = /^[0-9]+$/;
    if (filter.test(txtPhone) && txtPhone.length > 0 && txtPhone.length <= 15) {
        return true;
    }
    else {
        return false;
    }
}

function downloadclose(argument) {
  window.history.go(-1);
}


$('.modal').on('shown.bs.modal', function() {
  //Make sure the modal and backdrop are siblings (changes the DOM)
  $(this).appendTo("body").modal('show');
})

