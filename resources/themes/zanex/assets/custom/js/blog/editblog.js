$(document).ready(function() {

    $('#add-tag-btn').click(function(e) {
        e.preventDefault();
        console.log('clicked add tag')
        var tagInput = $('#tag-input-field');
        var tagValue = tagInput.val().trim();

        if (tagValue !== '') {
            var tagSpan = $('<span class="tag"></span>').text(tagValue);
            var deleteLink = $(
                '<a href="javascript:void(0)" class="tag-addon delete-tag"><i class="fe fe-x"></i></a>'
            );

            deleteLink.click(function() {
                $(this).parent('.tag').remove();
            });

            tagSpan.append(deleteLink);
            $('#tags').append(tagSpan);

            tagInput.val('');
        }
    });

    $(document).on('click', '.delete-tag', function() {
        $(this).parent('.tag').remove();
    });

    $('#add-category-btn').click(function(e) {
        e.preventDefault();
        var categoryName = $('#new-category-input').val();

        $.ajax({
            url: site_url + 'blog/backend/post/saveCategory',
            type: 'POST',
            data: {
                category_name: categoryName
            },
            success: function(response) {

                var startIndex = response.indexOf('{');
                var endIndex = response.lastIndexOf('}');
                var jsonString = response.substring(startIndex, endIndex + 1);

                var data = JSON.parse(jsonString);

                console.log(data);

                console.log(data.id);
                console.log(data.category_name);

                var selectDropdown = $('#category');
                var newOption = $('<option></option>')
                    .attr('value', data.id)
                    .attr('data-category-id', data.id)
                    .text(data.category_name);

                selectDropdown.append(newOption);
                selectDropdown.val(data.id);

            },
            error: function(xhr, status, error) {
                console.log(error);
            }
        });

        $('#new-category-input').val('');
    });

    $('#add-sub-category-btn').click(function(e) {
        e.preventDefault();
        var subCategoryName = $('#new-sub-category-input').val();

        $.ajax({
            url: site_url + 'blog/backend/post/saveSubCategory',
            type: 'POST',
            data: {
                subcategory_name: subCategoryName
            },
            success: function(response) {
                var startIndex = response.indexOf('{');
                var endIndex = response.lastIndexOf('}');
                var jsonString = response.substring(startIndex, endIndex + 1);

                var data = JSON.parse(jsonString);

                console.log(data);

                console.log(data.id);
                console.log(data.subcategory_name);

                var selectDropdown = $('#sub_category');
                var newOption = $('<option></option>')
                    .attr('value', data.id)
                    .text(data.subcategory_name);

                selectDropdown.append(newOption);
                selectDropdown.val(data.id);
            },
            error: function(xhr, status, error) {
                console.log(error);
            }
        });

        $('#new-sub-category-input').val('');
    });

    $('#update-btn').click(function(e) {
        e.preventDefault();
        
        var $form = $('#post-form');
        var $submitButton = $form.find('button[type="submit"]');
        
        var id = $(this).data('post-id');
        console.log(id);
        var url = 'blog/backend/editblog/update/' + id;

        var post_type = $('input[name="post_type"]:checked').val();
        var post_title = $('#title').val();
        var slug = $('#slug').val();
        // var content = grapes_editor.getHtml();
        var content = "New content";

        // var content = tinymce.activeEditor.getContent();
        // var editorValue = $('input[name="editor"]:checked').val();
        // console.log(editorValue);
        // var content;
        // if (editorValue === '1') {
        //     content = tinymce.activeEditor.getContent();
        // } else if (editorValue === '0') {
        //     console.log(grapes_editor.getHtml());
        //     console.log(grapes_editor.getCss());
        //     content = grapes_editor.getHtml();
        // }
        // console.log(content);

        var metaTitle = $('#meta_title').val();
        var metaDescription = $('#meta_description').val();
        var metaKeywords = $('#meta_keywords').val();
        var canonicalTagsValue = $('input[name="canonical_tags"]:checked').val();
        var robotsTagIndex = $('select[name="index"]').val();
        var robotsTagFollow = $('select[name="follow"]').val();
        var authorTag = $('#author_tag').val();

        var ogUrl = $('#og-url-input').val();
        var ogType = $('#og-type-input').val();
        var ogTitle = $('#og-title-input').val();
        var ogDescription = $('#og-description-input').val();
        var ogImage = $('#og-image-input').val();
        var twitterSite = $('#twitter-site-input').val();
        var twitterTitle = $('#twitter-title-input').val();
        var twitterDescription = $('#twitter-description-input').val();
        var twitterImage = $('#twitter-image-input').val();

        var subCategory = $('#sub_category').val();
        var category = $('#category').val();

        var tags = [];
        $('.tag').each(function() {
            var tag = $(this).text().trim();
            tags.push(tag);
        });

        var status = $('#status').val();
        var featured = $('#featured').prop('checked') ? 1 : 0;
        var featuredImage = $('#featured_image').val();
        var featuredImageTitle = $('#featured_image_title').val();
        var featuredImageAltTag = $('#featured_image_alt_tag').val();
        var featuredImageDescription = $('#featured_image_description').val();
        var featuredImageCaption = $('#featured_image_caption').val();


        var postData = {
            id: id,
            post_type: post_type,
            post_title: post_title,
            slug: slug,
            post_content: content,
            meta_title: metaTitle,
            meta_description: metaDescription,
            meta_keywords: metaKeywords,
            meta_canonical: canonicalTagsValue,
            robots_tag_index: robotsTagIndex,
            robots_tag_follow: robotsTagFollow,
            author_tag: authorTag,
            og_url: ogUrl,
            og_type: ogType,
            og_title: ogTitle,
            og_description: ogDescription,
            og_image: ogImage,
            twitter_site: twitterSite,
            twitter_title: twitterTitle,
            twitter_description: twitterDescription,
            twitter_image: twitterImage,
            category: category,
            sub_category: subCategory,
            tags: tags,
            status: status,
            featured: featured,
            featured_image: featuredImage,
            featured_image_title: featuredImageTitle,
            featured_image_alt_tag: featuredImageAltTag,
            featured_image_description: featuredImageDescription,
            featured_image_caption: featuredImageCaption
        };

        $submitButton.prop('disabled', true).text('Submitting...');
        
        var adata = ajax_call_no_alert(url, $.param(postData));
        $submitButton.prop('disabled', false).text('Update');
        if (adata.type == "success") {
            alert("Post updated successfull!");
            // console.log(adata.post_id);
        } else {
            alert("Error, data missing");
        }

    });

   

      $(window).on('load', function() {

        // const projectID = 1;
        // const projectEndpoint = `http://localhost:3000/projects/${projectID}`;


        var grapes_editor = grapesjs.init({
            container: '#gjs',
            fromElement: true,
            height: '100%',
            showOffsets: 1,
            noticeOnUnload: 0,
            storageManager: false,
            // storageManager: {
            //     type: 'remote',
            //     stepsBeforeSave: 3,
            //     options: {
            //       remote: {
            //         urlLoad: projectEndpoint,
            //         urlStore: projectEndpoint,
            //         // The `remote` storage uses the POST method when stores data but
            //         // the json-server API requires PATCH.
            //         fetchOptions: opts => (opts.method === 'POST' ?  { method: 'PATCH' } : {}),
            //         // As the API stores projects in this format `{id: 1, data: projectData }`,
            //         // we have to properly update the body before the store and extract the
            //         // project data from the response result.
            //         onStore: data => ({ id: projectID, data }),
            //         onLoad: result => result.data,
            //       }
            //     }
            //   },
            
            plugins: ['grapesjs-preset-webpage',"gjs-blocks-basic",'grapesjs-plugin-forms','grapesjs-custom-code','grapesjs-component-countdown','grapesjs-navbar','grapesjs-typed','grapesjs-tooltip','grapesjs-tabs'],
                pluginsOpts: {
                'grapesjs-preset-webpage': {},
                "gjs-blocks-basic": {},
                'grapes.js-plugin-forms':{},
                'grapesjs-custom-code': {},
                'grapesjs-component-countdown': {},
                'grapesjs-navbar': {},
                'grapesjs-typed': {},
                'grapesjs-tooltip': {},
                'grapesjs-tabs': {},
            },
            
          });
    });
    
      // Use the API
      const blockManager = grapes_editor.Blocks;
      blockManager.add('h1-block', {
      label: 'Heading',
      content: '<h1>Put your title here</h1>',
      category: 'Basic',
      attributes: {
          title: 'Insert h1 block'
      }
      });


    // tinymce.init({
    //     selector: 'textarea#tinymce',
    //     plugins: 'anchor autolink charmap codesample emoticons image link lists media searchreplace table visualblocks wordcount checklist mediaembed casechange export formatpainter pageembed linkchecker a11ychecker tinymcespellchecker permanentpen powerpaste advtable advcode editimage tinycomments tableofcontents footnotes mergetags autocorrect typography inlinecss',
    //     toolbar: 'undo redo | blocks fontfamily fontsize | bold italic underline strikethrough | link image media table mergetags | addcomment showcomments | spellcheckdialog a11ycheck typography | align lineheight | checklist numlist bullist indent outdent | emoticons charmap | removeformat',
    //     tinycomments_mode: 'embedded',
    //     tinycomments_author: 'Author name',
    //     mergetags_list: [{
    //             value: 'First.Name',
    //             title: 'First Name'
    //         },
    //         {
    //             value: 'Email',
    //             title: 'Email'
    //         },
    //     ]
    // });


});
