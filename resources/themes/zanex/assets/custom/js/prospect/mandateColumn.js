




$(".dedup").change(function() {
      if(this.checked) {
          ajax_call('Prospects/ajax_update_mandateColumn', "name="+$(this).attr("id")+"&select=1&col_type="+$(this).data("col_type"));
      }
      else
      {
        ajax_call('Prospects/ajax_update_mandateColumn', "name="+$(this).attr("id")+"&select=0&col_type="+$(this).data("col_type"));
      }
  });


function getOrder(){
    var order= $(".sortable .ui-state-default").map(function() {        
        return this.id;        
    }).get();
    console.log(order);
    f='order='+order;
    $.ajax({
        type: "POST",
        data :f,
        cache: false,
        url: site_url+"Prospects/ajax_order_mandateColumn",
        success: function(data){
            //success
        }
    });
    return order;
}

$(document).ready(function() {

    $(".sortable").sortable({
        update: function(event, ui) { 
            getOrder() 
        }
    });
});