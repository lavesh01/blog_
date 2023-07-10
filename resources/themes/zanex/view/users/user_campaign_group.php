<div class="content-wrapper">
            <div class="content-detached content-right">
                <div class="content-body">
                    <section class="row all-contacts">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-head">
                                    <div class="card-header">
                                        <h4 class="card-title">All Contacts</h4>
                                        <div class="heading-elements mt-0">
                                            <span class="dropdown">
                                                <button id="btnSearchDrop1" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-warning dropdown-toggle dropdown-menu-right btn-sm"><i class="ft-download-cloud white"></i></button>
                                                <span aria-labelledby="btnSearchDrop1" class="dropdown-menu mt-1 dropdown-menu-right" x-placement="top-end" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(64px, -17px, 0px);">
                                                    <a href="#" class="dropdown-item"><i class="ft-upload"></i> Import</a>
                                                    <a href="#" class="dropdown-item"><i class="ft-download"></i> Export</a>
                                                    <a href="#" class="dropdown-item"><i class="ft-shuffle"></i> Find Duplicate</a>
                                                </span>
                                            </span>
                                            <button class="btn btn-default btn-sm"><i class="ft-settings white"></i></button>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-content">
                                    <div class="card-body">
                                        <!-- Task List table -->
                                        <button type="button" class="btn btn-sm btn-danger delete-all mb-1">Delete All</button>
                                        <div class="table-responsive">
                                            <div id="users-contacts_wrapper" class="dataTables_wrapper dt-bootstrap4"><div class="row"><div class="col-sm-12 col-md-6"><div class="dataTables_length" id="users-contacts_length"><label>Show <select name="users-contacts_length" aria-controls="users-contacts" class="custom-select custom-select-sm form-control form-control-sm"><option value="10">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select> entries</label></div></div><div class="col-sm-12 col-md-6"><div id="users-contacts_filter" class="dataTables_filter"><label>Search:<input type="search" class="form-control form-control-sm" placeholder="" aria-controls="users-contacts"></label></div></div></div><div class="row"><div class="col-sm-12"><table id="users-contacts" class="table table-white-space  row-grouping display no-wrap icheck table-middle text-center dataTable" role="grid" aria-describedby="users-contacts_info">
                                                <thead>
                                                    <tr role="row"><th class="sorting" tabindex="0" aria-controls="users-contacts" rowspan="1" colspan="1" aria-label="
                                                            
                                                                
                                                                
                                                            
                                                        : activate to sort column ascending" style="width: 21px;">
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" id="checkboxsmallall">
                                                                <label class="custom-control-label" for="checkboxsmallall"></label>
                                                            </div>
                                                        </th><th class="sorting" tabindex="0" aria-controls="users-contacts" rowspan="1" colspan="1" aria-sort="descending" aria-label="Name: activate to sort column ascending" style="width: 145px;">Name</th><th class="sorting" tabindex="0" aria-controls="users-contacts" rowspan="1" colspan="1" aria-label="Email: activate to sort column ascending" style="width: 151px;">Email</th><th class="sorting" tabindex="0" aria-controls="users-contacts" rowspan="1" colspan="1" aria-label="Phone: activate to sort column ascending" style="width: 87px;">Phone</th><th class="sorting" tabindex="0" aria-controls="users-contacts" rowspan="1" colspan="1" aria-label="Favorite: activate to sort column ascending" style="width: 53px;">Favorite</th><th class="sorting" tabindex="0" aria-controls="users-contacts" rowspan="1" colspan="1" aria-label="Actions: activate to sort column ascending" style="width: 101px;">Actions</th></tr>
                                                </thead>
                                                <tbody>
                                                     <td class="text-center">
                                                            <a class="email" href="mailto:email@example.com">alice@example.com</a>
                                                        </td>
                                                        <td class="phone">+658-254-256</td>
                                                        <td class="text-center">
                                                            <div class="favorite active" style="cursor: pointer;"><img alt="1" src="../../../app-assets/images/raty/star-on.png" title="Favorite"><input name="score" type="hidden" value="1"></div>
                                                        </td>
                                                        <td>
                                                            <a data-toggle="modal" data-target="#EditContactModal" class="primary edit mr-1"><i class="la la-pencil"></i></a>
                                                            <a class="danger delete mr-1"><i class="la la-trash-o"></i></a>
                                                            <span class="dropdown">
                                                                <a id="btnSearchDrop2" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" class="dropdown-toggle dropdown-menu-right"><i class="la la-ellipsis-v"></i></a>
                                                                <span aria-labelledby="btnSearchDrop2" class="dropdown-menu mt-1 dropdown-menu-right">
                                                                    <a data-toggle="modal" data-target="#EditContactModal" class="dropdown-item edit"><i class="ft-edit-2"></i>
                                                                        Edit</a>
                                                                    <a href="#" class="dropdown-item delete"><i class="ft-trash-2"></i> Delete</a>
                                                                    <a href="#" class="dropdown-item"><i class="ft-plus-circle primary"></i> Projects</a>
                                                                    <a href="#" class="dropdown-item"><i class="ft-plus-circle info"></i> Team</a>
                                                                    <a href="#" class="dropdown-item"><i class="ft-plus-circle warning"></i> Clients</a>
                                                                    <a href="#" class="dropdown-item"><i class="ft-plus-circle success"></i> Friends</a>
                                                                </span>
                                                            </span>
                                                        </td>
                                                    </tr></tbody>
                                                <tfoot>
                                                    <tr><th rowspan="1" colspan="1"></th><th rowspan="1" colspan="1">Name</th><th rowspan="1" colspan="1">Email</th><th rowspan="1" colspan="1">Phone</th><th rowspan="1" colspan="1">Favorite</th><th rowspan="1" colspan="1">Actions</th></tr>
                                                </tfoot>
                                            </table></div></div><div class="row"><div class="col-sm-12 col-md-5"><div class="dataTables_info" id="users-contacts_info" role="status" aria-live="polite">Showing 21 to 30 of 30 entries</div></div><div class="col-sm-12 col-md-7"><div class="dataTables_paginate paging_simple_numbers" id="users-contacts_paginate"><ul class="pagination"><li class="paginate_button page-item previous" id="users-contacts_previous"><a href="#" aria-controls="users-contacts" data-dt-idx="0" tabindex="0" class="page-link">Previous</a></li><li class="paginate_button page-item "><a href="#" aria-controls="users-contacts" data-dt-idx="1" tabindex="0" class="page-link">1</a></li><li class="paginate_button page-item "><a href="#" aria-controls="users-contacts" data-dt-idx="2" tabindex="0" class="page-link">2</a></li><li class="paginate_button page-item active"><a href="#" aria-controls="users-contacts" data-dt-idx="3" tabindex="0" class="page-link">3</a></li><li class="paginate_button page-item next disabled" id="users-contacts_next"><a href="#" aria-controls="users-contacts" data-dt-idx="4" tabindex="0" class="page-link">Next</a></li></ul></div></div></div></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>