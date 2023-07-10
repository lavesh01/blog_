<div class="app-header header sticky">
    <div class="container-fluid main-container">
        <div class="d-flex align-items-center">
            <a aria-label="Hide Sidebar" class="app-sidebar__toggle" data-bs-toggle="sidebar" href="javascript:void(0);"></a>
            
            <div class="responsive-logo">
                <a href="index.html" class="header-logo">
                   <?php if (file_exists(FCPATH."/resources/themes/default/assets/images/client/".$this->customer_id.".png") ) {
                    
                    echo '<img lt="logo" class="mobile-logo logo-1"  src="'.site_url('/resources/themes/'.$theme_selected_template.'/assets/images/client/'.$this->customer_id.'3.png').'">';
                    echo '<img  alt="logo" class="mobile-logo dark-logo-1" src="'.site_url('/resources/themes/'.$theme_selected_template.'/assets/images/client/'.$this->customer_id.'4.png').'">';
                    }
                    else
                    {
                        echo '<img alt="logo" class="mobile-logo logo-1" src="'.site_url('/resources/themes/'.$theme_selected_template.'/assets/images/logo.png').'">';
                        echo '<img   alt="logo" class="mobile-logo dark-logo-1" src="'.site_url('/resources/themes/'.$theme_selected_template.'/assets/images/logo.png').'">';
                        
                    }   
                    ?>
                </a>
            </div>
            <!-- sidebar-toggle-->
            <a class="logo-horizontal " href="index.html">

                <?php if (file_exists(FCPATH."/resources/themes/default/assets/images/client/".$this->customer_id.".png") ) {
                    
                    echo '<img lt="logo" class="header-brand-img desktop-logo" src="'.site_url('/resources/themes/'.$theme_selected_template.'/assets/images/client/'.$this->customer_id.'3.png').'">';
                    echo '<img  alt="logo" class="header-brand-img light-logo1"  src="'.site_url('/resources/themes/'.$theme_selected_template.'/assets/images/client/'.$this->customer_id.'4.png').'">';
                    }
                    else
                    {
                        echo '<img alt="logo" class="header-brand-img desktop-logo"  src="'.site_url('/resources/themes/'.$theme_selected_template.'/assets/images/logo.png').'">';
                        echo '<img   alt="logo" class="header-brand-img light-logo1"  src="'.site_url('/resources/themes/'.$theme_selected_template.'/assets/images/logo.png').'">';
                        
                    }   
                    ?>

            </a>

           

            <!-- LOGO -->
            <div class="main-header-center ms-3 d-none d-lg-block">
                <h1 class="page-title" id="pagetitle"></h1>
                <div id="pagebreadcrumbs"></div>
            </div>
            <div class="d-flex order-lg-2 ms-auto header-right-icons">
                <!-- SEARCH -->
                <button class="navbar-toggler navresponsive-toggler d-lg-none ms-auto" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent-4" aria-controls="navbarSupportedContent-4" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon fe fe-more-vertical text-dark"></span>
                    </button>
                <div class="navbar navbar-collapse responsive-navbar p-0">
                    <div class="collapse navbar-collapse" id="navbarSupportedContent-4">
                        <div class="d-flex order-lg-2">
                            <div class="dropdown d-md-flex">
                                <div class="dropdown">
                                    <div class="form-group m-auto pl-2">
                                        <div class="progress">
                                            <div class="progress-bar progress-bar-striped" role="progressbar" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100" style="width: 15%;text-align: center;color: #ff3b00;background-color: #f7b924;" id="timeclocklock">Clock</div>
                                        </div>
                                        <select class="input-xs" id="timeclocklockDropdown">
                                            <option value="">Ideal</option>
                                            <option value="1">Meeting</option>
                                            <option value="2">Dailing</option>
                                            <option value="3">CDQA</option>
                                            <option value="4">Audit</option>
                                            <option value="5">Reporting</option>
                                            <option value="6">Delivery</option>
                                            <option value="7">Break</option>
                                            <option value="8">Day End</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="dropdown d-md-flex">
                                <div class="dropdown">
                                    <a href="<?php echo site_url().'Timetracker/index' ?>" aria-haspopup="true" class="nav-link icon nav-link-bg theme-layout">
                                         <span class="dark-layout"><i class="fa fa-clock-o "></i></span>
                                          <span class="light-layout"><i class="fa fa-clock-o "></i></span>
                                    </a>
                                </div>
                            </div>
                            <div class="dropdown d-md-flex">
                                <a class="nav-link icon theme-layout nav-link-bg layout-setting">
                                    <span class="dark-layout"><i class="fe fe-moon"></i></span>
                                    <span class="light-layout"><i class="fe fe-sun"></i></span>
                                </a>
                            </div>
                            <!-- Theme-Layout -->
                            <div class="dropdown d-md-flex">
                                <a class="nav-link icon full-screen-link nav-link-bg">
                                    <i class="fe fe-minimize fullscreen-button"></i>
                                </a>
                            </div>
                            <!-- FULL-SCREEN -->
                            <div class="dropdown d-md-flex notifications">
                                <a class="nav-link icon" data-bs-toggle="dropdown"><i class="fe fe-bell"></i><span class=" pulse"></span>
                                    </a>
                                <div class="dropdown-menu dropdown-menu-end dropdown-menu-arrow ">
                                    <div class="drop-heading border-bottom">
                                        <div class="d-flex">
                                            <h6 class="mt-1 mb-0 fs-16 fw-semibold">You have Notification</h6>
                                            <div class="ms-auto">
                                                <span class="badge bg-success rounded-pill" id="countnotification"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="notifications-menu" id="notifications_area">
                                        
                                    </div>
                                    <div class="dropdown-divider m-0"></div>
                                    <a href="<?php echo site_url('Notification/list'); ?>" class="dropdown-item text-center p-3 text-muted">View all Notification</a>
                                </div>
                            </div>
                            <!-- NOTIFICATIONS -->
                            <div class="dropdown d-md-flex message"   id="todo_list">
                                <a class="nav-link icon text-center" data-bs-toggle="dropdown">
                                    <i class="fe fe-message-square"></i><span class=" pulse-danger"></span>
                                </a>
                                <div class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                    <div class="drop-heading border-bottom">
                                        <div class="d-flex">
                                            <h6 class="mt-1 mb-0 fs-16 fw-semibold">Todo</h6>
                                            <div class="ms-auto">
                                                <span class="badge bg-danger rounded-pill " id="counttodo"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="message-menu" >
                                        <div class="dropdown-item d-flex" > 
                                            <small id="log"  ></small>
                                            <div class="row">
                                                <div class="col-9"><input name="todo-input" placeholder="Add" class="form-control" /></div>
                                                <div class="col-3"><a href="#" name="todo-form" id="todo-from" class=" btn-primary btn-sm rounded-11 me-2">Save</a></div>
                                            </div>
                                        </div>
                                        <div id="todo-container"></div>
                                       
                                    
                                    </div>
                                    <div class="dropdown-divider m-0"></div>
                                   
                                </div>
                            </div>
                            <!-- MESSAGE-BOX -->
                            <div class="dropdown d-md-flex profile-1">
                                <a href="javascript:void(0);" data-bs-toggle="dropdown" class="nav-link leading-none d-flex px-1">
                                    <span>
                                            <img src="<?php echo site_url(). $this->session->profile_url; ?>" alt="profile-user" class="avatar  profile-user brround cover-image">
                                        </span>
                                </a>
                                <div class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                    <div class="drop-heading">
                                        <div class="text-center">
                                            <h5 class="text-dark mb-0"><?php echo $this->session->username; ?></h5>
                                            <small class="text-muted"><?php echo $this->session->description; ?></small>
                                        </div>
                                    </div>
                                    <div class="dropdown-divider m-0"></div>
                                    <a class="dropdown-item" href="<?php echo site_url('profile'); ?>">
                                        <i class="dropdown-icon fe fe-user"></i> Profile
                                    </a>
                                    <a class="dropdown-item" href="email.html">
                                        <i class="dropdown-icon fe fe-mail"></i> Inbox
                                        <span class="badge bg-secondary float-end">3</span>
                                    </a>
                                    <a class="dropdown-item" href="<?php echo site_url('profile/theme'); ?>">
                                        <i class="dropdown-icon fe fe-settings"></i> Settings
                                    </a>
                                    <a class="dropdown-item" href="<?php echo site_url('ChangePassword'); ?>">
                                        <i class="dropdown-icon fe fe-alert-triangle"></i> Password Change
                                    </a>
                                    <a class="dropdown-item" href="<?php echo site_url("auth/logout")?>">
                                        <i class="dropdown-icon fe fe-alert-circle"></i> Sign out
                                    </a>
                                </div>
                            </div>
                            <div class="dropdown d-md-flex header-settings">
                                <a href="javascript:void(0);" class="nav-link icon " data-bs-toggle="sidebar-right" data-target=".sidebar-right">
                                    <i class="fe fe-menu"></i>
                                </a>
                            </div>
                            
                            <!-- SIDE-MENU -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
