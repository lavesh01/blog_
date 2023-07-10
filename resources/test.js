$.fn.editable.defaults.mode = 'inline';
$.fn.editabletypes.select2.defaults;
$(document).ready(function() {
 ajax_call_no_alert('Udc/Udc/level', send_data,async= true,'JSON','xeditable_select("#country",data)')
});

/*
$a = $('#country').editable({
    container: 'body',
         tpl: '<select></select>',
        select2: {
            ajax: {
                cache: false,
                dataType: 'json',
                //delay: 250,
                url: "http://localhost/gitx/Udc/Udc/level",
                placeholder: 'Select country',
                //allowClear: true,
                 dropdownParent   : '.popover:last',
                width: '20em',
                dropdownAutoWidth: true,
                theme: 'bootstrap',
                processResults: function (data, page) {
                    return {
                        results: data
                    };
                }
            }
        },
        error: function(response, newValue) {
            if(response.status === 500) {
                return 'Service unavailable. Please try later.';
            }
            else {
                return response.responseText;
            }
        },
        success: function success(response, newValue) {
            console.log('success', response, newValue)
            $a.attr('data-pk', newValue);
            //$dealerrep.val(newValue);
        }
    });*/