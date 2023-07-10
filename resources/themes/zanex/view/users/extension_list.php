
<section id="decimal">
    <div class="row">
        <div class="col-12">
            <div class="card">
                  <div class="card-content">
			<div class="card-header-tab">
            <div class="content-header-left col-md-6 col-12 mb-2">
    <?php if (isset($heading_icon)) { ?>
                                <div class="page-title-icon">
                                   <i class="<?=$heading_icon?>"></i>
                               </div>
                              <?php } ?>
							  <?=$title?>
</div>
<div class="content-header-right col-md-6 col-12">
    <div class="btn-group float-md-right" role="group" aria-label="Button group with nested dropdown">
      
          
                </div>
             </div>
    </div>
			
			
			
    <div class="card-content collapse show">
        <div class="card-body card-dashboard">

           <div class="row">
             <?php foreach ($extensions as $key => $extensions) { ?>
                        <div class="col-md-6 col-lg-3 text-center">
                            <div class="card-shadow-danger mb-3 widget-chart widget-chart2 text-left card widget-chart widget-chart-hover">
                                <div class=" widget-content p-0 w-100">
                                    <div class="widget-content-outer">
                                        <div class="widget-content-wrapper">
                                            <div class="widget-content-left pr-2 fsize-1">
                                                <div class="widget-numbers mt-0 fsize-3 text-danger"><?php  echo $extensions->extension;?></div>
                                            </div>
                                        </div>
                                        <div class="widget-content-left fsize-1">
                                            <div class="text-muted opacity-6"><?php  echo $extensions->name;?></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
              <?php } ?>          
       
                    </div>
                               
        </div>
    </div>

                    </div>
                </div>
				</div>
            </div>
       
</section>

