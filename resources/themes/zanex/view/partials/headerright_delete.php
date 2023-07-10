
<?php die(); ?>
<div class="header-dots">
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

     <div class="dropdown">
            <a href="<?php echo site_url().'Timetracker/index' ?>" aria-haspopup="true" class="p-0 mr-2 btn btn-link">
                <span class="icon-wrapper icon-wrapper-alt rounded-circle ">
                    <span class="icon-wrapper-bg bg-danger"></span>
                    <i class="fa fa-clock-o  icon-gradient bg-arielle-smile"></i>
                </span>
            </a>
    </div>

    <!--
    <div class="dropdown">
        <button type="button" aria-haspopup="true" aria-expanded="false" data-toggle="dropdown" class="p-0 mr-2 btn btn-link">
            <span class="icon-wrapper icon-wrapper-alt rounded-circle">
                <span class="icon-wrapper-bg bg-primary"></span>
                <i class="icon text-primary ion-android-apps  icon-gradient bg-warm-flame""></i>
            </span>
        </button>
        <div tabindex="-1" role="menu" aria-hidden="true" class="dropdown-menu-xl rm-pointers dropdown-menu dropdown-menu-right">
            <div class="dropdown-menu-header">
                <div class="dropdown-menu-header-inner popup-header">
                    <div class="menu-header-image" style="background-image: url('<?php echo base_url();?>/resources/themes/default/assets/images/dropdown-header/abstract4.jpg');"></div>
                    <div class="menu-header-content text-white">
                        <h5 class="menu-header-title text-color">Modules</h5>
                        <h6 class="menu-header-subtitle text-color">Quick Modules</h6>
                    </div>
                </div>
            </div>
            <div class="grid-menu grid-menu-xl grid-menu-3col">
                <div class="no-gutters row">
                    <div class="col-sm-6 col-xl-4">
                        <a href="<?php echo site_url()."sales/list"?>" class="btn-icon-vertical btn-square btn-transition btn btn-outline-link">
                            <i class="pe-7s-world icon-gradient bg-night-fade btn-icon-wrapper btn-icon-lg mb-3"></i>
                            Sales
                        </a >
                    </div>
                    <div class="col-sm-6 col-xl-4">
                        <a href="<?php echo site_url()."campaign/"?>"class="btn-icon-vertical btn-square btn-transition btn btn-outline-link">
                            <i class="pe-7s-piggy icon-gradient bg-night-fade btn-icon-wrapper btn-icon-lg mb-3"> </i>
                            Operation
                        </a >
                    </div>
                    <div class="col-sm-6 col-xl-4">
                        <a href="<?php echo site_url().""?>" class="btn-icon-vertical btn-square btn-transition btn btn-outline-link">
                            <i class="pe-7s-config icon-gradient bg-night-fade btn-icon-wrapper btn-icon-lg mb-3"> </i>
                            Sales
                        </a >
                    </div>
                    <div class="col-sm-6 col-xl-4">
                        <a href="<?php echo site_url()."dnc"?>" class="btn-icon-vertical btn-square btn-transition btn btn-outline-link">
                            <i class="pe-7s-browser icon-gradient bg-night-fade btn-icon-wrapper btn-icon-lg mb-3"> </i>
                            DNC
                        </a >
                    </div>
                    <div class="col-sm-6 col-xl-4">
                        <a href="<?php echo site_url()."edm/upload"?>" class="btn-icon-vertical btn-square btn-transition btn btn-outline-link">
                            <i class="pe-7s-hourglass icon-gradient bg-night-fade btn-icon-wrapper btn-icon-lg mb-3"> </i>
                            Email Logs
                        </a >
                    </div>
                    <div class="col-sm-6 col-xl-4">
                        <a href="<?php echo site_url()."users/list"?>" class="btn-icon-vertical btn-square btn-transition btn btn-outline-link">
                            <i class="pe-7s-world icon-gradient bg-night-fade btn-icon-wrapper btn-icon-lg mb-3"> </i>
                            Admin
                        </a >
                    </div>
                </div>
            </div>
            <ul class="nav flex-column">
                <li class="nav-item-divider nav-item"></li>
                <li class="nav-item-btn text-center nav-item">
                    <a href="<?php echo site_url().""?>" class="btn-shadow btn btn-primary btn-sm">Follow-ups</a href="<?php echo site_url().""?>">
                </li>
            </ul>
        </div>
    </div>
    -->
    <div class="dropdown">
        <button type="button" aria-haspopup="true" aria-expanded="false" data-toggle="dropdown" class="p-0 mr-2 btn btn-link">
            <span class="icon-wrapper icon-wrapper-alt rounded-circle">
                <span class="icon-wrapper-bg bg-danger"></span>
                <i class="icon text-danger icon-anim-pulse ion-android-notifications  icon-gradient bg-night-fade"></i>
                <span class="badge badge-dot badge-dot-sm badge-danger">Notifications</span>
            </span>
        </button>
        <div tabindex="-1" role="menu" aria-hidden="true" class="dropdown-menu-xl rm-pointers dropdown-menu dropdown-menu-right">
            <div class="dropdown-menu-header mb-0">
                <div class="dropdown-menu-header-inner popup-header">
                    <div class="menu-header-image opacity-1" style="background-image: url('<?php echo base_url();?>/resources/themes/default/assets/images/dropdown-header/city3.jpg');"></div>
                    <div class="menu-header-content text-dark">
                        <h5 class="menu-header-title text-color">Notifications</h5>
                        <h6 class="menu-header-subtitle text-color">Your last 10 messages</h6>
                    </div>
                </div>
            </div>
            
            <div class="scroll-area-sm">
                <div class="scrollbar-container">
                    <div class="p-3">
                        <div class="notifications-box">
                            <div class="vertical-time-simple vertical-without-time vertical-timeline vertical-timeline--one-column">
                                <div id="notifications_area">
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
             <ul class="nav flex-column">
                <li class="nav-item-divider nav-item"></li>
                    <li class="nav-item-btn text-center nav-item">
                        <a href="<?php echo site_url('Notification/list'); ?>" class="btn-shadow btn-wide btn-pill btn btn-focus btn-sm">View All Notifications</a>
                    </li>
            </ul>
        </div>

    </div>
        
    <div class="dropdown">
        <button id="todo_list" type="button" aria-haspopup="true" aria-expanded="false" data-toggle="dropdown" class="p-0 mr-2 btn btn-link">
            <span class="icon-wrapper icon-wrapper-alt rounded-circle">
                <span class="icon-wrapper-bg bg-danger"></span>
                <i class="icon text-danger icon-anim-pulse ion-android-clipboard  icon-gradient bg-sunny-morning"></i>
                <span class="badge badge-dot badge-dot-sm badge-danger">Todo</span>
            </span>
        </button>
        <div tabindex="-1" role="menu" aria-hidden="true" class="dropdown-menu-xl rm-pointers dropdown-menu dropdown-menu-right">
            <div class="dropdown-menu-header mb-0">
                <div class="dropdown-menu-header-inner popup-header">
                    <div class="menu-header-image opacity-1" style="background-image: url('<?php echo base_url();?>/resources/themes/default/assets/images/dropdown-header/city3.jpg');"></div>
                    <div class="menu-header-content text-dark">
                        <h5 class="menu-header-title text-color">Todo</h5>
                    </div>
                </div>
            </div>
            <ul class="tabs-animated-shadow tabs-animated nav nav-justified tabs-shadow-bordered p-3">
                <li class="nav-item">
                    <div class="row">
                        <div class="col-9"><input name="todo-input" placeholder="Add" class="form-control" /></div>
                        <div class="col-3"><button name="todo-form" id="todo-from" class="btn-wide btn btn-success">Save</button></div>
                    </div>
                </li>
            </ul>
            <div class="tab-content scroll-area-sm"><small id="log"></small>
                <div class=" scrollbar-container" id="todo-container">
                    
               </div>
            </div>
        </div>
    </div>
    <div class="dropdown">
            <a href="<?php echo site_url().'bugs' ?>" aria-haspopup="true" class="p-0 mr-2 btn btn-link">
                <span class="icon-wrapper icon-wrapper-alt rounded-circle ">
                    <span class="icon-wrapper-bg bg-danger"></span>
                    <i class="fa fa-bug  icon-gradient bg-love-kiss"></i>
                    
                </span>
            </a>
    </div>
</div>
      <?php 
$users=$this->user_id;
       ?>
<div class="header-btn-lg pr-0">
    <div class="widget-content p-0">
        <div class="widget-content-wrapper">
            <div class="widget-content-left">
                <div class="btn-group">
                    <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="p-0 btn">
                        <img width="42" class="rounded-circle" src="<?php echo site_url(). $this->session->profile_url; ?>" alt="">
                        <i class="fa fa-angle-down ml-2 opacity-8"></i>
                    </a>
                    <div tabindex="-1" role="menu" aria-hidden="true" class="rm-pointers dropdown-menu-lg dropdown-menu dropdown-menu-right">
                        <div class="dropdown-menu-header">
                            <div class="dropdown-menu-header-inner popup-header">
                                <div class="menu-header-image opacity-2 popup-header" style="background-image: url('<?php echo base_url();?>/resources/themes/default/assets/images/dropdown-header/city3.jpg');"></div>
                                <div class="menu-header-content text-left">
                                    <div class="widget-content p-0">
                                        <div class="widget-content-wrapper">
                                            <div class="widget-content-left mr-3">
                  
                                                <img width="42" class="rounded-circle"
                                                     src="<?php echo  site_url().$this->session->profile_url; ?>"
                                                     alt="">
                                            </div>
                                            <div class="widget-content-left ">
                                                <div class="widget-heading" style="text-transform:none"><?php echo $this->session->username; ?>
                                                </div>
                                                <div class="widget-subheading opacity-8 popup-title"><?php echo $this->session->description; ?>
                                                </div>
                                            </div>
                                            <div class="widget-content-right mr-2">
                                                <a class="btn-pill btn-shadow btn-shine btn btn-focus popup-btn" href="<?php echo site_url("auth/logout")?>">Logout
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="scroll-area-xs" style="height: 150px;">
                            <div class="scrollbar-container ps">
                                <ul class="nav flex-column">
                                    <li class="nav-item-header nav-item">Activity
                                    </li>
                                    
                                    <li class="nav-item">
                                        <a href="<?php echo site_url('ChangePassword'); ?>" class="nav-link link-color">Change Password
                                        </a>
                                    </li>
                                    <li class="nav-item"><a class="nav-link link-color" href="<?php echo site_url('Notification/list'); ?>" > Notification List </a>
                                    </li>
                                    <li class="nav-item"><a class="nav-link link-color" href="<?php echo site_url('profile/theme'); ?>" > Theme Setting </a>
                                    </li>
                                    <li class="nav-item">
    
                            <?php
                             $role_id=$this->session->role_id;
                             ?>
                                        <a href="<?php echo site_url('profile'); ?>" class="nav-link link-color">Settings
                                            <div class="ml-auto badge badge-success">New
                                            </div>
                                        </a>
                            
                             <?php if($role_id=="4"){  ?> 
                                        <a href="<?php echo site_url('profiles'); ?>" class="nav-link">Settings
                                            
                                        </a>
                            <?php } ?>

                                    </li>
                                    
                                </ul>
                            </div>
                        </div>
                        <!--
                        <ul class="nav flex-column">
                            <li class="nav-item-divider mb-0 nav-item"></li>
                        </ul>
                        <div class="grid-menu grid-menu-2col">
                            <div class="no-gutters row">
                                <div class="col-sm-6">
                                    <button class="btn-icon-vertical btn-transition btn-transition-alt pt-2 pb-2 btn btn-outline-warning">
                                        <i class="pe-7s-chat icon-gradient bg-amy-crisp btn-icon-wrapper mb-2"></i>
                                        Message Inbox
                                    </button>
                                </div>
                                <div class="col-sm-6">
                                    <button class="btn-icon-vertical btn-transition btn-transition-alt pt-2 pb-2 btn btn-outline-danger">
                                        <i class="pe-7s-ticket icon-gradient bg-love-kiss btn-icon-wrapper mb-2"></i>
                                        <b>Support Tickets</b>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <ul class="nav flex-column">
                            <li class="nav-item-divider nav-item">
                            </li>
                            <li class="nav-item-btn text-center nav-item">
                                <button class="btn-wide btn btn-primary btn-sm">
                                    Open Messages
                                </button>
                            </li>
                        </ul>
                        -->
                    </div>
                </div>
            </div>
            <div class="widget-content-left  ml-3 header-user-info">
                <div class="widget-heading mb-1"  style="text-transform: none;">
                    <?php echo $this->session->username; ?>
                </div>
                <div class="widget-subheading">
                    <?php echo $this->session->designation; ?>
                </div>
            </div>
        </div>
    </div>
</div>
<!--
<div class="header-btn-lg">
    <button type="button" class="hamburger hamburger--elastic open-right-drawer">
        <span class="hamburger-box">
            <span class="hamburger-inner"></span>
        </span>
    </button>
</div>
-->