
<ul class="header-megamenu nav">
    <?php if (file_exists(FCPATH."/resources/themes/default/assets/images/client/".$this->customer_id.".png") ) {
        echo '<li><img width="115" src="'.site_url('/resources/themes/default/assets/images/client/'.$this->customer_id.'.png').'"></li>';
        }
        else
        {
            echo '<li><img width="115" src="'.site_url('/resources/themes/default/assets/images/logo.png').'"></li>';
        }   
        ?>
</ul>
