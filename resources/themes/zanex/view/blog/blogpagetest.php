<style>
.custom-container {
    background-color: #ffffff;
    min-height: 100vh;
    padding: 30px;
}

h1 {
    margin-top: 20px;
    margin-bottom: 40px;
}

h3 {
    margin-top: 20px;
}

.div-form {
    background: #f0f1f7;
}

.featured-image-bar {
    background-color: #6259ca;
    color: white;
    width: 100%;
    padding: 10px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    cursor: pointer;
}

.featured-image-container {
    display: none;
    background-color: #f0f0f0;
    padding: 10px;
}

.expanded .featured-image-container {
    display: block;
}

.expanded {
    display: block;
}

.arrow-button {
    cursor: pointer;
}
</style>


<div class="container-fluid custom-container">
    <h1>Make your own Seo Optimized blog post!</h1>

    <div class="row">
        <div class="col-md-8">

            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a class="nav-link active" data-toggle="tab" href="#tab1">Create Blog post</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#tab2">Meta tags</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#tab3">Settings</a>
                </li>
            </ul>

            <div class="tab-content">

                <div id="tab1" class="tab-pane fade show active">
                    <h3>Fill out the form to create a blog post</h3>

                    <form class="div-form">
                        <div class="form-group">
                            <label for="title">Title</label>
                            <input type="text" class="form-control" id="title" name="title">
                        </div>
                        <div class="form-group">
                            <label for="slug">Slug</label>
                            <input type="text" class="form-control" id="slug" name="slug">
                        </div>
                        <div class="form-group">
                            <label for="content">Content</label>
                            <textarea class="form-control" id="content" name="content" rows="5"></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>

                <div id="tab2" class="tab-pane fade">
                    <h3>Fill out the form to have an Seo optimized blog!</h3>

                    <form class="div-form">
                        <div class="form-group d-flex">
                            <label for="meta_title">Meta Title : </label>
                            <input type="text" class="form-control" id="meta_title" name="meta_title">
                        </div>

                        <div class="form-group d-flex">
                            <label for="meta_description">Meta Description : </label>
                            <input type="text" class="form-control" id="meta_description" name="meta_description">
                        </div>
                        <div class="form-group d-flex">
                            <label for="meta_keywords">Meta Keywords : </label>
                            <input type="text" class="form-control" id="meta_keywords" name="meta_keywords">
                        </div>
                        <div class="form-group d-flex">
                            <label for="canonical">Canonical Tag : </label>
                            <div class="form-check d-flex">
                                <input class="form-check-input" type="radio" name="canonical" id="canonical_yes"
                                    value="yes" checked>
                                <label class="form-check-label" for="canonical_yes">
                                    Yes
                                </label>
                            </div>
                            <div class="form-check d-flex">
                                <input class="form-check-input" type="radio" name="canonical" id="canonical_no"
                                    value="no">
                                <label class="form-check-label" for="canonical_no">
                                    No
                                </label>
                            </div>
                        </div>
                        <div class="form-group d-flex">
                            <label for="robots">Robots Tag : </label>
                            <select class="form-control d-flex" id="robots_follow" name="robots_follow">
                                <option value="follow" selected>Follow</option>
                                <option value="nofollow">NoFollow</option>
                            </select>
                            <select class="form-control d-flex" id="robots_index" name="robots_index">
                                <option value="index" selected>Index</option>
                                <option value="noindex">NoIndex</option>
                            </select>
                        </div>
                        <div class="form-group d-flex">
                            <label for="author">Author Tag : </label>
                            <input type="text" class="form-control" id="author" name="author">
                        </div>

                        <div class="form-group">
                            <label>Social Tags: </label>
                            <div class="form-group">
                                <div class="featured-image-bar" onclick="toggleFacebookDetails()">
                                    <span>Facebook Tags</span>
                                    <button class="arrow-button">▼</button>
                                </div>
                                <div class="featured-image-container" id="facebookTagsContainer">
                                    <div class="form-group d-flex">
                                        <label for="og_url">og:url:</label>
                                        <input type="text" class="form-control" id="og_url" name="og_url">
                                    </div>
                                    <div class="form-group d-flex">
                                        <label for="og_type">og:type:</label>
                                        <input type="text" class="form-control" id="og_type" name="og_type">
                                    </div>
                                    <div class="form-group d-flex">
                                        <label for="og_title">og:title:</label>
                                        <input type="text" class="form-control" id="og_title" name="og_title">
                                    </div>
                                    <div class="form-group d-flex">
                                        <label for="og_description">og:description:</label>
                                        <input type="text" class="form-control" id="og_description"
                                            name="og_description">
                                    </div>
                                    <div class="form-group d-flex">
                                        <label for="og_image">og:image:</label>
                                        <input type="text" class="form-control" id="og_image" name="og_image">
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="form-group">
                            <div class="featured-image-bar" onclick="toggleTwitterDetails()">
                                <span>Twitter Tags</span>
                                <button class="arrow-button">▼</button>
                            </div>
                            <div class="featured-image-container" id="twitterTagsContainer">
                                <div class="form-group d-flex">
                                    <label for="twitter_site">twitter:site:</label>
                                    <input type="text" class="form-control" id="twitter_site" name="twitter_site">
                                </div>
                                <div class="form-group d-flex">
                                    <label for="twitter_title">twitter:title:</label>
                                    <input type="text" class="form-control" id="twitter_title" name="twitter_title">
                                </div>
                                <div class="form-group d-flex">
                                    <label for="twitter_description">twitter:description:</label>
                                    <input type="text" class="form-control" id="twitter_description"
                                        name="twitter_description">
                                </div>
                                <div class="form-group d-flex">
                                    <label for="twitter_image">twitter:image:</label>
                                    <input type="text" class="form-control" id="twitter_image" name="twitter_image">
                                </div>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>

                </div>

                <div id="tab3" class="tab-pane fade">
                    <h3>Tab 3 </h3>
                </div>

            </div>


        </div>

        <div class="col-md-4" style="min-height: 100vh;border-left: 1px solid black">
            <div class="nav">
                <form class="div-form">
                    <div class="form-row">

                        <div class="form-group col-md-12">
                            <label for="category">Category</label>
                            <div class="input-group">
                                <select class="form-control" id="category" name="category">
                                    <option value="category1">Category 1</option>
                                    <option value="category2">Category 2</option>
                                    <option value="category3">Category 3</option>
                                </select>

                                <input type="text" class="form-control" id="new_category" name="new_category"
                                    placeholder="Add new Category">
                                <div class="input-group-append">
                                    <button class="btn btn-primary" type="button" onclick="addCategory()">Add</button>
                                </div>

                            </div>
                        </div>



                        <div class="form-group col-md-12">
                            <label for="tags">Tags</label>
                            <div class="input-group">
                                <select class="form-control" id="tags" name="tags" multiple>
                                    <option value="tag1">Tag 1</option>
                                    <option value="tag2">Tag 2</option>
                                    <option value="tag3">Tag 3</option>
                                </select>

                                <input type="text" class="form-control" id="new_tag" name="new_tag"
                                    placeholder="Add new Tag">
                                <div class="input-group-append">
                                    <button class="btn btn-primary" type="button" onclick="addTag()">Add</button>
                                </div>
                            </div>
                        </div>


                        <div class="form-group col-md-12">
                            <label for="status">Status</label>
                            <select class="form-control" id="status" name="status">
                                <option value="draft" selected>Draft</option>
                                <option value="published">Published</option>
                                <option value="archived">Archived</option>
                                <option value="deleted">Deleted</option>
                            </select>
                        </div>

                        <div class="form-group col-md-12">
                            <label for="featured">Featured Blog</label>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="featured" id="featured_yes"
                                    value="yes">
                                <label class="form-check-label" for="featured_yes">Yes</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="featured" id="featured_no" value="no"
                                    checked>
                                <label class="form-check-label" for="featured_no">No</label>
                            </div>
                        </div>

                        <div class="form-group col-md-12">
                            <div class="featured-image-bar" onclick="toggleImageDetails()">
                                <span>Featured Image</span>
                                <button class="arrow-button">▼</button>
                            </div>
                            <div class="featured-image-container" id="featureImageContainer">
                                <label for="image_upload">Image:</label>
                                <input type="file" id="image_upload" name="image_upload">
                                <label for="alt">Alt text:</label>
                                <input type="text" class="form-control" id="alt" name="alt" placeholder="Alt Text">
                                <label for="title">Title:</label>
                                <input type="text" class="form-control" id="title" name="title" placeholder="Title">
                                <label for="caption">Caption:</label>
                                <input type="text" class="form-control" id="caption" name="caption"
                                    placeholder="Caption">
                                <label for="description">Description:</label>
                                <textarea class="form-control" id="description" name="description"
                                    placeholder="Description" rows="3"></textarea>
                            </div>
                        </div>


                    </div>
                </form>
            </div>

        </div>

    </div>

</div>

<script>
function toggleImageDetails() {
    console.log("inside funciton");
    var imageDetails = document.getElementById('featureImageContainer');
    imageDetails.classList.toggle('expanded');
}

function toggleFacebookDetails() {
    var facebookTagsContainer = document.getElementById('facebookTagsContainer');
    facebookTagsContainer.classList.toggle('expanded');
}

function toggleTwitterDetails() {
    var twitterTagsContainer = document.getElementById('twitterTagsContainer');
    twitterTagsContainer.classList.toggle('expanded');
}


function addCategory() {
    // Get the input value
    var newCategory = document.getElementById("new_category").value;

    // Get the category dropdown
    var categoryDropdown = document.getElementById("category");

    // Create a new option element
    var newOption = document.createElement("option");
    newOption.value = newCategory;
    newOption.text = newCategory;

    // Add the new option to the category dropdown
    categoryDropdown.add(newOption);

    // Clear the input field
    document.getElementById("new_category").value = "";
}

function addTag() {
    // Get the input value
    var newTag = document.getElementById("new_tag").value;

    // Get the tags dropdown
    var tagsDropdown = document.getElementById("tags");

    // Create a new option element
    var newOption = document.createElement("option");
    newOption.value = newTag;
    newOption.text = newTag;

    // Add the new option to the tags dropdown
    tagsDropdown.add(newOption);

    // Clear the input field
    document.getElementById("new_tag").value = "";
}
</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>