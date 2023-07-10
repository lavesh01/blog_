<!-- Form wizard with icon tabs section start -->

<section id="decimal">
    <div class="row">
        <div class="col-6 mx-auto">
            <div class="card">
                  <div class="card-content">
                     <div class="card-header">
                        <div class="content-header col-md-6 col-12 mb-2">
                            Change User Password
                         </div>
                     </div>

             <section id="icon-tabs">
                    <div class="row">
                        
                          
                        <div class="col-lg-8 col-md-12 col-sm-12 mx-auto">

                                <div class="card-body app-login-box w-100">
                                    <form id="user_profile_update_Details" method="post">
                                      
                                       <div class="form-row">
                                            <div class="col-md-12">
                                                <div class="position-relative form-group">
                                                <label for="exampleEmail11" class="">New Password</label>
                                                <input name="new_password" id="new_password" placeholder="Enter New Password"  title="Enter New Password" type="password" class="form-control form-control-sm">
                            
                                              </div>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                          <div class="col-md-12">
                                                <div class="position-relative form-group">
                                                <label for="exampleEmail11" class="">Confirm Password</label>
                                                <input name="confirm_password" id="confirm_password" onchange="matchPassword();" placeholder="Enter Confirm Password" title="Enter Confirm Password" type="password" class="form-control form-control-sm">
                                              </div>
                                            </div>
                                        </div>
                                  
                                       <input type="submit" class="btn btn-outline-primary btn-lg" value="Change Password" id="update_user_password">
                                       <button type="button" onclick="reset();" class="btn btn-outline-success btn-lg" >Reset
                                       </button>  
                                    </form>
                               
                            </div>
                           
                        </div>
                       
                        
                    </div>
                            
                </section>
                <!-- Form wizard with icon tabs section end -->

    
                    </div>
                </div>
                </div>
            </div>
       
</section>



              