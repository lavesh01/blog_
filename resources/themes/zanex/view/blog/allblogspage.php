<div class="row row-sm">
    <div class="col-lg-12">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Your all blogs saved in the database</h3>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered text-nowrap border-bottom w-100" id="responsive-datatable">
                        <thead>
                            <tr>
                                <th class="wd-15p border-bottom-0">Blog id</th>
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
                                <td><?php echo $data->category; ?></td>
                                <td><?php echo $data->created_on; ?></td>
                                <td>
                                    <?php
                                        $statusText = '';
                                        switch ($data->status) {
                                            case 0:
                                                $statusText = 'Draft';
                                                break;
                                            case 1:
                                                $statusText = 'Published';
                                                break;
                                            case 2:
                                                $statusText = 'Archived';
                                                break;
                                            case 3:
                                                $statusText = 'Trash';
                                                break;
                                            default:
                                                $statusText = 'Unknown';
                                                break;
                                        }
                                        echo $statusText;
                                    ?>
                                </td>
                                <td>Edit</td>
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
</div>