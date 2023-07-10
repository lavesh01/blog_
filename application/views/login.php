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
   
    <!-- Disable tap highlight on IE -->
    <meta name="msapplication-tap-highlight" content="no">

<link href="<?=base_url()?>resources/themes/zanex/assets/css/base.css" rel="stylesheet">
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
            <div class="h-100 bg-plum-plate bg-animation">
                <div class="d-flex h-100 justify-content-center align-items-center">
                    <div class="mx-auto app-login-box col-md-8">
                        <div class="app-logo-inverse mx-auto mb-3"></div>
                        <div class="modal-dialog w-100 mx-auto">
                            <div class="modal-content">
                                <div class="modal-body">
                                    <div class="h5 modal-title text-center">
                                        <h4 class="mt-2">
                                            <div>Welcome back,</div>
                                            <span>Please sign in to your account below.</span>
                                        </h4>
                                    </div>
                                    <form class="" id="form_login">
                                        <div class="form-row">
                                            <div class="col-md-12">
                                                <div class="position-relative form-group"><input type="text" class="form-control" id="username" name="username" placeholder="Email Address" required></div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="position-relative form-group"><input type="password" class="form-control" id="password" name="password" placeholder="Enter Password" required></div>
                                            </div>
                                        </div>
                                        <div class="position-relative form-check"><input name="check" id="exampleCheck" type="checkbox" class="form-check-input"><label for="exampleCheck" class="form-check-label">Keep me logged in</label></div>
                                         <input type="hidden" name="redirecturl" value="<?=$redirecturl?>" >
                                    </form>
                                </div>
                                <div class="modal-footer clearfix">
                                    <div class="float-right">
                                        <button type="submit" class="btn btn-info btn-block" id="login"><i class="ft-unlock"></i> Login</button>
                                    </div>
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
    <script src="<?=base_url()?>resources/themes/zanex/assets/assets/js/scripts-init/jquery-3.3.1.min.js" ></script>
    <script src="<?=base_url()?>resources/themes/zanex/assets/assets/js/scripts-init/bootstrap.bundle.min.js" ></script>
    <script src="<?=base_url()?>resources/themes/zanex/assets/assets/js/core.js"></script>
    <script src="<?=base_url()?>resources/themes/zanex/assets/assets/js/vendors/blockui.js"></script>
    <script src="<?=base_url()?>resources/themes/zanex/assets/assets/js/scripts-init/blockui.js"></script>
    <!--Toastr-->
<script src="<?=base_url()?>resources/themes/zanex/assets/assets/js/vendors/extensions/toastr.min.js"></script> 

    <script src="<?=base_url()?>resources/themes/zanex/assets/custom.js"></script>
    <script src="<?=base_url()?>resources/themes/zanex/assets/assets/js/vendors/extensions/sweetalert2.all.min.js"></script>

  <!-- END: Page JS-->

      <script type="text/javascript">
        var site_url = '<?=site_url()?>';
        $("#login").click(function(argument) {
           
            $('#login').hide();
            $('#loadingbtn').show();

            var send_data = $("#form_login").serialize();
            
            
                var adata = ajax_call_no_alert('auth/login',send_data);
                if(adata.type=="success")
                { 
                    if(adata.redirect_url !== undefined && adata.redirect_url != '' && adata.redirect_url != null)
                    {
                        window.location.href = adata.redirect_url;
                    }
                    else
                    {
                        window.location.href = "<?=site_url()?>Welcome/index";

                    }
                    
                }
               else
                {
                    $('#login').show();
                     $('#loadingbtn').hide();
                    swal("Invalid Login Details", "Login Failed");
                }

        return false;
        });
    </script>
</html>
