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

<div class="row" id="user-profile">
    <div class="col-lg-12">
        <div class="card">
            <div class="card-body">
                <div class="wideget-user">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-xl-6">
                            <div class="wideget-user-desc d-sm-flex">
                                <div class="wideget-user-img">
                                    <img class="" src="http://localhost/blogCd/resources/images/avatars/2.jpg"
                                        alt="img">
                                </div>
                                <div class="user-wrap">
                                    <h4>Admin</h4>
                                    <h6 class="text-muted mb-3">Member Since: November 2017</h6>
                                    <a href="javascript:void(0);" class="btn btn-primary mt-1 mb-1"><i
                                            class="fa fa-rss"></i> Follow</a>
                                    <a href="emailservices.html" class="btn btn-secondary mt-1 mb-1"><i
                                            class="fa fa-envelope"></i> E-mail</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12 col-md-12 col-xl-6">
                            <div class="text-xl-right mt-4 mt-xl-0">
                                <a href="emailservices.html" class="btn btn-white">Comments</a>
                                <a href="editprofile.html" class="btn btn-primary">Edit Blog</a>
                            </div>
                            <div class="mt-5">
                                <div class="main-profile-contact-list float-lg-end d-lg-flex">
                                    <div class="me-5">
                                        <div class="media">
                                            <div class="media-icon bg-primary  me-3 mt-1">
                                                <i class="fe fe-file-plus fs-20 text-white"></i>
                                            </div>
                                            <div class="media-body">
                                                <span class="text-muted">Blogs Published</span>
                                                <div class="fw-semibold fs-25">
                                                    34
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="me-5 mt-5 mt-md-0">
                                        <div class="media">
                                            <div class="media-icon bg-success me-3 mt-1">
                                                <i class="fe fe-users  fs-20 text-white"></i>
                                            </div>
                                            <div class="media-body">
                                                <span class="text-muted">Archived</span>
                                                <div class="fw-semibold fs-25">
                                                    6
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="me-0 mt-5 mt-md-0">
                                        <div class="media">
                                            <div class="media-icon bg-orange me-3 mt-1">
                                                <i class="fe fe-wifi fs-20 text-white"></i>
                                            </div>
                                            <div class="media-body">
                                                <span class="text-muted">Featured</span>
                                                <div class="fw-semibold fs-25">
                                                    10
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
            <div class="border-top">
                <div class="wideget-user-tab">
                    <div class="tab-menu-heading">
                        <div class="tabs-menu1">
                            <ul class="nav">
                                <li class=""><a href="#tab-51" class="active show" data-bs-toggle="tab">Blog Post</a>
                                </li>
                                <li><a href="#tab-61" data-bs-toggle="tab" class="">Meta Tags</a>
                                </li>
                                <!-- <li><a href="#tab-71" data-bs-toggle="tab" class="">All Blogs</a></li> -->
                                <li><a href="#tab-81" data-bs-toggle="tab" class="">Settings</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <form id="post-form" method="post">

            <div class="row">
                <div class="col-xl-8">
                    <!-- Blog posts  -->
                    <div class="tab-content">
                        <div class="tab-pane active show" id="tab-51">
                            <div id="profile-log-switch">
                                <div class="card">
                                    <div class="card-body">
                                        <h3>Fill out the form to create a blog post</h3>


                                        <div class="row">
                                            <div class="col-xl-12">
                                                <div class="card">
                                                    <div class="card-header">
                                                        <div class="card-title">Add New Post</div>
                                                    </div>
                                                    <div class="card-body">
                                                        <div class="form horizontal">

                                                            <div class="row mb-4">
                                                                <label for="inputName" class="col-md-3 form-label">
                                                                    Title:</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" class="form-control"
                                                                        id="post_title" placeholder="" name="post_title"
                                                                        required>
                                                                </div>
                                                            </div>

                                                            <div class="row mb-4">
                                                                <label for="inputName" class="col-md-3 form-label">
                                                                    Slug:</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" class="form-control" id="slug"
                                                                        placeholder="" name="slug" required>
                                                                </div>
                                                            </div>


                                                            <div class="row">
                                                                <label class="form-label mb-4">Post Content
                                                                    :</label>
                                                                <div class="mb-4">
                                                                    <textarea class="content" name="post_content"
                                                                        id="post_content" required></textarea>
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
                                                                name="meta_title" required>
                                                        </div>
                                                    </div>




                                                    <div class="row mb-4">
                                                        <label class="col-md-3 form-label">meta description :</label>
                                                        <div class="col-md-9">
                                                            <input type="text" id="meta_description"
                                                                class="form-control" name="meta_description" required>
                                                        </div>
                                                    </div>

                                                    <div class="row mb-4">
                                                        <label class="col-md-3 form-label">meta keywords :</label>
                                                        <div class="col-md-9">
                                                            <input type="text" id="meta_keywords" class="form-control"
                                                                placeholder="Write the keywords and add comma to add another"
                                                                name="meta_keywords" required>
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
                                                                            name="meta_canonical" value="1" checked>
                                                                        <span class="custom-control-label">Yes</span>
                                                                    </label>
                                                                    <label
                                                                        class="col-md-6 d-flex custom-control custom-radio">
                                                                        <input type="radio" class="custom-control-input"
                                                                            name="meta_canonical" value="0">
                                                                        <span class="custom-control-label">No</span>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>



                                                    <div class="row mb-4">
                                                        <label class="col-md-3 form-label">robots tags:</label>
                                                        <div class="col-md-4">
                                                            <select name="robots_tag_follow"
                                                                class="form-control form-select select2">
                                                                <option value="0">nofollow</option>
                                                                <option value="1">follow</option>
                                                            </select>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <select name="robots_tag_index"
                                                                class="form-control form-select select2">
                                                                <option value="0">noindex</option>
                                                                <option value="1">index</option>
                                                            </select>
                                                        </div>
                                                    </div>


                                                    <div class="row mb-4">
                                                        <label class="col-md-3 form-label">author:</label>
                                                        <div class="col-md-9">
                                                            <input type="text" id="author_tag" class="form-control"
                                                                name="author_tag" required>
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
                                                                                    name="og_url" required>
                                                                            </div>
                                                                            <div class="row mb-3">
                                                                                <label
                                                                                    class="col-md-4 form-label">og-type:</label>
                                                                                <input id="og-type-input" type="text"
                                                                                    class="col-md-8 form-control"
                                                                                    name="og_type" required>
                                                                            </div>
                                                                            <div class="row mb-3">
                                                                                <label
                                                                                    class="col-md-4 form-label">og-title:</label>
                                                                                <input id="og-title-input" type="text"
                                                                                    class="col-md-8 form-control"
                                                                                    name="og_title" required>
                                                                            </div>
                                                                            <div class="row mb-3">
                                                                                <label
                                                                                    class="col-md-4 form-label">og-description:</label>
                                                                                <input id="og-description-input"
                                                                                    type="text"
                                                                                    class="col-md-8 form-control"
                                                                                    name="og_description" required>
                                                                            </div>
                                                                            <div class="row mb-3">
                                                                                <label
                                                                                    class="col-md-4 form-label">og-image:</label>
                                                                                <input id="og-image-input" type="text"
                                                                                    class="col-md-8 form-control"
                                                                                    name="og_image" required>
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
                                                                                name="twitter_site" required>
                                                                        </div>
                                                                        <div class="row mb-3">
                                                                            <label
                                                                                class="col-md-4 form-label">twitter-title:</label>
                                                                            <input id="twitter-title-input" type="text"
                                                                                class="col-md-8 form-control"
                                                                                name="twitter_title" required>
                                                                        </div>
                                                                        <div class="row mb-3">
                                                                            <label
                                                                                class="col-md-4 form-label">twitter-description:</label>
                                                                            <input id="twitter-description-input"
                                                                                type="text"
                                                                                class="col-md-8 form-control"
                                                                                name="twitter_description" required>
                                                                        </div>
                                                                        <div class="row mb-3">
                                                                            <label
                                                                                class="col-md-4 form-label">twitter-image:</label>
                                                                            <input id="twitter-image-input" type="text"
                                                                                class="col-md-8 form-control"
                                                                                name="twitter_image" required>
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

                        <!-- All Blogs  -->
                        <!-- <div class="tab-pane" id="tab-71">
                        <div class="card">
                            <div class="card-body">
                                <h1>hello all blogs</h1>
                            </div>
                        </div>
                    </div> -->

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
                                    <select id="category" name="category" class="form-control form-select select2"
                                        data-bs-placeholder="Select Category">
                                        <option value="0" data-category-id="0">UnCategorised</option>
                                        <?php foreach ($categories as $category): ?>
                                        <option value="<?php echo $category->id; ?>"
                                            data-category-id="<?php echo $category->id; ?>">
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
                                    <select id="sub_category" name="sub_category"
                                        class="form-control form-select select2"
                                        data-bs-placeholder="Select Sub Category">
                                        <option value="0">UnSubcategorised</option>
                                        <?php foreach ($subcategories as $subcategory): ?>
                                        <option value="<?php echo $subcategory->id; ?>">
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
                                                <?php foreach ($tags as $tag): ?>
                                                <span class="tag" name="tags">
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
                                                        class="btn btn-primary btn-sm">Add </button>
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
                                    <select id="status" name="status" class="form-control form-select select2"
                                        data-bs-placeholder="Select Status">
                                        <option value="0">Draft</option>
                                        <option value="1">Published</option>
                                        <option value="2">Archived</option>
                                        <option value="3">Trash</option>
                                    </select>
                                </div>
                            </div>

                            <!-- Featured Blogs  -->
                            <div class="form-group">
                                <div class="form-label">Featured:</div>
                                <label class="custom-switch">
                                    <input id="featured" type="checkbox" name="featured" class="custom-switch-input"
                                        checked>
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
                                        <!-- <div class="row mb-2">
                                            <label class="col-md-5 form-label mb-4">File Upload:</label>
                                            <input class="col-md-7" type="file" name="featured_image"
                                                id="featured_image" accept=".jpg, .png, image/jpeg, image/png">
                                        </div> -->
                                        <div class="row mb-2">
                                            <label class="col-md-5 form-label mb-4">File Upload:</label>
                                            <input class="col-md-7 form-control" name="featured_image"
                                                id="featured_image">
                                        </div>

                                        <div class="row mb-2">
                                            <label class="col-md-5 form-label">alt tag:</label>
                                            <input type="text" class="col-md-7 form-control" id="featured_image_alt_tag"
                                                name="featured_image_alt_tag">

                                        </div>

                                        <div class="row mb-2">
                                            <label class="col-md-5 form-label">title:</label>
                                            <input type="text" class="col-md-7 form-control" id="featured_image_title"
                                                name="featured_image_title">

                                        </div>

                                        <div class="row mb-2">
                                            <label class="col-md-5 form-label">caption:</label>
                                            <input type="text" class="col-md-7 form-control" id="featured_image_caption"
                                                name="featured_image_caption">

                                        </div>

                                        <div class="row mb-2">
                                            <label class="col-md-5 form-label">description:</label>
                                            <input type="text" class="col-md-7 form-control"
                                                id="featured_image_description" name="featured_image_description">
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="card-footer">
                                <button type="submit" class="btn btn-primary"> Post </button>
                                <!-- <a href="javascript:void(0)" class="btn btn-primary">Post</a> -->
                                <a href="javascript:void(0)" class="btn btn-default float-end">Discard</a>
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

            var title = $('#post_title').val();
            var slug = $('#slug').val();
            var content = $('#post_content').val();
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
                url: '<?php echo site_url("blog/backend/post/saveFormData"); ?>',
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
            url: '<?php echo site_url("blog/backend/post/deletePost"); ?>',
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
</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script src="http://jqueryvalidation.org/files/dist/jquery.validate.min.js"></script>
<script src="http://jqueryvalidation.org/files/dist/additional-methods.min.js"></script>


<!-- <script src="../assets/plugins/wysiwyag/jquery.richtext.js"></script>
<script src="../assets/plugins/wysiwyag/wysiwyag.js"></script> -->












<!-- post_title
slug
post_content
meta_title
meta_description
meta_keywords
author_tag
og_url
og_type
og_title
og_description
og_image
twitter_site
twitter_title
twitter_description
twitter_image
category
sub_category
featured_image
featured_image_title
featured_image_alt_tag
featured_image_description
featured_image_caption -->