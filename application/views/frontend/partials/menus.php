<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?>
<!DOCTYPE html>
<html lang="en">
<!-- document code -->

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Document Code</title>

    <!-- Bootstrap Core CSS -->
    <link href="<?php echo base_url()?>assets/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <style>
    body {
        padding-top: 70px;
    }
    </style>

</head>

<body>

    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="<?php base_url()?>">Prishav Blogs</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <?php foreach ($dropdown as $key ): ?>
                    <?php if($key->menu_id!=$key->menu_item_id): ?>
                    <li>
                        <a href="<?php echo $key->m_url;?>"><?php echo $key->m_name;?></a>
                    </li>
                    <?php else: ?>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                            aria-expanded="false">
                            <?php echo $key->m_name; ?><span class="caret"></span>
                        </a>
                        <?php if ($key->is_category == 1): ?>
                        <ul class="dropdown-menu">
                            <?php foreach ($categories as $category): ?>
                            <li>
                                <a href="#"><?php echo $category->category_name; ?></a>
                            </li>
                            <?php endforeach; ?>
                        </ul>
                        <?php else: ?>
                        <ul class="dropdown-menu">
                            <?php foreach ($select as $list): ?>
                            <?php if ($key->menu_id == $list->m_id): ?>
                            <li>
                                <a
                                    href="<?php echo base_url() . $key->m_name ?>/<?php echo $list->m_item_name ?>"><?php echo $list->m_item_name; ?></a>
                            </li>
                            <?php endif; ?>
                            <?php endforeach; ?>
                        </ul>
                        <?php endif; ?>
                    </li>

                    <?php endif; ?>
                    <?php endforeach ?>

                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- jQuery Version 1.11.1 -->
    <script src="<?php echo base_url()?>assets/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="<?php echo base_url()?>assets/js/bootstrap.min.js"></script>

</body>

</html>