
<section id="decimal">
    <div class="row">
        <div class="col-12">
            <div class="card">
                  <div class="card-content">
			<div class="card-header">
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
                  
                         <a href="javascript:void(0);" class="btn btn-secondary btn-sm" id="add_user"><i data-toggle="tooltip" title="" class="fa fa-plus-square icon-gradient bg-sunny-morning" style="padding-left: 5px;" data-original-title="Add User"> </i> Add User</a>
                            </div>
                         </div>
                </div>
			
			
			
                <div class="card-content collapse show">
                        <div class="card-body card-dashboard">
                          <table id="common_dataTable" class="table table-hover table-striped  sourced-data dataTable" style="text-transform:none"> </table>
                          </div>
                        </div>
                    </div>
                </div>
				</div>
            </div>
       
</section>

 <!-- User Modal -->
<div class="modal fade text-left" id="userModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel34" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="myModalLabel34">Add New User</h3>
                    <button type="button" class="close" data-dismiss="modal" data-bs-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form id="new_user_form" method="post">
                    <div class="modal-body">
                        <label>Role </label>
                        <div class="form-group position-relative has-icon-left">
                            <select id="role" type="text" name="role" class="form-control form-control-sm" title="Role">
                                <option value="">Select Role</option>
                                 <?php foreach ($roles as $key => $role) {
                                    echo '<option value="'.$role->role_id.'">'.$role->role_name.'</option>';
                                   }
                                 ?>
                            </select>
                            <div class="form-control-position">
                                <i class="la la-envelope font-medium-5 line-height-1 text-muted icon-align"></i>
                            </div>
                        </div>

                        <label>Designation </label>
                        <div class="form-group position-relative has-icon-left">
                            <select id="designation" type="text" name="designation" class="form-control form-control-sm" title="Role">
                               
                                 <?php foreach ($designation as $key => $role) {
                                    echo '<option value="'.$role->id.'">'.$role->designation. '-'. $role->points.'</option>';
                                   }
                                 ?>
                            </select>
                            <div class="form-control-position">
                                <i class="la la-envelope font-medium-5 line-height-1 text-muted icon-align"></i>
                            </div>
                        </div>

                        <label>Email: </label>
                        <div class="form-group position-relative has-icon-left">
                            <input type="text" placeholder="Email Address" title="Email Address" class="form-control form-control-sm" onchange="checkEmailID();" id="email" name="email">
                            <div class="form-control-position">
                                <i class="la la-envelope font-medium-
                                5 line-height-1 text-muted icon-align"></i>
                            </div>
                        </div>

                        <label>Username: </label>
                        <div class="form-group position-relative has-icon-left">
                            <input type="text" placeholder="Username" title="Username" class="form-control form-control-sm" name="Username" id="Username">
                            <div class="form-control-position">
                                <i class="la la-lock font-large-1 line-height-1 text-muted icon-align"></i>
                            </div>
                        </div>
                        <label>Password: </label>
                        <div class="form-group position-relative has-icon-left">
                            <input type="password" placeholder="Password" title="Password" class="form-control form-control-sm" name="password" id="password">
                            <div class="form-control-position">
                                <i class="la la-lock font-large-1 line-height-1 text-muted icon-align"></i>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="reset" class="btn btn-outline-secondary btn-lg" data-dismiss="modal" data-bs-dismiss="modal" value="close">
                        <button type="button" class="btn btn-outline-primary btn-lg" value="Save" id="save_btn"> Save</button>
                    </div>
                    
                </form>
            </div>
        </div>
    </div>



<div class="modal fade text-left" id="userModel_update" tabindex="-1" role="dialog" aria-labelledby="myModalLabel34" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="myModalLabel34">Update User Details</h3>
                    <button type="button" class="close" data-dismiss="modal" data-bs-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form id="user_update_form">
                    <input type="hidden" name="user_id" id="user_id" value=""> 
                    <div class="modal-body">
                        <label>Role </label>
                        <div class="form-group position-relative has-icon-left">
                            <select id="role_u" name="role_u" class="form-control form-control-sm" title="Role">
                                <option value="none" selected="" disabled="">Select Role</option>
                                 <?php foreach ($roles as $key => $role) {
                                    echo '<option value="'.$role->role_id.'">'.$role->role_name.'</option>';
                                   }
                                 ?>
                            </select>
                            <div class="form-control-position">
                                <i class="la la-envelope font-medium-5 line-height-1 text-muted icon-align"></i>
                            </div>
                        </div>  
                        <label>Designation </label>
                        <div class="form-group position-relative has-icon-left">
                            <select id="designation" type="text" name="designation" class="form-control form-control-sm" title="Role">
                               
                                 <?php foreach ($designation as $key => $role) {
                                     echo '<option value="'.$role->id.'">'.$role->designation. '-'. $role->points.'</option>';
                                   }
                                 ?>
                            </select>
                            <div class="form-control-position">
                                <i class="la la-envelope font-medium-5 line-height-1 text-muted icon-align"></i>
                            </div>
                        </div>
                        <label>Email: </label>
                        <div class="form-group position-relative has-icon-left">
                            <input type="text" placeholder="Email Address" title="Email Address" class="form-control form-control-sm" onchange="checkEmailID1();" id="email_u" name="email_u">
                            <div class="form-control-position">
                                <i class="la la-envelope font-medium-5 line-height-1 text-muted icon-align"></i>
                            </div>
                        </div>

                        <label>Username: </label>
                        <div class="form-group position-relative has-icon-left">
                            <input type="text" placeholder="Username" title="Username" class="form-control form-control-sm" name="Username_u" id="Username_u">
                            <div class="form-control-position">
                                <i class="la la-lock font-large-1 line-height-1 text-muted icon-align"></i>
                            </div>
                        </div>
                        <label>Password: </label>
                        <div class="form-group position-relative has-icon-left">
                            <input type="password" placeholder="Password" title="Password" class="form-control form-control-sm" name="password_u" id="password_u">
                            <div class="form-control-position">
                                <i class="la la-lock font-large-1 line-height-1 text-muted icon-align"></i>
                            </div>
                        </div>

                        <label>Active: </label>
                        <div class="form-group position-relative has-icon-left">
                            Yes
                            <input type="radio" placeholder="select status" value="1" title="select status" name="active_r" id="active_yes">
                            No <input type="radio" placeholder="select status" value="0" title="select status"  name="active_r" id="active_no">
                           
                        </div>
                        <label>Banned: </label>
                        <div class="form-group position-relative has-icon-left">
                           Yes <input type="radio" placeholder="select status" value="1" title="select status" name="banned_r" id="banned_yes" >
                           No  <input type="radio" placeholder="select status" value="0" title="select status"  name="banned_r" id="banned_no" >
                           
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="reset" class="btn btn-outline-secondary btn-lg" data-dismiss="modal" data-bs-dismiss="modal" value="close">
                        <input type="submit" class="btn btn-outline-primary btn-lg" value="Update" id="update_btn">
                    </div>
                    
                </form>
            </div>
        </div>
    </div>



<!-- User Modal -->
<div class="modal fade text-left" id="extension_model" tabindex="-1" role="dialog" aria-labelledby="myModalLabel34" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="myModalLabel34">Add User Extension</h3>
                    <button type="button" class="close" data-dismiss="modal" data-bs-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form id="add_suer_extension">
                    <input type="hidden" name="extension_id" id="extension_id" value="">
                    <div class="modal-body">
                        
                        <div class="form-row">
                           <div class="col-md-2">
                              <label>Provider: </label>
                        <div class="form-group position-relative has-icon-left">
                            <select id="provider" type="text" name="provider" class="form-control form-control-sm" title="provider">
                                 <?php foreach ($SipProvider as $key => $role) {
                                    echo '<option value="'.$role->id.'">'.$role->name.'</option>';
                                   }
                                 ?>
                            </select>
                        </div>
                           </div>
                           <div class="col-md-4">

                           <label>Name: </label>
                        <div class="form-group position-relative has-icon-left">
                            <input type="text"  title="Enter Full Name" class="form-control form-control-sm" name="name" id="name">
                        </div>
                          </div>
                           <div class="col-md-4">
                              <label>Server Address: </label>
                        <div class="form-group position-relative has-icon-left">
                            <input type="text"  title="Enter Server Address" class="form-control form-control-sm"  id="ip_address" name="ip_address">
                        </div>
                           </div>

                           <div class="col-md-2">
                               <label>Web Socket Port: </label>
                        <div class="form-group position-relative has-icon-left">
                            <input type="text"  title="Enter Web Socket Port" class="form-control form-control-sm" id="port" name="port">
                        </div>
                           </div>

                        
                           <div class="col-md-3">

                             <label>Web Socket Path: </label>
                        <div class="form-group position-relative has-icon-left">
                            <input type="text"  title="Web Socket Path" class="form-control form-control-sm" name="path" id="path">
                        </div>

                           </div>

                           <div class="col-md-3">

                             <label>Subscribe Extension (Internal): </label>
                        <div class="form-group position-relative has-icon-left">
                            <input type="text"  title="Enter Subscribe Extension" class="form-control form-control-sm" name="extension" id="extension">
                        </div>

                           </div>
                           <div class="col-md-3">
                             
                              <label>Password: </label>
                        <div class="form-group position-relative has-icon-left">
                            <input type="password"  title="Enter Password" class="form-control form-control-sm" name="password" id="passwordd">
                        </div>

                          </div>
                          <div class="col-md-3">
                            <label> </label>
                            <div class="form-group position-relative has-icon-left">
                                 <input type="submit" class="btn btn-outline-primary btn-lg" value="Save" id="add_user_Extension_details">                            </div>
                               
                          </div>
                    </div>  
                       
                       
                    </div>
                    
                </form>

                <div class="card-content collapse show">
                   <div class="card-body card-dashboard">
                        <table id="extension_dataTable" class="table table-hover table-striped  sourced-data dataTable"> </table>
                  </div>
                </div>
            </div>
        </div>
    </div>
