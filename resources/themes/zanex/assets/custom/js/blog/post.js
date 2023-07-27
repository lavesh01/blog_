

$(document).ready(function() {

    var grapes_editor = grapesjs.init({
        container: '#gjs',
        fromElement: true,
        height: '100%',
        showOffsets: 1,
        noticeOnUnload: 0,
          storageManager: {
            type: 'local', 
            autosave: true, 
            autoload: true, 
            stepsBeforeSave: 1, 
            options: {
              local: { 
                key: 'gjsProject', 
              },
            }
          },
        
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
      console.log(grapes_editor.getHtml());

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

      

    tinymce.init({
        selector: 'textarea#tinymce',
        plugins: 'anchor autolink charmap codesample emoticons image link lists media searchreplace table visualblocks wordcount checklist mediaembed casechange export formatpainter pageembed linkchecker a11ychecker tinymcespellchecker permanentpen powerpaste advtable advcode editimage tinycomments tableofcontents footnotes mergetags autocorrect typography inlinecss',
        toolbar: 'undo redo | blocks fontfamily fontsize | bold italic underline strikethrough | link image media table mergetags | addcomment showcomments | spellcheckdialog a11ycheck typography | align lineheight | checklist numlist bullist indent outdent | emoticons charmap | removeformat',
        tinycomments_mode: 'embedded',
        tinycomments_author: 'Author name',
        mergetags_list: [{
                value: 'First.Name',
                title: 'First Name'
            },
            {
                value: 'Email',
                title: 'Email'
            },
        ]
    });
    

    $('#gjs').hide();

    $('input[name="editor"]').on('click', function() {
        if ($(this).val() === '1') {
            $('.tox-tinymce').show();
            console.log("tinymce show");
            $('#gjs').hide();
        } else if ($(this).val() === '0') {
            $('.tox-tinymce').hide();
            console.log("tinymce hide");
            $('#gjs').show();
        }
    });

    $('#add-category-btn').click(function(e) {
        e.preventDefault();
        var categoryName = $('#new-category-input').val();


        $.ajax({
            url: "http://localhost/blogCd/blog/backend/post/saveCategory",
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
            url: 'http://localhost/blogCd/blog/backend/post/saveSubCategory',
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

    $('#add-tag-btn').click(function(e) {
        e.preventDefault();
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


    var $form = $('#post-form');

    var $submitButton = $form.find('button[type="submit"]');
    var $requiredInputs = $form.find(':input[required]');

    var rules = {
        // post_type: 'Please select the post type',
        post_title: 'Please enter a title.',
        slug: 'Please enter a slug.',
        post_content: 'Please enter the post content.',
        meta_title: 'required',
        meta_description: 'required',
        meta_keywords: 'required',
        meta_canonical: 'required',
        robots_tag_index: 'required',
        robots_tag_follow: 'required',
        author_tag: 'required',
        og_url: {
            required: true,
            url: true
        },
        og_type: 'required',
        og_title: 'required',
        og_description: 'required',
        og_image: 'required',
        twitter_site: 'required',
        twitter_title: 'required',
        twitter_description: 'required',
        twitter_image: 'required',
    };

    var messages = {
        // post_type: 'Pleace select a post_type',
        post_title: 'Please enter a title.',
        slug: 'Please enter a slug.',
        post_content: 'Please enter the post content.',
        meta_title: 'Please enter the meta title.',
        meta_description: 'Please enter the meta description.',
        meta_keywords: 'Please enter the meta keywords.',
        meta_canonical: 'Please enter the canonical tags.',
        robots_tag_index: 'Please select the robots tag index.',
        robots_tag_follow: 'Please select the robots tag follow.',
        author_tag: 'Please enter the author tag.',
        og_url: {
            required: 'Please enter the Open Graph URL.',
            url: 'Please enter a valid URL for the Open Graph URL.'
        },
        og_type: 'Please enter the Open Graph type.',
        og_title: 'Please enter the Open Graph title.',
        og_description: 'Please enter the Open Graph description.',
        og_image: 'Please enter the Open Graph image.',
        twitter_site: 'Please enter the Twitter site.',
        twitter_title: 'Please enter the Twitter title.',
        twitter_description: 'Please enter the Twitter description.',
        twitter_image: 'Please enter the Twitter image.',
    };

    $form.validate({
        rules: rules,
        messages: messages,
        submitHandler: function(form) {

            console.log('submitHandler executed');

            var post_type = $('input[name="post_type"]:checked').val();
            var title = $('#post_title').val();
            var slug = $('#slug').val();

            var editorValue = $('input[name="editor"]:checked').val();
            console.log(editorValue);

            var content;
            if (editorValue === '1') {
                content = tinymce.activeEditor.getContent();
            } else if (editorValue === '0') {
                
                    console.log(grapes_editor.getHtml());
                    console.log(grapes_editor.getCss());
                    
                content = grapes_editor.getHtml();
  
            }
            console.log(content);

            var metaTitle = $('#meta_title').val();
            var metaDescription = $('#meta_description').val();
            var metaKeywords = $('#meta_keywords').val();
            var canonicalTagsValue = $('input[name="meta_canonical"]:checked').val();
            var robotsTagIndex = $('select[name="robots_tag_index"]').val();
            var robotsTagFollow = $('select[name="robots_tag_follow"]').val();
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

            var formData = {
                post_type: post_type,
                post_title: title,
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
            console.log(formData);

            $submitButton.prop('disabled', true).text('Submitting...');

            $.ajax({
                url: "http://localhost/blogCd/blog/backend/post/saveFormData",
                type: 'POST',
                data: formData,
                dataType: 'json',
                success: function(response) {
                    console.log(response);

                    $form[0].reset();
                    $('.tag').empty();
                },
                error: function(xhr, status, error) {
                    console.log(error);
                },
                complete: function() {
                    $submitButton.prop('disabled', false).text('Post');
                    alert("Form Saved Successfully!")
                }
            });

            return false;
        }
    });


    $('.delete-post').click(function() {
        var postId = $(this).data('post-id');

        $.ajax({
            url: 'http://localhost/blogCd/blog/backend/post/deletePost',
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









