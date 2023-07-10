<!-- Form wizard with icon tabs section start -->

<section id="decimal">
    <div class="row">
        <div class="col-12">
            <div class="card">
             <div class="card-content">
            	<div class="card-header-tab">
                  <div class="content-header-left col-md-6 col-12 mb-2">
                       Update User Details
                  </div>
                        <div class="content-header-right col-md-6 col-12">
                            <div class="btn-group float-md-right" role="group" aria-label="Button group with nested dropdown">
                          
                              <a href="<?php echo site_url('users'); ?>" type="button" aria-haspopup="true" aria-expanded="false" class="btn-shadow dropdown-toggle btn btn-info">    Users List </a>
                            </div>
                         </div>
                </div>

	            <input type="hidden" id="user_id" name="user_id" value="<?=$user_id ?>">
                <section id="icon-tabs">
                    <div class="row">
                    
                        <div class="col-lg-9 col-md-12 col-sm-12">

                                <div class="card-body">
                                    <form id="edit_users_detailss" method="post">
									   <input type="hidden" id="user_id" name="user_id" value="<?=$user_id ?>">
									   <div class="form-row">
                                            <div class="col-md-12">
                                                <div class="position-relative form-group">
												<label for="exampleEmail11" class="">Role Name</label>
												<select name="role_id" id="role_id" placeholder="Enter Role Name" title="Enter Role Name" type="text" class="form-control form-control-sm">
                                                  <option value="<?php echo $users_data["role_id"]  ?>"><?php echo $users_data["role_name"]; ?></option>                                    
												</select>	
											</div>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="col-md-12">
                                                <div class="position-relative form-group">
												<label for="exampleEmail11" class="">Email ID</label>
												<input name="email" id="email" onchange="checkEmailID();" value="<?php echo $users_data["email"]; ?>" placeholder="Enter Email ID" title="Enter Email ID" type="text" class="form-control form-control-sm"></div>
                                            </div>
                                        </div>

                                        <div class="form-row">
                                            <div class="col-md-12">
                                                <div class="position-relative form-group">
												<label for="exampleEmail11" class="">User Name</label>
												<input name="username" id="username" value="<?php echo $users_data["username"]; ?>" placeholder="Enter Username" title="Enter Username" type="text" class="form-control form-control-sm"></div>
                                            </div>
                                        </div>

                                        <div class="form-row">
                                            <div class="col-md-12">
                                                <div class="position-relative form-group">
												<label for="exampleEmail11" class="">Password</label>
												<input name="password_hash" id="password_hash" value="<?php echo $users_data["password_hash"]; ?>" placeholder="Enter Password" title="Enter Password" type="password" class="form-control form-control-sm"></div>
                                            </div>
                                        </div>
                                       
                                        
                                       <input type="submit" class="btn btn-outline-primary btn-lg" value="Update Details" id="update_users_details">
                                         <a href="<?php echo site_url('users'); ?>" type="button" class="btn btn-outline-success btn-lg">Cancel </a>
                                    </form>
                               
                            </div>
                           
                        </div>
                        
                    </div>
                            
                </section>
            </div>
        </div>
		</div>
   </div>
</section>



              