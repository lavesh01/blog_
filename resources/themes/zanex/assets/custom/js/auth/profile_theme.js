// Demo Theme Options

$(function () {

 
    $('.switch-theme-class_page').on('click', function () {

        var classToSwitch = $(this).attr('data-class');
        var containerElement = '.app-container';

        if (classToSwitch == 'body-tabs-line') {
            $(containerElement).removeClass('body-tabs-shadow');
            $(containerElement).addClass(classToSwitch);
        }

        if (classToSwitch == 'body-tabs-shadow') {
            $(containerElement).removeClass('body-tabs-line');
            $(containerElement).addClass(classToSwitch);
        }

        $(this).parent().find('.switch-theme-class').removeClass('active');
        $(this).addClass('active');

        var send_data = "classToSwitch="+classToSwitch+"&class=switch-theme-class_page";
        ajax_call("Profile/ajax_update_theme",send_data,true,2 );
    });

    $('.switch-theme-class_color').on('click', function () {

        var classToSwitch = $(this).attr('data-class');
        var containerElement = '.app-container';

        if (classToSwitch == 'app-theme-white') {
            $(containerElement).removeClass('app-theme-gray');
            $(containerElement).addClass(classToSwitch);
        }

        if (classToSwitch == 'app-theme-gray') {
            $(containerElement).removeClass('app-theme-white');
            $(containerElement).addClass(classToSwitch);
        }

        
        $(this).parent().find('.switch-theme-class').removeClass('active');
        $(this).addClass('active');

        var send_data = "classToSwitch="+classToSwitch+"&class=switch-theme-class_color";
        ajax_call("Profile/ajax_update_theme",send_data,true,2 );
    });

    $('.switch-header-cs-class').on('click', function () {
        var classToSwitch = $(this).attr('data-class');
        var containerElement = '.app-header';

        $('.switch-header-cs-class').removeClass('active');
        $(this).addClass('active');

        $(containerElement).attr('class', 'app-header');
        $(containerElement).addClass('header-shadow ' + classToSwitch);

        var send_data = "classToSwitch="+classToSwitch+"&class=switch-header-cs-class";
        ajax_call("Profile/ajax_update_theme",send_data,true,2 );
    });

    $('.switch-sidebar-cs-class').on('click', function () {
        var classToSwitch = $(this).attr('data-class');
        var containerElement = '.app-sidebar';

        $('.switch-sidebar-cs-class').removeClass('active');
        $(this).addClass('active');

        $(containerElement).attr('class', 'app-sidebar');
        $(containerElement).addClass('sidebar-shadow ' + classToSwitch);
        var send_data = "classToSwitch="+classToSwitch+"&class=switch-sidebar-cs-class";
        ajax_call("Profile/ajax_update_theme",send_data,true,2 );
    });
});