<section id="decimal">
    <div class="row">
        <div class="col-12">
            <div class="card">

                  <div class="card-content">
 
 
 <div class="card-header">
            <div class="content-header-left col-md-6 col-12">
    <?php if (isset($heading_icon)) { ?>
                                <div class="page-title-icon">
                                   <i class="<?=$heading_icon?>"></i>
                               </div>
                              <?php } ?>
							  <?=$title?>
</div>
<div class="content-header-right col-md-6 col-12">
    <div class="btn-group float-md-right" role="group" aria-label="Button group with nested dropdown">
      
                <a href="javascript:void(0);" class="btn btn-secondary btn-sm" id="add_user"><i data-toggle="tooltip" title="" class="fa fa-plus-square icon-gradient bg-sunny-morning" style="padding-left: 5px;" data-original-title="Add Disposition"> </i> Add Disposition</a>
                </div>
             </div>
    </div><br>

	   <div class="card-body  p-2">
           <table id="common_dataTable" class="table table-hover table-striped  sourced-data dataTable"> </table>
       </div>
	
</div>
        </div>
		</div>
						
		
                    </div>
        
		
</section>

 <!-- User Modal -->
<div class="modal fade text-left" id="agentModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel34" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="myModalLabel34">Add New Disposition</h3>
                    <button type="button" class="close" data-dismiss="modal" data-bs-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form id="new_agent_form" method="post">
                    <div class="modal-body">
                        <label>Disposition Name </label>
                        <div class="form-group position-relative has-icon-left">
                            <input id="name" name="name" class="form-control form-control-sm" placeholder="Enter Disposition Name" title="Enter Disposition Name">
                     
                        </div>

                       
                       
                    </div>
                    <div class="modal-footer">
                        <input type="reset" class="btn btn-outline-secondary btn-lg" data-dismiss="modal" data-bs-dismiss="modal" value="close">
                        <button type="button" class="btn btn-outline-primary btn-lg" value="Save" id="save_btn"> Save </button>
                    </div>
                    
                </form>
            </div>
        </div>
    </div>



<div class="modal fade text-left" id="agentsubdispositionModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel34" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="myModalLabel34">Sub Dispositions</h3>
                    <button type="button" class="close" data-dismiss="modal" data-bs-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form id="subdispositions_form">
				 
                    <div class="modal-body" method="post">
					     
                         <input type="hidden" id="agent_disposition_id" name="agent_disposition_id">
					
                        <label>Sub Disposition Name </label>
                        <div class="form-group position-relative has-icon-left">
                            <input id="subdisposition_name" name="subdisposition_name" class="form-control form-control-sm" placeholder="Sub Disposition Name" title="Enter Disposition Name">
                            <button id="subdisposition_btn" type="button" aria-haspopup="true" aria-expanded="false" class="btn-shadow  btn btn-info" id="add_user">
                                Add
                            </button>
                        </div>
                    

                       
                        <table id="subdisposition_data" class="table table-hover table-striped  sourced-data dataTable"> </table>
                       
                    </div>
                   
                    
                </form>
            </div>
        </div>
    </div>


    <div class="modal fade text-left" id="update_disposition" tabindex="-1" role="dialog" aria-labelledby="myModalLabel343" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="myModalLabel343">Edit Dispositions</h3>
                    <button type="button" class="close" data-dismiss="modal" data-bs-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form id="update_disposiion" method="post">
                 
                    <div class="modal-body">
                     
                     <input type="hidden" id="disposition_id" name="disposition_id" value="">

                        <label>Disposition Name </label>
                        <div class="form-group position-relative has-icon-left">
                            <input type="text" id="dispositionanames"  name="name" value="" class="form-control form-control-sm" placeholder="Enter Disposition Name" title="Enter Disposition Name">
                          
                        </div>

                    </div>

                    <div class="modal-footer">
                        <input type="reset" class="btn btn-outline-secondary btn-lg" data-dismiss="modal" data-bs-dismiss="modal" value="close">
                        <input type="submit" class="btn btn-outline-primary btn-lg" value="Update" id="update_disposition_details">
                    </div>
                   
                </form>
            </div>
        </div>
    </div>
	
	
	
	
      <div class="modal fade text-left" id="update_subdisposition" tabindex="-1" role="dialog" aria-labelledby="myModalLabel34345" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="myModalLabel34345">Edit Sub Dispositions</h3>
                    <button type="button" class="close" data-dismiss="modal" data-bs-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form id="update_sub_disposiion" method="post">
                 
                    <div class="modal-body">
                     
                     <input type="hidden" id="sub_disposition_id" name="sub_disposition_id" value="">

                        <label>Sub Disposition Name </label>
                        <div class="form-group position-relative has-icon-left">
                            <input id="subdisposition_names" name="subdisposition_names" class="form-control form-control-sm" placeholder="Sub Disposition Name" title="Enter Disposition Name">
                                
                            <div class="form-control-position">
                                <i class="la la-envelope font-medium-5 line-height-1 text-muted icon-align"></i>
                            </div>
                        </div>

                    </div>

                    <div class="modal-footer">
                        <input type="reset" class="btn btn-outline-secondary btn-lg" data-dismiss="modal" data-bs-dismiss="modal" value="close">
                        <input type="submit" class="btn btn-outline-primary btn-lg" value="Update" id="update_sub_disposition_details">
                    </div>
                   
                </form>
            </div>
        </div>
    </div>	