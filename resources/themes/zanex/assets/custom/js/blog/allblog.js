$(document).ready(function() {

    var action_api = [{
            "class": "blogaddinputedit",
            "icon": "fa fa-edit icon-gradient bg-plum-plate",
            "id": "edit_",
            "href": "editblog/edit/",
            "title": "Edit"
        },
        {
            "class": "blogaddinputdelete",
            "icon": "fa fa-trash icon-gradient bg-love-kiss",
            "id": "delete_",
            "href": "#",
            "title": "Add Input Fields"
        },

    ];

    var aocolumnDefs = [];
    enable_common_dataTable('blog/backend/blogs/ajax_getBlogPosts/', "#blogs_dataTable", action_api,
        aocolumnDefs);

    $(document).on('click', '.blogaddinputedit', function(e) {
        var edit_id = $(this);
        var id = edit_id.attr("id").replace("edit_", "");
        var send_data = $.param({
            "id": id,
            "ref_id": $("#ref_id").val()
        });
        var adata = ajax_call_no_alert("Api/ajax_getsingleapirow", send_data);
        if (adata.type == "success") {
            for (var i = adata.data.length - 1; i >= 0; i--) {

                $.each(adata.data[i], function(key, value) {
                    fillatt(value, '[name="' + key + '"]', "val");
                });
            }
        }
    });

    $(document).on('click', '.blogaddinputdelete', function(e) {
        var delete_id = $(this);
        var id = delete_id.attr("id").replace("delete_", "");
        Swal.fire({

            title: 'Are you sure?',

            text: "You won't be able to revert this!",

            type: 'warning',

            showCancelButton: true,

            confirmButtonColor: '#3085d6',

            cancelButtonColor: '#d33',

            confirmButtonText: 'Yes, delete it!',

            confirmButtonClass: 'btn btn-warning',

            cancelButtonClass: 'btn btn-danger ml-1',

            buttonsStyling: false,

        }).then(function(result) {

            if (result.value) {
                block_ajax_ui();
                var send_data = $.param({
                    "id": id
                });
                var adata = ajax_call("blog/backend/post/deletePost", send_data);
                if (adata.type == "success") {

                    $('#blogs_dataTable_' + id).remove();
                    enable_common_dataTable('Api/ajax_getall', "#blogs_dataTable", action_api,
                        "",
                        "", send_id);
                    unblock_ajax_ui();
                }
            } else if (result.dismiss === Swal.DismissReason.cancel) {
                Swal.fire({
                    title: 'Cancelled',
                    text: 'Post Deletion Cancelled :)',
                    type: 'error',
                    confirmButtonClass: 'btn btn-success',

                })
                unblock_ajax_ui();
            }

        })

    });


    $('#create-post').click(function() {
        $('#createPostModal').modal('show');
    });

    $('#post_title').on('input', function() {
        var title = $(this).val().trim().toLowerCase();
        var slug = title.replace(/[^a-z0-9 ]+/g, '');
        slug = slug.replace(/\s+/g, '-');
        slug = '/' + slug;
        $('#slug').val(slug);
    })

    $('#confirm-create-post').click(function() {
        var post_title = $('#post_title').val();
        var slug = $('#slug').val();
        var postData = {
            post_title,
            slug
        };
        var adata = ajax_call_no_alert("blog/backend/Post/save_post", $.param(postData));
        if (adata.type == "success") {
            alert("Post created successfull!");

            var newRow = '<tr id="post-' + adata.post_id + '">' +
                '<td>' + adata.post_id + '</td>' +
                '<td>' + post_title + '</td>' +
                '<td>' + 'UnCategorised' + '</td>' +
                '<td>' + 'Just now' + '</td>' +
                '<td>' + 'Draft' + '</td>' +
                '<td><button class="btn btn-primary edit-post" data-post-id="' + adata.post_id +
                '">Edit</button></td>' +
                '<td><button class="btn btn-primary delete-post" data-post-id="' + adata.post_id +
                '">Delete Post</button></td>' +
                '</tr>';

            $('#posts-container').append(newRow);

            $('#post_title').val(' ');
            $('#slug').val(' ');
            console.log(adata.post_id);
        } else {
            alert("Error, data missing");
        }
    })

    $('.edit-post').click(function() {
        var postId = $(this).data('post-id');
        console.log(postId);

        window.location.href = site_url + `blog/backend/editblog/edit/` + postId;
    });

    $('.delete-post').click(function() {
        var postId = $(this).data('post-id');

        $.ajax({
            url: site_url + 'blog/backend/post/deletePost',
            type: 'POST',
            data: {
                post_id: postId
            },
            success: function(response) {
                console.log(response);
                $('#post-' + postId).remove();
            },
            error: function(xhr, status, error) {
                console.error(xhr.responseText);
            }
        });
    });

    
});