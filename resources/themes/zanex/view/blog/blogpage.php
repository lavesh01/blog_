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

<!-- <div id="posts-container">
    <?php foreach ($form_data as $data): ?>
    <div id="post-<?php echo $data->id; ?>">
        <h2><?php echo $data->id; ?></h2>
        <h2><?php echo $data->post_title; ?></h2>
        <p><?php echo $data->slug; ?></p>
        <p><?php echo $data->post_content; ?></p>
        <button class="btn btn-primary delete-post" data-post-id="<?php echo $data->id; ?>">Delete Post</button>

    </div>
    <?php endforeach; ?>
</div> -->

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

        <form id="post-form" method="post" action='<?php echo site_url("blog/backend/post/saveFormData"); ?>'>
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
                                                                    <input type="text" class="form-control" id="title"
                                                                        placeholder="">
                                                                </div>
                                                            </div>

                                                            <div class="row mb-4">
                                                                <label for="inputName" class="col-md-3 form-label">
                                                                    Slug:</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" class="form-control" id="slug"
                                                                        placeholder="">
                                                                </div>
                                                            </div>


                                                            <div class="row">
                                                                <label class="form-label mb-4">Post Content
                                                                    :</label>
                                                                <div class="mb-4">
                                                                    <textarea class="content" name="content"
                                                                        id="content"></textarea>
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
                                                            <input type="text" id="meta_title" class="form-control">
                                                        </div>
                                                    </div>




                                                    <div class="row mb-4">
                                                        <label class="col-md-3 form-label">meta description :</label>
                                                        <div class="col-md-9">
                                                            <input type="text" id="meta_description"
                                                                class="form-control">
                                                        </div>
                                                    </div>

                                                    <div class="row mb-4">
                                                        <label class="col-md-3 form-label">meta keywords :</label>
                                                        <div class="col-md-9">
                                                            <input type="text" id="meta_keywords" class="form-control"
                                                                placeholder="Write the keywords and add comma to add another">
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
                                                                            name="canonical_tags" value="1" checked>
                                                                        <span class="custom-control-label">Yes</span>
                                                                    </label>
                                                                    <label
                                                                        class="col-md-6 d-flex custom-control custom-radio">
                                                                        <input type="radio" class="custom-control-input"
                                                                            name="canonical_tags" value="0">
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
                                                                <option value="0">follow</option>
                                                                <option value="1">nofollow</option>
                                                            </select>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <select name="index"
                                                                class="form-control form-select select2">
                                                                <option value="0">index</option>
                                                                <option value="1">noindex</option>
                                                            </select>
                                                        </div>
                                                    </div>


                                                    <div class="row mb-4">
                                                        <label class="col-md-3 form-label">author:</label>
                                                        <div class="col-md-9">
                                                            <input type="text" id="author_tag" class="form-control">
                                                        </div>
                                                    </div>


                                                    <!-- <div class="row mb-4">
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
                                                                                <input type="text"
                                                                                    class="col-md-8 form-control">
                                                                            </div>
                                                                            <div class="row mb-3">
                                                                                <label
                                                                                    class="col-md-4 form-label">og-type:</label>
                                                                                <input type="text"
                                                                                    class="col-md-8 form-control">
                                                                            </div>
                                                                            <div class="row mb-3">
                                                                                <label
                                                                                    class="col-md-4 form-label">og-title:</label>
                                                                                <input type="text"
                                                                                    class="col-md-8 form-control">
                                                                            </div>
                                                                            <div class="row mb-3">
                                                                                <label
                                                                                    class="col-md-4 form-label">og-description:</label>
                                                                                <input type="text"
                                                                                    class="col-md-8 form-control">
                                                                            </div>
                                                                            <div class="row mb-3">
                                                                                <label
                                                                                    class="col-md-4 form-label">og-image:</label>
                                                                                <input type="text"
                                                                                    class="col-md-8 form-control">
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
                                                                            <input type="text"
                                                                                class="col-md-8 form-control">
                                                                        </div>
                                                                        <div class="row mb-3">
                                                                            <label
                                                                                class="col-md-4 form-label">twitter-title:</label>
                                                                            <input type="text"
                                                                                class="col-md-8 form-control">
                                                                        </div>
                                                                        <div class="row mb-3">
                                                                            <label
                                                                                class="col-md-4 form-label">twitter-description:</label>
                                                                            <input type="text"
                                                                                class="col-md-8 form-control">
                                                                        </div>
                                                                        <div class="row mb-3">
                                                                            <label
                                                                                class="col-md-4 form-label">twitter-image:</label>
                                                                            <input type="text"
                                                                                class="col-md-8 form-control">
                                                                        </div>


                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div> -->


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
                                                                                    class="col-md-8 form-control">
                                                                            </div>
                                                                            <div class="row mb-3">
                                                                                <label
                                                                                    class="col-md-4 form-label">og-type:</label>
                                                                                <input id="og-type-input" type="text"
                                                                                    class="col-md-8 form-control">
                                                                            </div>
                                                                            <div class="row mb-3">
                                                                                <label
                                                                                    class="col-md-4 form-label">og-title:</label>
                                                                                <input id="og-title-input" type="text"
                                                                                    class="col-md-8 form-control">
                                                                            </div>
                                                                            <div class="row mb-3">
                                                                                <label
                                                                                    class="col-md-4 form-label">og-description:</label>
                                                                                <input id="og-description-input"
                                                                                    type="text"
                                                                                    class="col-md-8 form-control">
                                                                            </div>
                                                                            <div class="row mb-3">
                                                                                <label
                                                                                    class="col-md-4 form-label">og-image:</label>
                                                                                <input id="og-image-input" type="text"
                                                                                    class="col-md-8 form-control">
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
                                                                                class="col-md-8 form-control">
                                                                        </div>
                                                                        <div class="row mb-3">
                                                                            <label
                                                                                class="col-md-4 form-label">twitter-title:</label>
                                                                            <input id="twitter-title-input" type="text"
                                                                                class="col-md-8 form-control">
                                                                        </div>
                                                                        <div class="row mb-3">
                                                                            <label
                                                                                class="col-md-4 form-label">twitter-description:</label>
                                                                            <input id="twitter-description-input"
                                                                                type="text"
                                                                                class="col-md-8 form-control">
                                                                        </div>
                                                                        <div class="row mb-3">
                                                                            <label
                                                                                class="col-md-4 form-label">twitter-image:</label>
                                                                            <input id="twitter-image-input" type="text"
                                                                                class="col-md-8 form-control">
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
                                    <h1>settings</h1>
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

                            <!-- Categroies  -->
                            <!-- <div class="row mb-4">
                                <label class="col-md-4 form-label">Category</label>
                                <div class="col-md-8">
                                    <select id="category" name="country" class="form-control form-select select2"
                                        data-bs-placeholder="Select Category">
                                        <option value="0">--Select--</option>
                                        <option value="1">Technology</option>
                                        <option value="2">Travel</option>
                                        <option value="3">Food</option>
                                        <option value="4">Fashion</option>
                                    </select>
                                </div>
                            </div> -->

                            <!-- Categories -->
                            <div class="row mb-4">
                                <label class="col-md-4 form-label">Category</label>
                                <div class="col-md-8">
                                    <select id="category" name="country" class="form-control form-select select2"
                                        data-bs-placeholder="Select Category">
                                        <option value="0">--Select--</option>
                                        <option value="1">Technology</option>
                                        <option value="2">Travel</option>
                                        <option value="3">Food</option>
                                        <option value="4">Fashion</option>
                                    </select>
                                </div>
                            </div>

                            <!-- Add New Category -->
                            <div class="row mb-4">
                                <label class="col-md-4 form-label">Add New Category</label>
                                <div class="col-md-8">
                                    <div class="input-group">
                                        <input type="text" id="new-category-input" class="form-control"
                                            placeholder="Enter new category">
                                        <button id="add-category-btn" class="btn btn-primary">Add</button>
                                    </div>
                                </div>
                            </div>


                            <!-- Sub Categroies  -->
                            <div class="row mb-4">
                                <label class="col-md-4 form-label">Sub Categories</label>
                                <div class="col-md-8">
                                    <select id="sub_category" name="country" class="form-control form-select select2"
                                        data-bs-placeholder="Select Sub Category">
                                        <option value="0">--Select--</option>
                                        <option value="1">Technology</option>
                                        <option value="2">Travel</option>
                                        <option value="3">Food</option>
                                        <option value="4">Fashion</option>
                                    </select>
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
                                                <span class="tag">
                                                    <?php echo $tag; ?>
                                                    <a href="javascript:void(0)" class="tag-addon delete-tag"><i
                                                            class="fe fe-x"></i></a>
                                                </span>
                                                <?php endforeach; ?>
                                            </div>
                                            <div class="row tag-input">
                                                <input type="text" id="tag-input-field"
                                                    class="col-md-6 mr-10 form-control" style="margin-right: 5px;"
                                                    placeholder="Add a tag">
                                                <button id="add-tag-btn" class="col-md-4 btn btn-primary">Add
                                                    Tag</button>
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
                                    <input id="featured" type="checkbox" name="custom-switch-checkbox"
                                        class="custom-switch-input">
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
                                            <label class="col-md-4 form-label mb-4">File Upload:</label>
                                            <input class="col-md-8" type="file" name="files" id="featured_image"
                                                accept=".jpg, .png, image/jpeg, image/png">
                                        </div>

                                        <div class="row mb-2">
                                            <label class="col-md-4 form-label">alt tag:</label>
                                            <input type="text" class="col-md-8 form-control"
                                                id="featured_image_alt_tag">

                                        </div>

                                        <div class="row mb-2">
                                            <label class="col-md-4 form-label">title:</label>
                                            <input type="text" class="col-md-8 form-control" id="featured_image_title">

                                        </div>

                                        <div class="row mb-2">
                                            <label class="col-md-4 form-label">caption:</label>
                                            <input type="text" class="col-md-8 form-control"
                                                id="featured_image_caption">

                                        </div>

                                        <div class="row mb-2">
                                            <label class="col-md-4 form-label">description:</label>
                                            <input type="text" class="col-md-8 form-control"
                                                id="featured_image_description">
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
    $('#add-category-btn').click(function() {
        var newCategory = $('#new-category-input').val().trim();

        if (newCategory !== '') {
            var selectDropdown = $('#category');
            var optionElement = $('<option></option>').attr('value', newCategory).text(newCategory);

            selectDropdown.append(optionElement);
            selectDropdown.val(newCategory);

            $('#new-category-input').val('');
        }
    });
});

$(document).ready(function() {
    // Add Tag Button
    $('#add-tag-btn').click(function() {
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

    // Delete Tag Button
    $(document).on('click', '.delete-tag', function() {
        $(this).parent('.tag').remove();
    });
});

$(document).ready(function() {

    $('#post-form').submit(function(e) {
        e.preventDefault();

        var ogUrl = $('#og-url-input').val();
        var ogType = $('#og-type-input').val();
        var ogTitle = $('#og-title-input').val();
        var ogDescription = $('#og-description-input').val();
        var ogImage = $('#og-image-input').val();
        var twitterSite = $('#twitter-site-input').val();
        var twitterTitle = $('#twitter-title-input').val();
        var twitterDescription = $('#twitter-description-input').val();
        var twitterImage = $('#twitter-image-input').val();

        // Create an object with the data
        var socialTagsData = {
            og_url: ogUrl,
            og_type: ogType,
            og_title: ogTitle,
            og_description: ogDescription,
            og_image: ogImage,
            twitter_site: twitterSite,
            twitter_title: twitterTitle,
            twitter_description: twitterDescription,
            twitter_image: twitterImage
        };

        // Send the AJAX request
        $.ajax({
            url: '<?php echo site_url("blog/backend/post/saveSocialTags"); ?>',
            type: 'POST',
            data: socialTagsData,
            success: function(response) {
                console.log(response);
                $('#posts-container').append(response);
            },
            error: function(xhr, status, error) {
                console.log(error);
            }
        });

        console.log('social_tags:', socialTagsData);

    });



    $('#post-form').submit(function(e) {
        e.preventDefault();

        var title = $('#title').val();
        var slug = $('#slug').val();
        var content = $('#content').val();
        var metaTitle = $('#meta_title').val();
        var metaDescription = $('#meta_description').val();
        var metaKeywords = $('#meta_keywords').val();
        var canonicalTagsValue = $('input[name="canonical_tags"]:checked').val();
        var robotsTagIndex = $('select[name="index"]').val();
        var robotsTagFollow = $('select[name="follow"]').val();
        var authorTag = $('#author_tag').val();
        var socialTags = $('#social_tags').val();
        var category = $('#category').val();
        var subCategory = $('#sub_category').val();

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

        $.ajax({
            url: '<?php echo site_url("blog/backend/post/saveFormData"); ?>',
            type: 'POST',
            data: {
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
                social_tags: 1101,
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
            },
            success: function(response) {
                console.log(response);
                $('#posts-container').append(response);
            },
            error: function(xhr, status, error) {
                console.log(error);
            }
        });

        // Debugging console.log statements
        console.log('post_title:', title);
        console.log('slug:', slug);
        console.log('post_content:', content);
        console.log('meta_title:', metaTitle);
        console.log('meta_description:', metaDescription);
        console.log('meta_keywords:', metaKeywords);
        console.log('canonical tags:', canonicalTagsValue);
        console.log('robots tag follow:', robotsTagIndex);
        console.log('robots tag index:', robotsTagFollow);
        console.log('author_tag:', authorTag);
        console.log('category:', category);
        console.log('sub_category:', subCategory);
        console.log('tags:', tags);
        console.log('status:', status);
        console.log('featured:', featured);
        console.log('featured_image:', featuredImage);
        console.log('featured_image_title:', featuredImageTitle);
        console.log('featured_image_alt_tag:', featuredImageAltTag);
        console.log('featured_image_description:', featuredImageDescription);
        console.log('featured_image_caption:', featuredImageCaption);

    });
});





$(document).ready(function() {
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



<!-- <script src="../assets/plugins/wysiwyag/jquery.richtext.js"></script>
<script src="../assets/plugins/wysiwyag/wysiwyag.js"></script> -->