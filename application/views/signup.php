<?php 
if ($this->session->userdata("isloggedin") ) {
	redirect(base_url()."campaign", 'auto');
}
?>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="en">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no"
    />
    <meta name="description" content="ArchitectUI HTML Bootstrap 4 Dashboard Template">

    <!-- Disable tap highlight on IE -->
    <meta name="msapplication-tap-highlight" content="no">

<link href="<?=base_url()?>resources/themes/default/core.css" rel="stylesheet">
<style type="text/css">
    .slider-light .slick-prev, .slider-light .slick-next {
    background: transparent;
    color: #fff;
    box-shadow: 0 0 0 0 transparent;
    display: none !important;
}
</style> 
</head>

<body>
<div class="app-container app-theme-white body-tabs-shadow">
        <div class="app-container">
            <div class="h-100 bg-premium-dark">
                <div class="d-flex h-100 justify-content-center align-items-center">
                    <div class="mx-auto app-login-box col-md-8">
                        <div class="app-logo-inverse mx-auto mb-3"></div>
                        <div class="modal-dialog w-100">
                            <div class="modal-content">
                                <div class="modal-body">
                                    <h5 class="modal-title">
                                        </h5><h4 class="mt-2">
                                            <div>Welcome,</div>
                                            <span>It only takes a <span class="text-success">few seconds</span> to create your account</span></h4>
                                    
                                    <div class="divider row"></div>
                                    <form class="" id="form_signup">
                                        <div class="form-row">
                                            <div class="col-md-12">
                                                <div class="position-relative form-group"><input name="CompanyName" id="exampleCompanyName" placeholder="Company Name here..." type="text" class="form-control"></div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="position-relative form-group"><input name="BusinessEmail" id="exampleBusinessEmail" placeholder="Business Email here..." type="email" class="form-control"></div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="position-relative form-group"><input name="adminname" id="exampleName" placeholder="Name here..." type="text" class="form-control"></div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="position-relative form-group"><input name="password" id="examplePassword" placeholder="Password here..." type="password" class="form-control"></div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="position-relative form-group"><input name="passwordrep" id="examplePasswordRep" placeholder="Repeat Password here..." type="password" class="form-control"></div>
                                            </div>
                                        </div>
                                    </form>
                                    <div class="mt-3 position-relative form-check"><input name="check" id="exampleCheck" type="checkbox" class="form-check-input"><label for="exampleCheck" class="form-check-label">Accept our <a href="javascript:void(0);">Terms
                                        and Conditions</a>.</label></div>
                                    <div class="divider row"></div>
                                    <h6 class="mb-0">Already have an account? <a href="<?php echo site_url().'auth/index'?>" class="text-primary">Sign in</a> | <a href="javascript:void(0);" class="text-primary">Recover Password</a></h6></div>
                                <div class="modal-footer d-block text-center">
                                    <button id="signup" class="btn-wide btn-pill btn-shadow btn-hover-shine btn btn-primary btn-lg">Create Account</button>
                                </div>
                            </div>
                        </div>
                      <?php 
                            $this->load->helper('url');
                            $url_parts = parse_url(current_url());
                        ?>
                        <div class="text-center text-white opacity-8 mt-3">Copyright © <?=str_replace('www.', '', $url_parts['host']);?></div>
                    </div>
                </div>
            </div>
        </div>
</div>
    <!-- BEGIN: Vendor JS-->
    <script src="<?=base_url()?>resources/themes/default/assets/js/scripts-init/jquery-3.3.1.min.js" ></script>
    <script src="<?=base_url()?>resources/themes/default/assets/js/scripts-init/bootstrap.bundle.min.js" ></script>
    <script src="<?=base_url()?>resources/themes/default/assets/js/core.js"></script>
    <script src="<?=base_url()?>resources/themes/default/assets/js/vendors/blockui.js"></script>
    <script src="<?=base_url()?>resources/themes/default/assets/js/scripts-init/blockui.js"></script>
    <!--Toastr-->
<script src="<?=base_url()?>resources/themes/default/assets/js/vendors/extensions/toastr.min.js"></script> 

    <script src="<?=base_url()?>resources/custom.js"></script>
    <script src="<?=base_url()?>resources/themes/default/assets/js/vendors/extensions/sweetalert2.all.min.js"></script>

  <!-- END: Page JS-->

      <script type="text/javascript">
        var site_url = '<?=site_url()?>';
        $("#signup").click(function(argument) {
           
            //$('#login').hide();
            //$('#loadingbtn').show();

            var send_data = $("#form_signup").serialize();
            
            
                var adata = ajax_call_no_alert('auth/createnewacount',send_data);
                swal(adata.message, "", adata.type);

        return false;
        });
    </script>
</html>
