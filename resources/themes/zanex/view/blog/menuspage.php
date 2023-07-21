<style>
/* Hide the input fields with IDs branch-id-input, branch-parent-id-input, and branch-level-input */
#branch-id-input,
#branch-parent-id-input,
#branch-level-input {
    display: none;
}
</style>

<div class="row">
    <div class="col-xl-6">
        <div class="wrapper">
            <ul id="left-tree"></ul>
        </div>
    </div>


    <div class="col-xl-6">
        <div class="card">
            <div class="card-body">
                <div id="branch-details-container">
                    <h3>Branch Details</h3>

                    <div id="branch-details" class="mb-5">

                        <p><input class="form-control" type="text" id="branch-id-input">
                        </p>
                        <p><input class="form-control" type="text" id="branch-parent-id-input">
                        </p>
                        <p><input class="form-control" type="text" id="branch-level-input"></p>
                        <p><strong class="mb-3">Title:</strong> <input class="form-control" type="text"
                                id="branch-title-input"></p>

                        <div class="row">
                            <div class="input-group col-md-12 mb-5">

                                <select class="form-control" id="type" name="type">
                                    <option value="page">Pages</option>
                                    <!-- <option value="category">Categories</option> -->
                                </select>

                                <select class="form-control" id="pages" name="pages">
                                    <option value="">Search your page:</option>
                                    <option value="page-1">Page 1</option>
                                    <option value="page-2">Page 2</option>
                                    <option value="page-3">Page 3</option>
                                </select>


                                <input type="text" class="form-control" id="slug" placeholder="Enter the page url"
                                    name="slug">

                            </div>
                        </div>

                        <button id="edit-branch" class="btn btn-primary">Edit</button>
                        <button id="save-branch" class="btn btn-primary">Save</button>

                    </div>
                </div>
            </div>
        </div>

    </div>
</div>


<script>
const dataLeft = <?php echo json_encode($menuItems); ?>;

$(document).ready(function() {
    $('#pages').select2({
        placeholder: 'Search your page',
        allowClear: true,
    });
});
</script>