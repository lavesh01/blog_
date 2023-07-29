<!-- <div class="row row-sm">
    <div class="col-lg-12">
        <div class="card">
            <div class="card-header d-flex justify-content-between">
                <h3 class="card-title">Your all blogs saved in the database</h3>
                <button class="btn btn-primary" id="create-post"> Create new Post </button>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered text-nowrap border-bottom w-100" id="responsive-datatable">
                        <thead>
                            <tr>
                                <th class="wd-15p border-bottom-0">Post id</th>
                                <th class="wd-30p border-bottom-0">Title</th>
                                <th class="wd-10p border-bottom-0">Category</th>
                                <th class="wd-10p border-bottom-0">Created on</th>
                                <th class="wd-15p border-bottom-0">Status</th>
                                <th class="wd-15p border-bottom-0">Edit</th>
                                <th class="wd-15p border-bottom-0">Delete</th>
                            </tr>
                        </thead>
                        <tbody id="posts-container">
                            <?php foreach ($form_data as $data): ?>
                            <tr id="post-<?php echo $data->id; ?>">
                                <td><?php echo $data->id; ?></td>
                                <td><?php echo $data->post_title; ?></td>
                                <td id="post-<?php echo $data->id; ?>">
                                    <?php echo $data->category_name; ?>
                                </td>

                                <td><?php echo $data->created_on; ?></td>
                                <td>
                                    <?php
                                        echo $data->status_type;
                                    ?>
                                </td>
                                <td> <button class="btn btn-primary edit-post" data-post-id="<?php echo $data->id; ?>">
                                        Edit </button> </td>
                                <td> <button class="btn btn-primary delete-post"
                                        data-post-id="<?php echo $data->id; ?>">Delete Post</button> </td>

                            </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div> -->


<!-- <div class="hidden modal fade" id="createPostModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content modal-content-demo">
            <div class="modal-header">
                <h4 class="modal-title">Create new Post</h4>
                <button aria-label="Close" class="btn-close" data-bs-dismiss="modal"><span
                        aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">
                <div class="row mb-3">

                    <label class="form-label col-md-3"> Title:</label>
                    <div class="col-md-9">
                        <input id="post_title" class="form-control"></input>
                    </div>

                </div>

                <div class="row mb-3">
                    <label class="form-label col-md-3"> Slug:</label>
                    <div class="col-md-9">
                        <input id="slug" class="form-control" disabled></input>
                    </div>
                </div>


                <div class="modal-footer">
                    <button class="btn btn-primary" id="confirm-create-post">Create</button>
                    <button class="btn btn-danger" data-bs-dismiss="modal">Discard</button>
                </div>
            </div>
        </div>
    </div>
</div> -->

<div class="row">

    <div class="col-md-12 col-lg-12 ">

        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-content collapse show">
                        <div class="card-header-tab">
                            <div class="card-header">
                                <i class="header-icon lnr-list icon-gradient bg-happy-itmeo"> </i>
                                Blogs
                            </div>

                        </div>
                        <div class="card-body  p-2">
                            <div class="table-responsive">
                                <div id="div_common_dataTable">
                                    <table id="blogs_dataTable"
                                        class="table table-hover table-striped  sourced-data dataTable">
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>