    <?php

function createMenuLizanex($arr, $key, $title, $url, $class="")
{

    if (!empty($arr) && in_array( $key, $arr) && !empty($arr))
    {
      echo '<li><a class="slide-item" href="' . site_url($url). '">'.$title.'</a></li>' ; 
    }                              
}

function createSingleMenuLizanex($arr, $key, $title, $url, $class="")
{
    
    if (!empty($arr) && in_array( $key, $arr) )
    {
        echo '<li><a href="'.site_url($url).'" class="side-menu__item"><i class="side-menu__icon  '.$class.'"></i><span class="side-menu__label">'.$title.'</span></a></li>';
    }                              
}

 ?>

    <!--APP-SIDEBAR-->
    <div class="sticky">
        <div class="app-sidebar__overlay" data-bs-toggle="sidebar"></div>
        <aside class="app-sidebar">
            <?php if (isset($ext_theme_view_path)) {
                            $this->load->ext_view($ext_theme_view_path,'partials/logo');
                         } ?>
            <div class="main-sidemenu">
                <div class="slide-left disabled" id="slide-left"><svg xmlns="http://www.w3.org/2000/svg" fill="#7b8191"
                        width="24" height="24" viewBox="0 0 24 24">
                        <path d="M13.293 6.293 7.586 12l5.707 5.707 1.414-1.414L10.414 12l4.293-4.293z" />
                    </svg></div>
                <ul class="side-menu">

                    <li class="slide">
                        <a class="side-menu__item" data-bs-toggle="slide" href="<?=site_url().'dashboard/index'?>"><i
                                class="side-menu__icon fe fe-home"></i><span
                                class="side-menu__label">Dashboard</span></a>
                    </li>

                    <!-- BLOG TAB  -->
                    <li class="slide">
                        <a class="side-menu__item" data-bs-toggle="slide" href="<?=site_url().'blog/backend/post'?>"><i
                                class="side-menu__icon fe fe-book"></i><span class="side-menu__label">Blog</span></a>
                    </li>


                    <?php if($this->customer_id == 9999999 ) {?>
                    <a class="side-menu__item" data-bs-toggle="slide"
                        href="<?php echo site_url(); ?>/Superuser/customerlist"><i
                            class="side-menu__icon fe fe-home"></i><span class="side-menu__label">Admin</span></a>

                    <a class="side-menu__item" data-bs-toggle="slide" href="<?=site_url().'ctps/index'?>"><i
                            class="side-menu__icon fe fe-home"></i><span class="side-menu__label">CTPS</span></a>
                    <?php } ?>
                    <?php createSingleMenuLizanex($permissions_array, "kanban", "Kanban", "kanban/index", " fa fa-rss-square");?>

                    <?php if (parentMenu($permissions_array, "sales.") ) { ?>
                    <li class="slide">
                        <a class="side-menu__item" data-bs-toggle="slide" href="javascript:void(0);"><i
                                class="side-menu__icon pe-7s-graph1"></i><span class="side-menu__label">Sales</span><i
                                class="angle fa fa-angle-right"></i></a>
                        <ul class="slide-menu">
                            <?php 
                                                createMenuLizanex($permissions_array, "sales.kanban", "Clients Board", "sales/index");
                                                createMenuLizanex($permissions_array, "sales.manager", "Clients Board Manager", "sales/index/manager");
                                                createMenuLizanex($permissions_array, "sales.list.view", "Contacts", "sales/list");
                                                createMenuLizanex($permissions_array, "sales.manager", "All Contacts ", "sales/manager");
                                                createMenuLizanex($permissions_array, "sales.clientRejection", "All Rejection List", "sales/rejectionList");
                                                createMenuLizanex($permissions_array, "sales.manager", "Secret Business Name", "operation/udc/BusinessSecretName");
                                            ?>
                        </ul>
                    </li>
                    <?php } ?>
                    <?php createSingleMenuLizanex($permissions_array, "campaign.manager.view", "Campaigns", "campaign/index", "pe-7s-albums");?>
                    <?php createSingleMenuLizanex($permissions_array, "campaign.manager.view", "Data", "prospects/index", "pe-7s-server");?>
                    <?php createSingleMenuLizanex($permissions_array, "campaign.mylist", "My", "campaign/mycampaignlist", "fa fa-indent");?>

                    <?php if (parentMenu($permissions_array, "dnc.") ) { ?>
                    <li class="slide">
                        <a class="side-menu__item" data-bs-toggle="slide" href="javascript:void(0);"><i
                                class="side-menu__icon pe-7s-delete-user"></i><span
                                class="side-menu__label">DNC</span><i class="angle fa fa-angle-right"></i></a>
                        <ul class="slide-menu">
                            <?php 
                                            createMenuLizanex($permissions_array, "dnc.search", "Search", "dnc/search"); 
                                            createMenuLizanex($permissions_array, "dnc.Upload", "Bulk Upload", "dnc/uploadcsv"); 
                                        ?>
                        </ul>
                    </li>
                    <?php } ?>



                    <?php if (parentMenu($permissions_array, "edm") ) { ?>
                    <li class="slide">
                        <a class="side-menu__item" data-bs-toggle="slide" href="javascript:void(0);"><i
                                class="side-menu__icon  pe-7s-mail"></i><span class="side-menu__label">Email</span><i
                                class="angle fa fa-angle-right"></i></a>
                        <ul class="slide-menu">
                            <?php 
                                             createMenuLizanex($permissions_array, "edm", "Status Update", "edm/upload"); 
                                            createMenuLizanex($permissions_array, "edm", "List", "edm/lists"); 
                                             createMenuLizanex($permissions_array, "edm", "Campaigns", "edm/create_campaign"); 
                                             createMenuLizanex($permissions_array, "edm", "Campaigns List", "edm/CampaignList"); 
                                        ?>
                        </ul>
                    </li>
                    <?php } ?>

                    <?php createSingleMenuLizanex($permissions_array, "api", "API", "api/index", " fa fa-handshake-o ");?>


                    <?php if (parentMenu($permissions_array, "scraping.") ) { ?>
                    <li class="slide">
                        <a class="side-menu__item" data-bs-toggle="slide" href="javascript:void(0);"><i
                                class="side-menu__icon fa fa-cogs "></i><span class="side-menu__label">Expenses</span><i
                                class="angle fa fa-angle-right"></i></a>
                        <ul class="slide-menu">
                            <?php 
                                            createMenuLi($permissions_array, "edm", "My", "expense/Manager/index");
                                        ?>
                        </ul>
                    </li>
                    <?php } ?>

                    <?php if (parentMenu($permissions_array, "scraping.") ) { ?>
                    <li class="slide">
                        <a class="side-menu__item" data-bs-toggle="slide" href="javascript:void(0);"><i
                                class="side-menu__icon fa fa-cogs "></i><span class="side-menu__label">Vendors</span><i
                                class="angle fa fa-angle-right"></i></a>
                        <ul class="slide-menu">
                            <?php 
                                            createMenuLi($permissions_array, "edm", "My", "vendor/Vendor/index");
                                        ?>
                        </ul>
                    </li>
                    <?php } ?>

                    <?php if (parentMenu($permissions_array, "settings") ) { ?>
                    <li class="slide">
                        <a class="side-menu__item" data-bs-toggle="slide" href="javascript:void(0);"><i
                                class="side-menu__icon  pe-7s-mail"></i><span class="side-menu__label">Email</span><i
                                class="angle fa fa-angle-right"></i></a>
                        <ul class="slide-menu">
                            <?php 
                                            createMenuLizanex($permissions_array, "edm", "Status Update", "edm/upload"); 
                                            createMenuLizanex($permissions_array, "edm", "List", "edm/lists"); 
                                            createMenuLizanex($permissions_array, "edm", "Campaigns", "edm/create_campaign"); 
                                            createMenuLizanex($permissions_array, "edm", "Campaigns List", "edm/CampaignList"); 
                                        ?>
                        </ul>
                    </li>
                    <?php } ?>

                    <?php createSingleMenuLizanex($permissions_array, "landingpage", "Landing Page", "landingpage/index", " fa fa-cloud");?>
                    <li class="slide">
                        <a class="side-menu__item" data-bs-toggle="slide"
                            href="<?=site_url().'operation/udc/level'?>"><i
                                class="side-menu__icon pe-7s-news-paper"></i><span
                                class="side-menu__label">UDC</span></a>
                    </li>




                </ul>
                <div class="slide-right" id="slide-right"><svg xmlns="http://www.w3.org/2000/svg" fill="#7b8191"
                        width="24" height="24" viewBox="0 0 24 24">
                        <path d="M10.707 17.707 16.414 12l-5.707-5.707-1.414 1.414L13.586 12l-4.293 4.293z" />
                    </svg></div>
            </div>
        </aside>
    </div>

    <!--/APP-SIDEBAR-->