<input type="hidden" name="campaign_id" id="campaign_id" >


<div class="row">
   
    <div class="col-md-12 col-lg-12">
        
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-content collapse show">
                    <div class="card-header-tab">
                                <div class="card-header">
                                    <i class="header-icon pe-7s-menu icon-gradient bg-ripe-malin"> </i>
                                    Role 
                                    <div class="btn-actions-pane-right text-capitalize">
                                 
                                      <a href="javascript:void(0);" class="btn btn-secondary btn-sm" id="add_role"><i data-toggle="tooltip" title="" class="fa fa-plus-square icon-gradient bg-sunny-morning" style="padding-left: 5px;" data-original-title="Add Role"> </i> Add Role</a>
                                    </div>
                                </div>
                                
                            </div>
                     <div class="card-body  p-2">
                        <div class="table-responsive">
                            <div id="div_common_dataTable" >
                              <table id="edm_dataTable" class="table table-hover table-striped  sourced-data dataTable">
                              </table>
                              </div></div></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    </div>
</div>


 <!-- User Modal -->
<div class="modal fade text-left" id="userModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel34" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="myModalLabel34">Add New Role</h3>
                    <button type="button" class="close" data-dismiss="modal" data-bs-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form id="new_user_form">
                    <input type="hidden" name="role_id" id="role_id" >
                    <input type="hidden" name="action" id="action" >

                    <div class="modal-body">
                        <label>Role Name </label>
                        <div class="form-group position-relative has-icon-left">
                            <input type="text" placeholder="Role Name" class="form-control" name="role_name" id="role_name">
                            <div class="form-control-position">
                                <i class="la la-envelope font-medium-5 line-height-1 text-muted icon-align"></i>
                            </div>
                        </div>

                        <label>Description </label>
                        <div class="form-group position-relative has-icon-left">
                            <input type="text" placeholder="Description" class="form-control" id="Description" name="Description">
                            <div class="form-control-position">
                                <i class="la la-envelope font-medium-5 line-height-1 text-muted icon-align"></i>
                            </div>
                        </div>

                        <label>Redirect URL </label>
                        <div class="form-group position-relative has-icon-left">
                            <input type="text" placeholder="Redirect URL" class="form-control" name="redirecturl" id="redirecturl">
                            <div class="form-control-position">
                                <i class="la la-lock font-large-1 line-height-1 text-muted icon-align"></i>
                            </div>
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

