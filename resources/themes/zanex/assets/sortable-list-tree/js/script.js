let $leftTree; 
let leftSortable; 

$(document).ready(function () {   
    const leftTreeId = '#left-tree';
      
    leftSortable = new TreeSortable({
        treeSelector: leftTreeId,
    });

    $leftTree = $(leftTreeId);
    const $content = dataLeft.map(leftSortable.createBranch);
    $leftTree.html($content);
    leftSortable.run();

    const delay = () => {
        return new Promise(resolve => {
            setTimeout(() => {
                resolve();
            }, 1000);
        });
    };

    leftSortable.onSortCompleted(async (event, ui) => {
        await delay();
        console.log('left tree', ui.item);
        const $sortedBranch = ui.item;
        const id = $sortedBranch.data('id');
        const parent = $sortedBranch.data('parent');
        const level = $sortedBranch.data('level');

        const order = menuOrder();

        const url = 'http://localhost/blogCd/blog/backend/menus/update_branch';
        const data = { id: id, parent_id: parent, level: level, order: order };
        console.log(data);
        $.ajax({
            url: url,
            method: 'PUT',
            data: data,
            success: function (response) {
                console.log(response);
            },
            error: function (xhr, status, error) {
                console.log(error);
            }
        });
    
    });

    leftSortable.addListener('click', '.add-child', function (event, instance) {
        event.preventDefault();
        instance.addChildBranch($(event.target));
        
    });

    leftSortable.addListener('click', '.add-sibling', function (event, instance) {
        event.preventDefault();
        instance.addSiblingBranch($(event.target));

    });

    leftSortable.addListener('click', '.remove-branch', function (event, instance) {
        event.preventDefault();

        const confirm = window.confirm('Are you sure you want to delete this branch?');
        if (!confirm) {
            return;
        }
        const $branch = $(event.target).closest('li');
        const branchData = $branch.data();
        removeBranch(branchData);
        instance.removeBranch($branch);
    });


    $leftTree.on('click', '.branch-title', function () {
        const $branchTitle = $(this);
        const title = $branchTitle.text().trim();
        const $branch = $branchTitle.closest('li');
        const branchData = $branch.data();

        $.ajax({
            url: 'http://localhost/blogCd/blog/backend/menus/get_menu_items',
            method: 'POST',
            data: { id: branchData.id }, 
            success: function (response) {
                console.log(response);
                if (response) {
                    const menuData = JSON.parse(response);
                    
                    let data = {
                        slug: menuData.slug, type: menuData.type, selected_type: menuData.selected_type
                    }
                   
                    showBranchDetails(branchData, title, data );

                } else {
                    console.error(response.message);
                }
            },
            error: function (xhr, status, error) {
                console.log(error);
                showBranchDetails(branchData, title);
            }
        });


        
    });

    $('#edit-branch').on('click', function () {
        editBranchDetails(); 
    });

    $('#save-branch').on('click',function () {
        saveNewBranch();
    })

    tippy('[data-tippy-content]');
});


function showBranchDetails(branchData,title,data) {
    console.log(branchData);
    $('#branch-id-input').val(branchData.id);
    $('#branch-parent-id-input').val(branchData.parent);
    $('#branch-level-input').val(branchData.level);
    $('#branch-title-input').val(title);

    if (data.type) {
        $('#type').val(data.type);
    }
     const pagesDropdown = $('#pages');
     const selectedTypeValue = data.selected_type;
 
     if (!pagesDropdown.find(`option[value="${selectedTypeValue}"]`).length) {
         const newOption = new Option(selectedTypeValue, selectedTypeValue, true, true);
         pagesDropdown.append(newOption).trigger('change');
     }
      pagesDropdown.val(selectedTypeValue).trigger('change');
     
    $('#slug').val(data.slug);

    $('#branch-details-container').show();
}

function menuOrder(){
    var listItems = $("#left-tree").find("li");

    listItems.each(function(index, listItem) {
        console.log($(listItem).attr('data-id'));
    });

    var dataIdString = "";

    listItems.each(function(index, listItem) {
    
        dataIdString += $(listItem).attr('data-id') + ", ";
    });

    dataIdString = dataIdString.slice(0, -2);
    return dataIdString;
}

function editBranchDetails() {
    const id = $('#branch-id-input').val();
    const title = $('#branch-title-input').val();
    const parent_id = $('#branch-parent-id-input').val();
    const level = $('#branch-level-input').val();
    const type = $('#type').val(); 
    const selected_type = $('#pages').val(); 
    const slug = $('#slug').val(); 

    const order = menuOrder();

    const url = 'http://localhost/blogCd/blog/backend/menus/update_branch';
    const data = { id, parent_id, level, title ,order, type, selected_type, slug};
    console.log(data);
    $.ajax({
        url: url,
        method: 'PUT',
        data: data,
        success: function (response) {
            console.log(response);
            updateTreeBranch(data);
        },
        error: function (xhr, status, error) {
            console.log(error);
        }
    });
}

function updateTreeBranch(branchData) {
    const $branch = $leftTree.find(`li[data-id="${branchData.id}"]`);
    const $branchTitle = $branch.find('.branch-title');
    $branchTitle.text(branchData.title);
    $branch.data(branchData);
}

function saveNewBranch() {
    const id = $('#branch-id-input').val();
    const parent_id = $('#branch-parent-id-input').val();
    const level = $('#branch-level-input').val();
    const title = $('#branch-title-input').val();
    const order = menuOrder();
    const type = $('#type').val(); 
    const selected_type = $('#pages').val(); 
    const slug = $('#slug').val(); 

    const url = 'http://localhost/blogCd/blog/backend/menus/save_branch';
    const data = { id, parent_id, level, title ,order, type, selected_type, slug};

    $.ajax({
        url: url,
        method: 'POST',
        data: data,
        success: function (response) {
            console.log(response.title == 'Saved Branch') ;

            if(response.title == 'Saved Branch')  {

                const $branch = $(`li[data-id="${id}"]`);
                $branch.data('parent', parent_id);
                $branch.data('level', level);
                $branch.data('order', order);
                
                const $branchTitle = $branch.find('.branch-title');
                $branchTitle.text(title);
                
                alert('Branch data saved successfully');
            }else{
                console.error(response);
                alert(response);
            }
        },
        error: function (xhr, status, error) {
            console.log(error);
        }
    });
}

function removeBranch(branchData) {
    const id = branchData.id;

    const url = 'http://localhost/blogCd/blog/backend/menus/remove_branch';
    const data = { id };
    $.ajax({
        url: url,
        method: 'POST',
        data: data,
        success: function (response) {
            console.log(response);
        },
        error: function (xhr, status, error) {
            console.log(error);
        }
    });
}
    











