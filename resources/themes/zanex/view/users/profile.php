<!-- Form wizard with icon tabs section start -->

<section id="decimal">
    <div class="row">
        <div class="col-8 m-auto">
            <div class="card">
                  <div class="card-content">
			<div class="card-header">
            <div class="content-header col-md-6 col-12">
           Update User Profile Details
      </div>
    </div>

<?php  foreach ($profiledata as $row){ 

  $role_id=$this->session->role_id;
    ?>

                            
                <section id="icon-tabs">
                    <div class="row">
                    
                        <div class="col-lg-9 col-md-12 col-sm-12">

                                <div class="card-body">
                                    <form id="user_profile_update_Details" method="post" enctype="multipart/form-data" accept-charset="multipart/form-data">
									 

                                    
									   <div class="form-row">
                                            <div class="col-md-6">
                                                <div class="position-relative form-group">
												<label for="exampleEmail11" class="">
                                                    Username : <?php echo $this->session->username; ?></label>
												
                         	
											</div>
                                            </div>
                           
                                        <div class="col-md-6">
                                                <div class="position-relative form-group">
                                                <label for="exampleEmail11" class="">Language</label>
                                                <input name="language" id="language" value="<?php echo $row->language; ?>" placeholder="Enter Language" title="Enter Language" type="text" class="form-control form-control-sm"></div>
                                            </div>
                                        </div>

                                        <div class="form-row">
                                            <div class="col-md-12">
                                                <div class="position-relative form-group">
												<label for="exampleEmail11" class="">Display Name</label>
												<input name="display_name" id="display_name" value="<?php echo $row->display_name; ?>" placeholder="Enter Display Name" title="Enter Display Name" type="text" class="form-control form-control-sm"></div>
                                            </div>
                                        
                                            
                                        </div>
										
										<div class="form-row">
                                  <?php  if($role_id=='1'){ ?>          
                                            <div class="col-md-6">
                                                <div class="position-relative form-group">
												<label for="designation" class="">Designation</label>
												<select name="designation" id="designation" value="<?php echo $row->designation; ?>" placeholder="Enter Designation" title="Enter Designation" type="text" class="form-control form-control-sm">
                                                 <option value="">Select Designation</option>
                                           <?php  foreach ($designation as $rowds){ ?>
                                           
                                              <option value="<?php echo $rowds->designation ?>"><?php echo $rowds->designation ?></option>


                                           <?php } ?>            
                                                </select>    
                                             </div>
                                            </div>
                                    <?php } ?>        
											
											 <div class="col-md-12">
                                                <div class="position-relative form-group file-upload-wrapper" data-text="Select your file!">
												<label for="file" class="">Upload Profile Image</label>
												<input name="file" id="file_suppression"  placeholder="Upload Profile Image" title="Upload Profile Image" type="file" class="form-control form-control-sm "></div>
                                            </div>
											
                                        </div>
										
										<div class="form-row">
                                            <div class="col-md-12">
                                                <div class="position-relative form-group">
												<label for="description" class="">Description</label>
												<input name="description"  id="description"  placeholder="Enter Description" title="Enter Description" type="text" class="form-control form-control-sm" value="<?php echo $row->description; ?>"></div>
                                            </div>
                                        </div>
   

                                        
                                       <input type="submit" class="btn btn-outline-primary btn-lg" value="Update Profile Details" id="update_userprofile_details">
                                         
                                    </form>
                               
                            </div>
                           
                        </div>
						<div class="col-lg-3 col-md-12 col-sm-12" id="divid">
						  <img width="100%" src="<?php echo site_url() . $row->profile_url; ?>" alt="<?php echo $this->session->username; ?>"> 
						
						</div>
                        
                    </div>
                            
                </section>
                <!-- Form wizard with icon tabs section end -->
              
	
                    </div>
                </div>
				</div>
            </div>
       
</section>

<?php  } ?>

              