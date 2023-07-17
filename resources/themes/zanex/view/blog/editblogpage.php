<style>
.tag {
    font-size: 0.75rem;
    color: #0d0c22;
    background-color: #f1f1f9;
    border-radius: 3px;
    padding: 0 0.5rem;
    line-height: 2em;
    display: -ms-inline-flexbox;
    display: inline-flex;
    cursor: default;
    font-weight: 400;
}
</style>

<?php
// Retrieve the post data from the $post variable passed from the controller
if ($post) {
    echo '<h2>Title: ' . $post->post_title . '</h2>';
} else {
    echo '<h1>Blog post not found!</h1>';
}
?>


<div class="row" id="user-profile">
    <div class="col-lg-12">
        <div class="card">

            <div class="border-top">
                <div class="wideget-user-tab">
                    <div class="tab-menu-heading">
                        <div class="tabs-menu1">
                            <ul class="nav">
                                <li class=""><a href="#tab-51" class="active show" data-bs-toggle="tab">Blog Post</a>
                                </li>
                                <li><a href="#tab-61" data-bs-toggle="tab" class="">Meta Tags</a>
                                </li>
                                <li><a href="#tab-81" data-bs-toggle="tab" class="">Settings</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <form id="post-form" method="put" action="<?php echo site_url('blog/backend/blogs/update'); ?>">

            <div class="row">
                <div class="col-xl-8">
                    <!-- Blog posts  -->
                    <div class="tab-content">
                        <div class="tab-pane active show" id="tab-51">
                            <div id="profile-log-switch">
                                <div class="card">
                                    <div class="card-body">
                                        <h3>Update the blog post</h3>


                                        <div class="row">
                                            <div class="col-xl-12">
                                                <div class="card">
                                                    <div class="card-header">
                                                        <div class="card-title">
                                                            Add New Post</div>
                                                    </div>
                                                    <div class="card-body">
                                                        <div class="form horizontal">

                                                            <div class="row mb-4">
                                                                <label for="inputName" class="col-md-3 form-label">
                                                                    Title:</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" class="form-control" id="title"
                                                                        placeholder=""
                                                                        value="<?php echo $post->post_title; ?>">
                                                                </div>
                                                            </div>

                                                            <div class="row mb-4">
                                                                <label for="inputName" class="col-md-3 form-label">
                                                                    Slug:</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" class="form-control" id="slug"
                                                                        placeholder=""
                                                                        value="<?php echo $post->slug; ?>">
                                                                </div>
                                                            </div>


                                                            <div class="row">
                                                                <label class="form-label mb-4">Post Content
                                                                    :</label>
                                                                <div class="mb-4">
                                                                    <textarea class="content" name="content"
                                                                        id="content"><?php echo $post->post_content; ?></textarea>
                                                                </div>
                                                            </div>


                                                        </div>


                                                    </div>

                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Meta tags  -->
                        <div class="tab-pane" id="tab-61">
                            <div class="card">
                                <div class="card-body">
                                    <h3>Fill out the form to post an Seo optimized blog!</h3>
                                    <div class="row">
                                        <div class="col-xl-12">
                                            <div class="card">
                                                <div class="card-header">
                                                    <div class="card-title">Add Seo to your post</div>
                                                </div>
                                                <div class="card-body">

                                                    <div class="row mb-4">
                                                        <label class="col-md-3 form-label">meta title :</label>
                                                        <div class="col-md-9">
                                                            <input type="text" id="meta_title" class="form-control"
                                                                value="<?php echo $post->meta_title; ?>">
                                                        </div>
                                                    </div>




                                                    <div class="row mb-4">
                                                        <label class="col-md-3 form-label">meta description :</label>
                                                        <div class="col-md-9">
                                                            <input type="text" id="meta_description"
                                                                class="form-control"
                                                                value="<?php echo $post->meta_description; ?>">
                                                        </div>
                                                    </div>

                                                    <div class="row mb-4">
                                                        <label class="col-md-3 form-label">meta keywords :</label>
                                                        <div class="col-md-9">
                                                            <input type="text" id="meta_keywords" class="form-control"
                                                                placeholder="Write the keywords and add comma to add another"
                                                                value="<?php echo $post->meta_keywords; ?>">
                                                        </div>
                                                    </div>

                                                    <div class="row mb-4">
                                                        <div class="col-md-3 form-label">Canonical Tags</div>
                                                        <div class="col-md-9 d-flex">
                                                            <div class="custom-controls-stacked">
                                                                <div class="d-flex">
                                                                    <label
                                                                        class="col-md-6 d-flex custom-control custom-radio">
                                                                        <input type="radio" class="custom-control-input"
                                                                            name="canonical_tags" value="1"
                                                                            <?php if ($post->meta_canonical == 1) echo 'checked'; ?>>
                                                                        <span class="custom-control-label">Yes</span>
                                                                    </label>
                                                                    <label
                                                                        class="col-md-6 d-flex custom-control custom-radio">
                                                                        <input type="radio" class="custom-control-input"
                                                                            name="canonical_tags" value="0"
                                                                            <?php if ($post->meta_canonical == 0) echo 'checked'; ?>>
                                                                        <span class="custom-control-label">No</span>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>



                                                    <div class="row mb-4">
                                                        <label class="col-md-3 form-label">robots tags:</label>
                                                        <div class="col-md-4">
                                                            <select name="follow"
                                                                class="form-control form-select select2">
                                                                <option value="0"
                                                                    <?php if ($post->robots_tag_follow == 0) echo 'selected'; ?>>
                                                                    nofollow
                                                                </option>
                                                                <option value="1"
                                                                    <?php if ($post->robots_tag_follow == 1) echo 'selected'; ?>>
                                                                    follow
                                                                </option>
                                                            </select>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <select name="index"
                                                                class="form-control form-select select2">
                                                                <option value="0"
                                                                    <?php if ($post->robots_tag_index == 0) echo 'selected'; ?>>
                                                                    noindex
                                                                </option>
                                                                <option value="1"
                                                                    <?php if ($post->robots_tag_index == 1) echo 'selected'; ?>>
                                                                    index
                                                                </option>
                                                            </select>
                                                        </div>
                                                    </div>


                                                    <div class="row mb-4">
                                                        <label class="col-md-3 form-label">author:</label>
                                                        <div class="col-md-9">
                                                            <input type="text" id="author_tag" class="form-control"
                                                                value="<?php echo $post->author_tag; ?>">
                                                        </div>
                                                    </div>


                                                    <div class="row mb-4">
                                                        <label class="form-label">Social tags:</label>
                                                        <div class="mb-5">
                                                            <div class="accordion-item">
                                                                <h2 class="accordion-header" id="facebooktags">
                                                                    <button class="accordion-button" type="button"
                                                                        data-bs-toggle="collapse"
                                                                        data-bs-target="#collapseOne"
                                                                        aria-expanded="true"
                                                                        aria-controls="collapseOne">
                                                                        Facebook opengraph tags:
                                                                    </button>
                                                                </h2>
                                                                <div id="collapseOne"
                                                                    class="accordion-collapse collapse show"
                                                                    aria-labelledby="facebooktags"
                                                                    data-bs-parent="#accordionExample">
                                                                    <div class="accordion-body">
                                                                        <div>
                                                                            <div class="row mb-3">
                                                                                <label
                                                                                    class="col-md-4 form-label">og-url:</label>
                                                                                <input id="og-url-input" type="text"
                                                                                    class="col-md-8 form-control"
                                                                                    value="<?php echo $post->og_url; ?>">
                                                                            </div>
                                                                            <div class="row mb-3">
                                                                                <label
                                                                                    class="col-md-4 form-label">og-type:</label>
                                                                                <input id="og-type-input" type="text"
                                                                                    class="col-md-8 form-control"
                                                                                    value="<?php echo $post->og_type; ?>">
                                                                            </div>
                                                                            <div class="row mb-3">
                                                                                <label
                                                                                    class="col-md-4 form-label">og-title:</label>
                                                                                <input id="og-title-input" type="text"
                                                                                    class="col-md-8 form-control"
                                                                                    value="<?php echo $post->og_title; ?>">
                                                                            </div>
                                                                            <div class="row mb-3">
                                                                                <label
                                                                                    class="col-md-4 form-label">og-description:</label>
                                                                                <input id="og-description-input"
                                                                                    type="text"
                                                                                    class="col-md-8 form-control"
                                                                                    value="<?php echo $post->og_description; ?>">
                                                                            </div>
                                                                            <div class="row mb-3">
                                                                                <label
                                                                                    class="col-md-4 form-label">og-image:</label>
                                                                                <input id="og-image-input" type="text"
                                                                                    class="col-md-8 form-control"
                                                                                    value="<?php echo $post->og_image; ?>">
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="">
                                                            <div class="accordion-item">
                                                                <h2 class="accordion-header" id="headingOne">
                                                                    <button class="accordion-button" type="button"
                                                                        data-bs-toggle="collapse"
                                                                        data-bs-target="#twittertags"
                                                                        aria-expanded="true"
                                                                        aria-controls="twittertags">
                                                                        Twitter card tags:
                                                                    </button>
                                                                </h2>
                                                                <div id="twittertags"
                                                                    class="accordion-collapse collapse show"
                                                                    aria-labelledby="twittertags"
                                                                    data-bs-parent="#accordionExample">
                                                                    <div class="accordion-body">
                                                                        <div class="row mb-3">
                                                                            <label
                                                                                class="col-md-4 form-label">twitter-site:</label>
                                                                            <input id="twitter-site-input" type="text"
                                                                                class="col-md-8 form-control"
                                                                                value="<?php echo $post->twitter_site; ?>">
                                                                        </div>
                                                                        <div class="row mb-3">
                                                                            <label
                                                                                class="col-md-4 form-label">twitter-title:</label>
                                                                            <input id="twitter-title-input" type="text"
                                                                                class="col-md-8 form-control"
                                                                                value="<?php echo $post->twitter_title; ?>">
                                                                        </div>
                                                                        <div class="row mb-3">
                                                                            <label
                                                                                class="col-md-4 form-label">twitter-description:</label>
                                                                            <input id="twitter-description-input"
                                                                                type="text"
                                                                                class="col-md-8 form-control"
                                                                                value="<?php echo $post->twitter_description; ?>">
                                                                        </div>
                                                                        <div class="row mb-3">
                                                                            <label
                                                                                class="col-md-4 form-label">twitter-image:</label>
                                                                            <input id="twitter-image-input" type="text"
                                                                                class="col-md-8 form-control"
                                                                                value="<?php echo $post->twitter_image; ?>">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>


                                                </div>

                                            </div>
                                        </div>



                                    </div>
                                </div>
                            </div>

                        </div>

                        <!-- Settings  -->
                        <div class="tab-pane" id="tab-81">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-xl-12">
                                            <div class="card">
                                                <div class="card-header">
                                                    <div class="card-title">Additional Info.</div>
                                                </div>
                                                <div class="card-body">

                                                    <div class="row mb-4">
                                                        <label class="col-md-3 form-label">created date :</label>
                                                        <div class="col-md-9">
                                                            <input type="text" id="created_date" class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="row mb-4">
                                                        <label class="col-md-3 form-label">created by :</label>
                                                        <div class="col-md-9">
                                                            <input type="text" id="created_by" class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="row mb-4">
                                                        <label class="col-md-3 form-label">modified date :</label>
                                                        <div class="col-md-9">
                                                            <input type="text" id="modified_date" class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="row mb-4">
                                                        <label class="col-md-3 form-label">modified by :</label>
                                                        <div class="col-md-9">
                                                            <input type="text" id="modified_by" class="form-control">
                                                        </div>
                                                    </div>

                                                </div>

                                            </div>
                                        </div>



                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>



                </div>

                <div class="col-xl-4">
                    <div class="card">
                        <div class="card-header">
                            <div class="card-title">More Info</div>
                        </div>
                        <div class="card-body">


                            <!-- Categories -->
                            <div class="row mb-4">
                                <label class="col-md-12 form-label">Category</label>
                                <div class="col-md-12">
                                    <select id="category" name="country" class="form-control form-select select2"
                                        data-bs-placeholder="Select Category">
                                        <option value="0" data-category-id="0">Uncategorised</option>
                                        <?php foreach ($categories as $category): ?>
                                        <option value="<?php echo $category->id; ?>"
                                            data-category-id="<?php echo $category->id; ?>"
                                            <?php if ($category->id == $post->category) echo 'selected'; ?>>
                                            <?php echo $category->category_name; ?>
                                        </option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                            </div>


                            <!-- Add New Category -->
                            <div class="row mb-4">
                                <div class="col-md-8">
                                    <div class="input-group">
                                        <input type="text" id="new-category-input" class="form-control form-control-sm"
                                            placeholder="Enter new category">
                                        <button id="add-category-btn" type="button"
                                            class="btn btn-primary btn-sm">Add</button>
                                    </div>
                                </div>
                            </div>


                            <!-- Sub Categroies  -->
                            <div class="row mb-4">
                                <label class="col-md-12 form-label">Sub Categories</label>
                                <div class="col-md-12">
                                    <select id="sub_category" name="country" class="form-control form-select select2"
                                        data-bs-placeholder="Select Sub Category">
                                        <option value="0">--Select--</option>
                                        <?php foreach ($subcategories as $subcategory): ?>
                                        <option value="<?php echo $subcategory->id; ?>"
                                            <?php if ($subcategory->id == $post->sub_category) echo 'selected'; ?>>
                                            <?php echo $subcategory->subcategory_name; ?>
                                        </option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                            </div>

                            <!-- Add New Sub Category -->
                            <div class="row mb-4">
                                <div class="col-md-8">
                                    <div class="input-group">
                                        <input type="text" id="new-sub-category-input"
                                            class="form-control form-control-sm" placeholder="Enter new subcategory">
                                        <button id="add-sub-category-btn" type="button"
                                            class="btn btn-primary btn-sm">Add</button>
                                    </div>
                                </div>
                            </div>


                            <!-- Tags  -->

                            <div class="row mb-4">
                                <label class="col-md-4 form-label">Tags</label>
                                <div class="">
                                    <div class="text-wrap">
                                        <div class="example">

                                            <div class="mb-2 tags" id="tags">
                                                <?php 
                                                    $tagArray = explode(",", $post->tags); 
                                                    foreach ($tagArray as $tag): 
                                                    ?>
                                                <span class="tag">
                                                    <?php echo $tag; ?>
                                                    <a href="javascript:void(0)" class="tag-addon delete-tag"><i
                                                            class="fe fe-x"></i></a>
                                                </span>
                                                <?php endforeach; ?>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="input-group">
                                                    <input type="text" id="tag-input-field"
                                                        class="form-control form-control-sm" placeholder="Add a tag">
                                                    <button id="add-tag-btn" type="button"
                                                        class="btn btn-primary btn-sm">Add</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>




                            <!-- Status -->
                            <div class="row mb-4">
                                <label class="col-md-4 form-label">Status</label>
                                <div class="col-md-8">
                                    <select id="status" name="country" class="form-control form-select select2"
                                        data-bs-placeholder="Select Status">
                                        <option value="0" <?php if ($post->status == 0) echo 'selected'; ?>>Draft
                                        </option>
                                        <option value="1" <?php if ($post->status == 1) echo 'selected'; ?>>Published
                                        </option>
                                        <option value="2" <?php if ($post->status == 2) echo 'selected'; ?>>Archived
                                        </option>
                                        <option value="3" <?php if ($post->status == 3) echo 'selected'; ?>>Trash
                                        </option>
                                    </select>
                                </div>
                            </div>

                            <!-- Featured Blogs  -->
                            <div class="form-group">
                                <div class="form-label">Featured:</div>
                                <label class="custom-switch">
                                    <input id="featured" type="checkbox" name="custom-switch-checkbox"
                                        class="custom-switch-input" <?php if ($post->featured == 1) echo 'checked'; ?>>
                                    <span class=" custom-switch-indicator"></span>
                                    <span class=" custom-switch-description">Do you want this blog to be in one of
                                        your
                                        featured blogs?</span>
                                </label>


                            </div>

                            <!-- Featured Image  -->
                            <div class="card card-collapsed">
                                <div class="card-header">
                                    <h3 class="card-title">Featured Image</h3>
                                    <div class="card-options">
                                        <a href="javascript:void(0);" class="card-options-collapse"
                                            data-bs-toggle="card-collapse"><i class="fe fe-chevron-up"></i></a>

                                    </div>
                                </div>
                                <div class="card-body">
                                    <div>
                                        <div class="row mb-2">
                                            <label class="col-md-5 form-label mb-4">File Upload:</label>
                                            <input class="col-md-7 form-control" id="featured_image"
                                                value="<?php echo $post->featured_image; ?>">
                                            <!-- <input class="col-md-7" type="file" name="files"
                                                accept=".jpg, .png, image/jpeg, image/png"> -->
                                        </div>

                                        <div class="row mb-2">
                                            <label class="col-md-5 form-label">alt tag:</label>
                                            <input type="text" class="col-md-7 form-control" id="featured_image_alt_tag"
                                                value="<?php echo $post->featured_image_alt_tag; ?>">

                                        </div>

                                        <div class="row mb-2">
                                            <label class="col-md-5 form-label">title:</label>
                                            <input type="text" class="col-md-7 form-control" id="featured_image_title"
                                                value="<?php echo $post->featured_image_title; ?>">

                                        </div>

                                        <div class="row mb-2">
                                            <label class="col-md-5 form-label">caption:</label>
                                            <input type="text" class="col-md-7 form-control" id="featured_image_caption"
                                                value="<?php echo $post->featured_image_caption; ?>">

                                        </div>

                                        <div class="row mb-2">
                                            <label class="col-md-5 form-label">description:</label>
                                            <input type="text" class="col-md-7 form-control"
                                                id="featured_image_description"
                                                value="<?php echo $post->featured_image_description; ?>">
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="card-footer">
                                <button id="update-btn" data-post-id="<?php echo $post->id; ?>" type="submit"
                                    class="btn btn-primary"> Update </button>
                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
</div>
</div>




<script>
$(document).ready(function() {

    const fileInput = document.getElementById('featured_image');
    const selectedFile = document.getElementById('selected_file');

    fileInput.addEventListener('change', function() {
        selectedFile.textContent = fileInput.files[0] ? fileInput.files[0].name : '';
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

});


$(document).ready(function() {

    $('#add-category-btn').click(function(e) {
        e.preventDefault();
        var categoryName = $('#new-category-input').val();


        $.ajax({
            url: '<?php echo site_url("blog/backend/post/saveCategory"); ?>',
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
            url: '<?php echo site_url("blog/backend/post/saveSubCategory"); ?>',
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
        var $form = $('#post-form');
        var $submitButton = $form.find('button[type="submit"]');
        e.preventDefault();
        var id = $(this).data('post-id');
        var url = 'http://localhost/blogCd/blog/backend/blogs/update/' + id;

        var post_title = $('#title').val();
        var slug = $('#slug').val();
        var post_content = $('#content').val();
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
            post_title: post_title,
            slug: slug,
            post_content: post_content,
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

        $.ajax({
            url: url,
            type: 'PUT',
            data: postData,
            success: function(response) {
                console.log(response);
            },
            error: function(xhr, status, error) {
                console.error(error);
            },
            complete: function() {
                $submitButton.prop('disabled', false).text('Update');
                alert("Post Updated Successfully!");
            }
        });
        console.log(postData);
    });
});
</script>