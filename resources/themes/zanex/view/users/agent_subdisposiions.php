<div class="app-page-title">
    <div class="page-title-wrapper">
        <div class="page-title-heading">
            <?php if (isset($heading_icon)) { ?>
                <div class="page-title-icon">
                    <i class="<?=$heading_icon?>"></i>
                </div>
            <?php } ?>
            <div><?=$title?>
                <div class="page-title-subheading"><?=$decription?></div>
            </div>
        </div>
        <div class="page-title-actions">
            <div class="d-inline-block dropdown">
                <button type="button" aria-haspopup="true" aria-expanded="false" class="btn-shadow btn btn-info" id="add_user" type="button">
                    Add Agent Sub Disposition
                </button>
            </div>
        </div>
    </div>
</div>

<section id="decimal">
    <div class="row">
        <div class="col-12">
            <div class="card">
              
						
						<div class="card-body  p-2">
           <table id="common_dataTable" class="table table-hover table-striped  sourced-data dataTable"> </table>
       </div>
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
                    <h3 class="modal-title" id="myModalLabel34">Add Agent Sub Disposition</h3>
                    <button type="button" class="close" data-dismiss="modal" data-bs-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form id="new_agentsub_disposition_form">
                    <div class="modal-body">
                        <label>Agent Name </label>
                        <div class="form-group position-relative has-icon-left">
                            <select id="agent_disposition_id" name="agent_disposition_id" class="form-control" placeholder="Enter Agent Sub Disposition Name" title="Enter Agent Name">
                               <option value="">Select Agent Name</option>
						<?php
    foreach($agent as $row)
    {
     echo '<option value="'.$row->id.'">'.$row->name.'</option>';
    }
    ?>
						    </select>
						</div>
						
						
						<label>Agent Sub Disposition Name </label>
                        <div class="form-group position-relative has-icon-left">
                            <input id="name" name="name" class="form-control" placeholder="Enter Agent Name" title="Enter Agent Name">
                        </div>

                       
                       
                    </div>
                    <div class="modal-footer">
                        <input type="reset" class="btn btn-outline-secondary btn-lg" data-dismiss="modal" data-bs-dismiss="modal" value="close">
                        <input type="submit" class="btn btn-outline-primary btn-lg" value="Save" id="save_btn">
                    </div>
                    
                </form>
            </div>
        </div>
    </div>

