 <?php 
    $controller =  strtolower($this->router->fetch_class());
    $method  =strtolower($this->router->fetch_method());
?>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="en">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title><?php
        //$sidebar_panel ="sidebar";
        if (isset($title) && !(empty($title))) {
           echo $title;
        }
        ?>
    </title>

    <link rel="icon" type="image/x-icon" href="<?=base_url()?>resources/themes/zanex/assets/images/favicon.png">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no" />

    <!-- Disable tap highlight on IE -->
    <meta name="msapplication-tap-highlight" content="no">

    <link rel="stylesheet" href="<?=base_url()?>resources/themes/zanex/assets/plugins/bootstrap/css/bootstrap.min.css">
    <!-- STYLE CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="<?=base_url()?>resources/themes/zanex/assets/css/style.css" rel="stylesheet"/>
    <link href="<?=base_url()?>resources/themes/zanex/assets/css/plugins.css" rel="stylesheet"/>

    <!--- FONT-ICONS CSS -->
    <link href="<?=base_url()?>resources/themes/zanex/assets/css/icons.css" rel="stylesheet"/>
    
    <link rel="stylesheet" type="text/css" href="<?=base_url()?>resources/themes/zanex/assets//jAlert/dist/jAlert.css">
     <link rel='stylesheet' href='<?=base_url()?>resources/themes/zanex/assets/css/vendors/taggingJS/tag-basic-style.css'/>
<!-- <link rel='stylesheet' href='<?=base_url()?>resources/themes/zanex/assets/select2-develop/dist/css/select2.css'/> -->
 <link rel='stylesheet' href='<?=base_url()?>resources/themes/zanex/assets/x-editable/bootstrap5-editable/css/bootstrap-editable.css'/>
 <link rel='stylesheet' href='<?=base_url()?>resources/themes/zanex/assets/x-editable/inputs/datetime/bootstrap-datetimepicker/css/datetimepicker.css'/>
 <!--
 <link rel='stylesheet' href='<?=base_url()?>resources/themes/zanex/assets/x-editable/inputs/select2/lib/select2-bootstrap.css'/>

 <link rel='stylesheet' href='<?=base_url()?>resources/themes/zanex/css/plugins/file-uploaders/dropzone.css'/>
 <link rel='stylesheet' href='<?=base_url()?>resources/themes/zanex/css/plugins/forms/wizard.css'/>
 <link rel='stylesheet' href='<?=base_url()?>resources/themes/zanex/css/plugins/pickers/daterange/daterange.css'/>
 <link rel='stylesheet' href='<?=base_url()?>resources/themes/zanex/assets/vendors/css/editors/summernote.css'/>
 <link rel='stylesheet' href='<?=base_url()?>resources/themes/zanex/assets/vendors/css/file-uploaders/dropzone.min.css'/>-->
  <!--<link rel='stylesheet' href='<?=base_url()?>resources/themes/zanex/assets/vendors/css/forms/selects/select2.min.css'/>-->
 <link rel='stylesheet' href='<?=base_url()?>resources/themes/zanex/assets/vendors/css/pickers/daterange/daterangepicker.css'/>
  <!--<link rel='stylesheet' href='<?=base_url()?>resources/themes/zanex/assets/vendors/css/soumoselect/stylesheets/sumoselect.min.css'/>-->
    <!-- END: Page CSS-->
    <?php /*
        if (isset($css))
        {
            if (is_array($css)) {
                if (($key = array_search(site_url()."resources/themes/default/assets/x-editable/poshytip/tip-yellowsimple/tip-yellowsimple.css", $css)) !== false) {
                    unset($css[$key]);
                }
                foreach ($css as $key => $j) {
                   
                    if ($j == site_url()."resources/themes/default/assets/x-editable/bootstrap4-editable/css/bootstrap-editable.css") {
                      $j =  site_url()."resources/themes/default/assets/x-editable/bootstrap5-editable/css/bootstrap-editable.css";
                    }
                      $j = str_replace("resources/themes/zanex","resources/themes/zanex",$j);  
                      $j = str_replace("resources/themes/zanex/assets/vendors","resources/themes/zanex/assets/vendors",$j);
                      $j = str_replace("resources/custom/","resources/themes/zanex/assets/custom/",$j);
                      echo  '<link rel="stylesheet" type="text/css" href="'.$j.'"></script>'; 
                }
            }
            else
            {

                include 'resources/custom/css/'.$css.'.css.php';
            }

        }
        $page_level_css_file_path = 'resources/themes/'.$theme_selected_template.'/assets/custom/css/'.$controller.'/'.$method.'.css';
        if (file_exists(FCPATH.$page_level_css_file_path ) )
        {
              echo  '<link rel="stylesheet" type="text/css" href="'.site_url().$page_level_css_file_path .'"></script>'; 
        }
        */
    ?>
    
    <link href="<?=base_url()?>resources/themes/zanex/assets/css/custom.css" rel="stylesheet"/>

    <!-- END: Custom CSS-->
    <script type="text/javascript">var site_url = '<?php echo site_url();?>';</script>

<style type="text/css">
  

.error {
  color: red;
  margin-left: 5px;
}

label.error {
  display: inline;
}
</style>


</head>
<body class="app sidebar-mini ltr light-mode sidenav-toggled icon-overlay">
    <?php $themesettings = (array)json_decode($this->session->userdata("json"));  ?>
        <!-- GLOBAL-LOADER -->
    <div id="global-loader">
        <img src="<?=base_url()?>resources/themes/zanex/assets/images/loader.svg" class="loader-img" alt="Loader">
    </div>
    <!-- /GLOBAL-LOADER -->



<!-- Modal -->
        <div class="modal fade ui-theme-settings"  id="extralargemodal" tabindex="-1" role="dialog" >
            <div class="modal-dialog modal-xl" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                       <div class="theme-settings__inner">
                            <div class="scrollbar-container">
                                <div class="theme-settings__options-wrapper">
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

<!-- PAGE -->
        <div class="page">
            <div class="page-main">

                <!--app-content open-->
                <div class="main-content app-content mt-0">
                    <div class="side-app">

                        <!-- CONTAINER -->
                        <div class="main-container container-fluid">

                            <!-- PAGE-HEADER -->
                            <div class="page-header">
                               
                            </div>
                           
                            <div id="main-content-page-topheader" data-id=""></div>
                            <!-- ROW-1 OPEN -->
                            <div class="row" >
                                <div class="col-md-12" id="main-content-page-leftsubmenu"></div>
                                <div class="col-md-12" id="main-content-page">