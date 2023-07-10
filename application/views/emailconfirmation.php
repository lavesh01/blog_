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
                                            <div><?php echo $message?></div>
                                            </h4>
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

</html>
