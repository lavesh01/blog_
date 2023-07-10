var bname = '';
    if (item.first_name !== undefined && item.first_name != '' && item.first_name !=  null  ) {
      bname = item.first_name;
    }
    if (item.last_name !== undefined && item.last_name != '' && item.last_name !=  null ) {
      bname = bname + ' ' +item.last_name;
    }
    var strtag = "";
    if (item.tags !== undefined && item.tags != '' && item.tags !=  null  ) {
      var tag =   item.tags.split(",");
      
      for(var i = 0; i < tag.length; i++) {
        strtag = strtag + '<div class="m-1 badge badge-'+ randomBootCss()+'">'+tag[i]+'</div>';
      }
    }
    var reminder = "";
    if (item.reminder !== undefined && item.reminder != '' && item.reminder !=  null  ) {
      reminder = item.reminder;
    }
    else
    {
      reminder = '____/__/__';
    }
    
    return  ` <div class="card widget-content">
                                    <div class="widget-content-outer">
                                        <div class="widget-content-wrapper mb-1">
                                            <div class="widget-content-left">
                                                <div class="widget-heading">`+item.title+`</div>
                                                <div class="widget-subheading">`+ bname +`</div>
                                            </div>
                                        </div>
                                        <div class="widget-progress-wrapper sub_profile">
                                            <div style="border: 1px solid rgba(0,0,0,.125); "> 
                                            </div>
                                           `+strtag+`
                                            <div class="progress-sub-label">
                                                <div class="sub-label-left font-icon-lg" ><i data-toggle="tooltip" data-title="Date Created" class="fa fa-clock-o icon-gradient bg-premium-dark" ></i> `+stringshort(item.created_on,10,'')+`
                                                  <div class="sub-label-left font-icon-lg" ><i  data-toggle="tooltip" data-title="Reminder Date" class="fa fa-calendar icon-gradient bg-love-kiss"></i> `+stringshort(reminder,10,'')+`</div>
                                                </div>

                                                <div class="sub-label-right">
                                                   <div class="avatar-icon-wrapper avatar-icon-xs">
                                                    <div  data-toggle="tooltip" data-title="`+item.username+`" class="avatar-icon"> <img alt="`+item.username+`" src="
                                                    `+site_url+item.profile_url +`" />
                                                    </div>
                                                    </div>
                                                </div>

                                        </div>
                                    </div> 
                                </div>`;
    