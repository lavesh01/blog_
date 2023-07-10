
 <div class="side-header">
    <a class="header-brand1" href="<?php echo base_url();?>">

    <?php if (file_exists(FCPATH."/resources/themes/assets/images/client/".$this->customer_id.".png") ) {
            echo '<img class="header-brand-img desktop-logo" alt="logo"  src="'.site_url('/resources/themes/assets/images/client/'.$this->customer_id.'1.png').'">';
            echo '<img class="header-brand-img desktop-logo" alt="logo"  src="'.site_url('/resources/themes/assets/images/client/'.$this->customer_id.'2.png').'">';
            echo '<img class="header-brand-img  light-logo" alt="logo"  src="'.site_url('/resources/themes/assets/images/client/'.$this->customer_id.'3.png').'">';
            echo '<img class="header-brand-img light-logo1" alt="logo"  src="'.site_url('/resources/themes/assets/images/client/'.$this->customer_id.'4.png').'">';
            }
            else
            {
                echo '<img  class="header-brand-img desktop-logo" alt="logo"  src="'.site_url('/resources/themes/assets/images/logo.png').'">';
                echo '<img  class="header-brand-img toggle-logo" alt="logo"  src="'.site_url('/resources/themes/assets/images/logo.png').'">';
                echo '<img  class="header-brand-img light-logo" alt="logo"  src="'.site_url('/resources/themes/assets/images/logo.png').'">';
                echo '<img  class="header-brand-img light-logo1" alt="logo"  src="'.site_url('/resources/themes/assets/images/logo.png').'">';
            }   
    ?>
    </a>
<!-- LOGO -->
</div>