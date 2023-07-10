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
    $("#model_form").html(adata.html);
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

  block_ajax_ui(table_css_selector);
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
if (fields.hasOwnProperty('code')) {
  return fields;
}

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
            "async" : true,
            "data": function(d){ 
              $.each(send_data, function(key, value) {
                    d[value.key] = value.value;
              });
              d["searchfield"] = searchfield;
              d["iTotalDisplayRecordspost"] = $("#edm_dataTable_info").text();
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
     
        "fixedHeader": true,
        "colReorder": true,
      "stateSave": true,
     
    
      "processing": true,
      "serverSide": true,
      "destroy": true,
      "bDestroy":true,
      "scrollCollapse": true,
      "bLengthChange": true,
      "bFilter": true,
      "bSort": false,
      "bInfo": true,
      "processing" : true,
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
            "processing":       '<div class="spinner"></div>',
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
unblock_ajax_ui(table_css_selector);
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

function unblock_ajax_ui(container="#main-content-page") {
  $(container).unblock();
}

function block_ajax_ui(container="#main-content-page")
{

   $.blockUI.defaults = {
          fadeIn: 200,
          fadeOut: 400,
  };
  $(container).block({
      message: $(
          '<div class="loader mx-auto ">\n' +
          '                            <div class="loading">' +
                          
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

var bootclasses = ["primary", "secondary", "info", "warning",  "secondary","dark"];


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


function removeCSSFileWithAttribute(attribute, value) {
  const head = document.getElementsByTagName('head')[0];
  const links = head.getElementsByTagName('link');
  
  for (let i = 0; i < links.length; i++) {
    if (links[i].getAttribute(attribute) === value && links[i].getAttribute('rel') === 'stylesheet') {
      head.removeChild(links[i]);
      
    }
  }
}

function removeJSFileWithAttribute(attribute, value) {
  const head = document.getElementsByTagName('head')[0];
  const scripts = head.getElementsByTagName('script');
  
  for (let i = 0; i < scripts.length; i++) {
    if (scripts[i].getAttribute(attribute) === value) {
      head.removeChild(scripts[i]);
      
    }
  }
}
addHeadScript = function(js,name) {
    var head = document.getElementsByTagName("head")[0],
    script = document.createElement('script');
    script.type = 'text/javascript'
    script.src = js 
    script.setAttribute("head", name)
    script.setAttribute("async", "async")
    script.setAttribute("defer", "defer")
    head.appendChild(script);
};

addHeadCss = function(css,name ) {
    var head = document.getElementsByTagName("head")[0],
    script = document.createElement('link');
    script.rel='stylesheet';
    script.href=css;
    script.setAttribute("head",name)
    head.appendChild(script);
};


var globalpagejson;

function ajaxpageload(url=window.location.href, selectorforsectionrendering = '#main-content-page')
{
 
  history.pushState({}, null, url);
  $("#pagetitle").text("" );
  document.title = '';
  $("#pagebreadcrumbs").html("" );
  $(selectorforsectionrendering).html("");
  removeCSSFileWithAttribute("head", selectorforsectionrendering) 
  removeJSFileWithAttribute("head", selectorforsectionrendering)
  block_ajax_ui();
  $("script[head='"+selectorforsectionrendering+"']").remove()
    var topheader =  $("#main-content-page-topheader").attr("data-id");
    var leftsubmenu =  $("#main-content-page-leftsubmenu").attr("data-id");
    $.post( url, { "topheader" : topheader ,"leftsubmenu":leftsubmenu })
    .fail(function(response) {
      $("#pagetitle").html(response.statusText);
      document.title = data.title;
      $("#pagebreadcrumbs").html("It's Us. Something went wrong" );
      $(selectorforsectionrendering).html(response.responseText );
    })
    .done(function(data, statusText, xhr) {

        if ( xhr.status == 200) {
          $("#pagetitle").text(data.title );
          $(selectorforsectionrendering).html(data.html);
          if( typeof data.js !==  "undefined")
          {
            for (var i = 0; i <= data.js.length - 1; i++) {
             addHeadScript(data.js[i] + '?' + Math.random(),selectorforsectionrendering)
            }
          }
          if( typeof data.css !==  "undefined")
          {
            for (var i = 0; i <= data.css.length - 1; i++) {
             addHeadCss(data.css[i]+ '?' + Math.random(),selectorforsectionrendering)
            }
          }
          
          document.title = data.title;
          $("#pagebreadcrumbs").html(data.breadcrumbs );
          if (typeof data.topheader !==  "undefined" &&  data.topheader != "" && data.topheaderhtml != "") {
            $("#main-content-page-topheader").html(data.topheaderhtml);
            $("#main-content-page-topheader").attr("data-id",data.topheader);
          }
          else{
            $("#main-content-page-topheader").html("");
            $("#main-content-page-topheader").attr("data-id","");
          }
          if (typeof data.leftsubmenu !==  "undefined" && data.leftsubmenu != "" && data.leftsubmenuhtml != "") {
            $("#main-content-page-leftsubmenu").html(data.leftsubmenuhtml);
            $("#main-content-page-leftsubmenu").attr("data-id",data.leftsubmenu);
            $("#main-content-page-leftsubmenu").attr("class","col-md-12 col-lg-4 col-xl-3");
            $("#main-content-page").attr("class","col-md-12 col-lg-8 col-xl-9");
          }    
          else{
            $("#main-content-page-leftsubmenu").html("");
            $("#main-content-page-leftsubmenu").attr("data-id","");
            $("#main-content-page-leftsubmenu").attr("class","");
            $("#main-content-page").attr("class","");
          }     
          globalpagejson =    data;
        }
        else{
          $(selectorforsectionrendering).html("It's Us. Something went wrong. Try Refreshing the page");
        }
    }).always(function() {
      unblock_ajax_ui();
    });
    ;  
}

$(document).ready(function() {
  ajaxpageload();
    $('ul.side-menu[href*="'+ window.location.href + '"]').addClass('show active'); 
});

$(document).on('click','a', function () {
 
  var url = $(this).attr('href');
  if (url === undefined 
    || url === false
    || url === null 
    || "javascript:void(0);" ==url
    || url == window.location.href  ) {
    return false;
  } 
  else
  if (  url.indexOf(site_url+'auth/') >=0 )
  {
    window.location.href = url;
    return false;
  }
  else
  if (  $(this).attr('target') == "_blank")
  {
    return false;
  }

  else
  if ( url.indexOf(site_url) >=0  
  )
  {
    $.xhrPool.abortAll();
    ajaxpageload(url);
    return false;
  }

});

function fillatt(data,selector, type,param={"type":"text","mode":"inline"})
{

  if ($(selector).length <= 0) {
    return;
  }
  if ((data == "null" || data == "" || data === "undefined" || typeof data === undefined)) {
    data == "Empty";
  }

  if (type == "html") { 
    $(selector).html(data);
  } 
  else if (type == "text") {
    $(selector).text(data);
  } 
  else if (type == "val") {
    $(selector).val(data);
  } 
  else if (type == "select") {
    $(selector).val(data).change();;
  }
  else if (type == "editable")
   { 
    
    $(selector).editable('destroy');$(selector).text(data);
    $(selector).editable({
        setValue:data,
        type: param.type,
        pk: param.pk,
        url: param.url,
        mode:param.mode,
        title:param.title,
        showbuttons:true,
        params: function(params) {
           param.value = params.value;
            return param;
        },
        display: function(value) {
          $(this).text(value);
        } ,
         validate: function(value){
           if(value==""){
              return "Please Provide Value. ";
           }
           
         },  
         success: function(response, newValue) {
            if(response.status == 'error') { console.log(response.msg); return 'try gain !!' };
        }
      });
   }
  else if (type == "editableselect") {
    var found = false;
    var text = '';

    $.each(param.adata, function(index, obj) {
      if (obj.id == data && !found) {
        found = true;
        text = obj.text;
        return false; // exit loop early
      }
    });

    $(selector).text(text);
    $(selector).editable('destroy');
    $(selector).editable({

        source: param.adata,
        type: param.type,
        pk: param.pk,
        url: param.url,
        mode:'popup',
        tpl: '<select></select>',
        select2: {
            val:data,
            placeholder: 'Select',
            dropdownParent   : '.popover:last',
            //width: '20em',
            dropdownAutoWidth: true,
            
        } ,
        params: function(params) {
         
          return $.extend({}, params, param);
            return params;
        },
        validate: function(value){
           if(value==""){
              return "Please Provide Value. ";
           }
         },
         success: function(response, newValue) {
            if(response.status == 'error') { console.log(response.msg); return 'try gain !!' };
        }
    });   
  }

}


function printhistory(argument) {

    var position;
    var str = '<section style="background-color: #F0F2F5;"><div class="container py-5"><div class="main-timeline">';
    $.each(argument, function(i, item) {
     
      i = i +1;
      if(i % 2 == 0) {
        position = "left";
      }
      else{
        position = "right";
      }
      str = str + '<div class="timeline '+position+'"><div class="card"><div class="card-body p-4">';
      str = str +`<div class="activity-blog">
              <div class="activity-img brround bg-primary-transparent text-primary">
                 <img src="`+site_url + item.profile_url +`" alt="profile-user" class="avatar  profile-user brround cover-image">
              </div>
              <div class="activity-details d-flex">
                  <div><b><span class="text-dark"> `+item.display_name+`</span> </b> </br>`+item.field_name+` Changed From <span class="badge bg-`+randomBootCss()+` text-white">`+ item.oldvalue + `</span> To <span class="badge bg-`+randomBootCss()+` text-white">  ` + item.newvalue 
                  +`</span></span></br><span class="badge bg-primary text-white">`+item.created_on+`</span></div>
                  
              </div>
          </div>`
      str = str + '<p class="mb-0"></p>';
      str = str + '</div></div></div>';
      
    });
    str = str  + '</div></div></section>';
    return str;
  }

  $.xhrPool = [];
  $(function() {
       
        $.xhrPool.abortAll = function() {
            $($.xhrPool).each(function(i, jqXHR) {   //  cycle through list of recorded connection
                jqXHR.abort();  //  aborts connection
                $.xhrPool.splice(i, 1); //  removes from list by index
            });
        }
        $.ajaxSetup({
            beforeSend: function(jqXHR) { $.xhrPool.push(jqXHR); }, //  annd connection to list
            complete: function(jqXHR) {
                var i = $.xhrPool.indexOf(jqXHR);   //  get index for current connection completed
                if (i > -1) $.xhrPool.splice(i, 1); //  removes from list by index
            }
        });
    })


/*
function opencontrollerinmodeliniframe(css_selector,page_url) {
  $(css_selector).click(function(argument) {
    ajaxpageload(page_url, '#commonModel')
    $("#commonModel").html(adata.message);
    $('#commonModel').appendTo("body").modal('show');
    eval(function_name);
  });
}
*/