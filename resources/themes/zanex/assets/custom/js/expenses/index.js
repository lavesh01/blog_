function submitProjectForm() 
{
    var send_data  = $("#projectForm").serialize();
    var adata = ajax_call("expense/Manager/add_project",send_data );
    if(adata.type == "success")
    {
      return false;
    }
};


function submitCategoryForm() {
  var send_data  = $("#categoryForm").serialize();
    var adata = ajax_call("expense/Manager/add_category",send_data );
    if(adata.type == "success")
    {
      return false;
    }
}

function submitAddExpenseForm() {
    var send_data  = $("#newExpenseForm").serialize();
    var adata = ajax_call("expense/Manager/add_expense",send_data );
    if(adata.type == "success")
    {
      loadmyexpenses();
      return false;
    }
}


$('#addExpenseModal').on('shown.bs.modal', function() {
    var adata = ajax_call_no_alert("expense/Manager/ajax_get_projectsncategoary" );
    if(adata.type == "success")
    {
      $('#newProject').html("");
      $('#newCategory').html("");
      $.each(adata.projects, function(key, value) {
          $('#newProject').append($('<option>').text(value.name).attr('value', value.id));
      });
      $.each(adata.category, function(key, value) {
          $('#newCategory').append($('<option>').text(value.name).attr('value', value.id));
      });
    }
});

  var aocolumnDefs =  [
          {        
              "aTargets": [0],
              //"mData": "first_name",
               "title": "<input type='checkbox' id='selectAll'></input>",
              "sTitle": "<input type='checkbox' id='selectAll'></input>",
              "mRender": function (data, type, full) {
                if (full.status == 0) {
                 return full.status + '<input type="checkbox" class="checkbox_datatable fonticon-wrap view_leads" id="checked'+data+'" value="checked'+data+'">';
                }
              }
          },
          {
          "aTargets": [1],
          //"mData": "first_name",
          "mRender": function (data, type, full) {
            //console.log(data);
             if ( data == "0") {
              return '<div class="badge bg-pill bg-warning text-center">Pending</div>';
                      
             }
             else if ( data == "1") {
             return '<div class="badge bg-pill bg-info text-center">Approved</div>';
             }
             else if ( data == "2") {
              return '<div class="badge bg-pill bg-danger text-center">Reject</div>';
             }
             else
             {
              return "";
             }
          }
      }
   ];  

var checkbox_datatable = [];
function checkbox_datatable_check()
{
    $(".checkbox_datatable").change(function() {
      if(this.checked) {
          checkbox_datatable.push($(this).val());
      }
      else
      {
        checkbox_datatable.splice( $.inArray($(this).val(),checkbox_datatable) ,1 );
      }
  });
  for (var i = checkbox_datatable.length - 1; i >= 0; i--) {
    $("#"+checkbox_datatable[i]).prop('checked', true);
  } 
}

function loadmyexpenses() {
  
  var action = [
                    { "html_element": "checkbox", "class":"view_leads","icon":"fa fa-plus icon-gradient bg-ripe-malin", "id":"checked_id"}
                   
              ]; 
    enable_common_dataTable( 'expense/Manager/ajax_myexpenses' ,"#myexpenses_dataTable",action,aocolumnDefs,"checkbox_datatable_check()");
} ;

loadmyexpenses() 