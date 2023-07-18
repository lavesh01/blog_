<style>
.cs-div {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    background-color: #f1f1f9;
}

.cs-menu {
    padding: 10px 15px;
}
</style>


<div class="card">
    <div class="card-body">
        <div class="row">
            <div class="col-xl-12">
                <div class="card-header">
                    <div class="card-title">Add menus
                    </div>
                </div>

                <div class="card-body">
                    <div class="row mb-4">

                        <div class="col-xl-8 mb-4">
                            <label for="menu" class="col-md-4 form-label">
                                Add new menu:</label>
                            <div class="input-group col-md-8">

                                <input type="text" class="form-control" id="menu" placeholder="" name="name">
                                <button id="add-menu-btn" type="button" class="btn btn-primary">Add</button>
                            </div>
                        </div>

                        <div class="col-xl-4">
                            <div id="menu-container">
                                <?php foreach ($menus as $menu): ?>
                                <div class="card cs-div" data-m-id="<?php echo $menu->m_id ?>">
                                    <div class="mr-auto cs-menu"><?php echo $menu->m_name; ?></div>
                                    <button type="button" class="btn btn-icon btn-danger delete-menu"
                                        data-m-id="<?php echo $menu->m_id ?>">
                                        <i class="fe fe-trash"></i>
                                    </button>
                                </div>
                                <?php endforeach; ?>
                            </div>
                        </div>


                    </div>
                </div>

            </div>
        </div>


    </div>
</div>


<script>
$(document).ready(function() {
    $('#add-menu-btn').click(function() {
        var menuName = $('#menu').val();

        $.ajax({
            url: '<?php echo base_url('blog/backend/menus/addMenu'); ?>',
            method: 'POST',
            data: {
                name: menuName
            },
            success: function(response) {
                var menu = JSON.parse(response);
                var m_name = menu.menu.m_name;
                var m_id = menu.menu.m_id;
                console.log(menu.menu);

                if (m_id && m_name) {
                    var menuElement =
                        '<div class="card cs-div" data-m-id="' +
                        m_id + '">' +
                        '<div class="mr-auto cs-menu">' + m_name + '</div>' +
                        '<button type="button" class="btn btn-icon btn-danger delete-menu" data-m-id="' +
                        m_id + '">' +
                        '<i class="fe fe-trash"></i>' +
                        '</button>' +
                        '</div>';
                    $('#menu-container').append(menuElement);
                }

            },
            error: function(xhr, status, error) {
                console.log(error);
            }
        });
    });
});


$(document).ready(function() {
    $(document).on('click', '.delete-menu', function() {
        var menuId = $(this).data('m-id');

        $.ajax({
            url: '<?php echo base_url('blog/backend/menus/deleteMenu'); ?>',
            method: 'POST',
            data: {
                menuId: menuId
            },
            success: function(response) {
                console.log(response);
                $('.card[data-m-id="' + menuId + '"]').remove();
            },
            error: function(xhr, status, error) {
                console.log(error);
            }
        });
    });
});
</script>