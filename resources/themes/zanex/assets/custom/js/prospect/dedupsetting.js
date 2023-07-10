




$(".dedup").change(function() {
      if(this.checked) {
          ajax_call('Prospects/ajax_update_dedup', "name="+$(this).attr("id")+"&select=1" );
      }
      else
      {
        ajax_call('Prospects/ajax_update_dedup', "name="+$(this).attr("id")+"&select=0" );
      }
  });