<!doctype html>
<html lang="en">


<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="en">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Recover Password</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no"
    />
    <meta name="description" content="ArchitectUI HTML Bootstrap 4 Dashboard Template">

    <!-- Disable tap highlight on IE -->
    <meta name="msapplication-tap-highlight" content="no">

<link href="<?=base_url()?>resources/themes/default/core.css" rel="stylesheet">
 
</head>
<style type="text/css">
  form div {
  margin-bottom: 10px;
}

.error {
  color: red;
  margin-left: 5px;
}

label.error {
  display: inline;
}
</style>
<body>
<div class="app-container app-theme-white body-tabs-shadow">
        <div class="app-container">
            <div class="h-100">
                <div class="h-100 no-gutters row">
                    <div class="d-none d-lg-block col-lg-4">
                       <div class="slider-light">
                                               <div class="slick-slider">
                                <div>
                                    <div class="position-relative h-100 d-flex justify-content-center align-items-center bg-plum-plate" tabindex="-1">
                                        <div class="slide-img-bg" style="background-image: url(<?php echo base_url('resources/themes/default/assets/images/originals/city.jpg') ?>);"></div>
                                        <div class="slider-content"><h3>Perfect Balance</h3>
                                            <p>ArchitectUI is like a dream. Some think it's too good to be true! Extensive collection of unified React Boostrap Components and Elements.</p></div>
                                    </div>
                                </div>
                                <div>
                                    <div class="position-relative h-100 d-flex justify-content-center align-items-center bg-premium-dark" tabindex="-1">
                                        <div class="slide-img-bg" style="background-image: url(<?php echo base_url('resources/themes/default/assets/images/originals/citynights.jpg') ?>);"></div>
                                        <div class="slider-content"><h3>Scalable, Modular, Consistent</h3>
                                            <p>Easily exclude the components you don't require. Lightweight, consistent Bootstrap based styles across all elements and components</p></div>
                                    </div>
                                </div>
                                <div>
                                    <div class="position-relative h-100 d-flex justify-content-center align-items-center bg-sunny-morning" tabindex="-1">
                                        <div class="slide-img-bg" style="background-image: url(<?php echo base_url('resources/themes/default/assets/images/originals/citydark.jpg') ?> );"></div>
                                        <div class="slider-content"><h3>Complex, but lightweight</h3>
                                            <p>We've included a lot of components that cover almost all use cases for any type of application.</p></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="h-100 d-flex bg-white justify-content-center align-items-center col-md-12 col-lg-8">
                        <div class="mx-auto app-login-box col-sm-12 col-md-8 col-lg-6">
                            <div class="app-logo"></div>
                            <h4>
                                <div>Forgot your Password?</div>
                                <span>Use the form below to recover it.</span></h4>
                            <div>
                                <form method="post">
                                    <div class="form-row">
                                        <div class="col-md-12">
                                            <div class="position-relative form-group"><label for="email" class="">Email</label><input name="email" id="email" placeholder="Email here..." type="email" class="form-control"></div>
                                        </div>
                                    </div>
                                    <div class="mt-4 d-flex align-items-center"><h6 class="mb-0"><a href="<?php echo site_url('auth/recover'); ?>" class="text-primary">Sign in existing account</a></h6>
                                        <div class="ml-auto">
                                            <button type="button" id="recover_button" class="btn btn-info btn-block" onclick="checkEmail();"> Recover Password</button>
                                            <button type="submit" id="loadingbtn" style="display:none;" class="btn btn-info btn-block"> <span class="spinner-border spinner-border-sm"></span>
    Loading..</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</div>

<script type="text/javascript">

function checkEmail()
{
    var site_url = '<?=site_url()?>';
    var email = $('#email').val();
   
    $(".error").remove();

    
    if (email.length < 1) {
      $('#email').after('<span class="error">This field is required</span>');
      return false;
    } else {
      var regEx = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
      var validEmail = regEx.test(email);
      if (!validEmail) {
        $('#email').after('<span class="error">Enter a valid email</span>');
        return false;
      }
    }

    var email=$('#email').val();
   
     $.ajax({
    url:site_url + "Auth_ajax/checkEmail",
    method:"POST",
    data:{email:email},
    beforeSend: function() {

       $('#loadingbtn').show();
       $('#recover_button').hide();

    },
    success:function(data)
    {
       
      if(data=="1")
      {
          $('#loadingbtn').hide();
          $('#recover_button').show();
         swal("Password Link sent", "password link sent on your emial ID, check your email.", "success");
         

      } else{

        $('#loadingbtn').hide();
        $('#recover_button').show();
        swal("Error", "Email ID not registered", "warning");
        $('#email').val('');
        return false;
      }

    }
   });

}

    
</script>


<!-- BEGIN: Vendor JS-->
    <script src="<?=base_url()?>resources/themes/default/assets/js/scripts-init/jquery-3.3.1.min.js" ></script>
    <script src="<?=base_url()?>resources/themes/default/assets/js/scripts-init/bootstrap.bundle.min.js" ></script>
    <script src="<?=base_url()?>resources/themes/default/assets/js/core.js"></script>
    <script src="<?=base_url()?>resources/themes/default/assets/js/vendors/blockui.js"></script>
    <script src="<?=base_url()?>resources/themes/default/assets/js/scripts-init/blockui.js"></script>
    <script src="<?=base_url()?>resources/custom.js"></script>
    <script src="<?=base_url()?>resources/themes/default/assets/js/vendors/extensions/sweetalert2.all.min.js"></script>

    <!-- Form Validation -->
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>

  <!-- END: Page JS-->



</body>
</html>
