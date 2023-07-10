
<section id="decimal">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-content collapse show">
                    <div class="card-header-tab">
                        <div class="card-header">
                            <i class="header-icon pe-7s-menu icon-gradient bg-ripe-malin"> </i>
                            Role 
                        </div>
                        <?php if ($this->customer_id == 9999999) { ?>
                           <div class="btn-actions-pane-right text-capitalize">
                              <select class="form-control-sm form-control" id="customer_id_dropdwn">
                                <option></option>
                               <?php foreach($customers as $customer) { 
                                           echo  "<option value='".$customer["id"]."'>".$customer["value"]."</option>";
                                        }   ?>
          
                              </select>
                            </div>
                         <?php } ?>
                                
                    </div>
                    <div class="card-body card-dashboard">
                        <div class="table-responsive">
                            <div id="DataTables_Table_10_wrapper" class="dataTables_wrapper dt-bootstrap4">
                                <table class="table dataTable table-striped  no-footer compact hover dt-responsive wrap" id="datatable_dynamic" role="grid" aria-describedby="datatable_dynamic_info">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Description</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                              <?php 

                              foreach ($datatable as $key => $value) {
                                 echo '<tr role="row">';
                                 echo '<td class="sorting_1">'.$value[0].'</td>';
                                 echo '<td class="sorting_1">'.$value[1].'</td>';
                                 echo '<td class="sorting_1">'.$value[2].'</td>';
                                 echo '<td class="sorting_1"><input data-cid="'.$customerid.'" data-role="'.$value[4].'" data-permission="'.$value[0].'" class="form-check-input addpremission" type="checkbox" '.$value[3].'></td>';
                                 echo '</tr>';
                              }

                              ?>
                              </table>
                              </div></div></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

