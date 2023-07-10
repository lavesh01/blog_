<!-- Form wizard with icon tabs section start -->

<section id="decimal">
    <div class="row">
        <div class="col-12">
            <div class="card">
                  <div class="card-content">
			<div class="card-header-tab">
            <div class="content-header-left col-md-6 col-12 mb-2">
           Update User Profile Details
      </div>
    </div>

 <?php foreach ($profiledata as $key => $profiledata) {
                                  
                                  $profile=$profiledata->profile_url;
                                  $display_name=$profiledata->display_name;
                                  $description=$profiledata->description;

                         } ?>

                            
                <section id="icon-tabs">
                    <div class="row">
                    
                        <div class="col-lg-9 col-md-12 col-sm-12">

                                <div class="card-body">
                                    <form id="user_profile_update_Detailss" method="post" enctype="multipart/form-data" accept-charset="multipart/form-data">
									 

                                    
								

                                        <div class="form-row">
                                            <div class="col-md-6">
                                                <div class="position-relative form-group">
												<label for="exampleEmail11" class="">Display Name</label>
												<input name="display_name" id="display_name" value="<?php echo $display_name; ?>" placeholder="Enter Display Name" title="Enter Display Name" type="text" class="form-control form-control-sm"></div>
                                            </div>
                                        
                                     
                                        
											 <div class="col-md-6">
                                                <div class="position-relative form-group">
												<label for="file" class="">Upload Profile Image</label>
												<input name="file" id="file_suppression"  placeholder="Upload Profile Image" title="Upload Profile Image" type="file" class="form-control form-control-sm file-upload-wrapper "></div>
                                            </div>
											
                                        </div>
										
										<div class="form-row">
                                            <div class="col-md-12">
                                                <div class="position-relative form-group">
												<label for="description" class="">Description</label>
												<input name="description"  id="description"  placeholder="Enter Description" title="Enter Description" type="text" class="form-control form-control-sm" value="<?php echo $description; ?>"></div>
                                            </div>
                                        </div>
   

                                       <br> 
                                       <input type="submit" class="btn btn-outline-primary btn-lg" value="Update Profile Details" id="update_userprofile_detailssss">
                                         
                                    </form>
                               
                            </div>
                           
                        </div>
                       
						<div class="col-lg-3 col-md-12 col-sm-12" id="divid">
            
                      <img width="100%;height:80px;" src="<?php echo $profile; ?>" alt="<?php echo $profile; ?>"> 
                        
                    
						 
						</div>
                        
                    </div>
                            
                </section>
                <!-- Form wizard with icon tabs section end -->

	
                    </div>
                </div>
				</div>
            </div>
       
</section>


              