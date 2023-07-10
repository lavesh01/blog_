$(document).ready( function() {
$("#txtEditor").Editor();    


$('.Editor-editor').html($("#txtsaved").text());
 

/*'texteffects':true,
'aligneffects':true,
'textformats':true,
'fonteffects':true,
'actions' : true,
'insertoptions' : true,
'extraeffects' : true,
'advancedoptions' : true,
'screeneffects':true,
'bold': true,
'italics': true,
'underline':true,
'ol':true,
'ul':true,
'undo':true,
'redo':true,
'l_align':true,
'r_align':true,
'c_align':true,
'justify':true,
'insert_link':true,
'unlink':true,
'insert_img':true,
'hr_line':true,
'block_quote':true,
'source':true,
'strikeout':true,
'indent':true,
'outdent':true,
'fonts':fonts,
'styles':styles,
'print':true,
'rm_format':true,
'status_bar':true,
'font_size':fontsizes,
'color':colors,
'splchars':specialchars,
'insert_table':true,
'select_all':true,
'togglescreen':true*/

    $("#save_view").click(function(){
        
        var outputForm = $(this);
        var form_id = $('#form_id').val();
        var html = $("#txtEditor").Editor("getText");
        //html = JSON.stringify({ html  });
        data = {"f_id":form_id,"html":html };
        //console.log(data);
        $.ajax({
            type: "POST",
            cache:false,
            dataType: "text",
            url: site_url + "Form/add_view_add/",
            data:data,
            success: function (data) {
                console.log(data);
               
            },
            error: function () {
                alert('Error');
            }
        });
        return false;
     });

});
