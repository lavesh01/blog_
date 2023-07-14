<div id="posts-container">
    <?php foreach ($form_data as $data): ?>
    <div id="post-<?php echo $data->id; ?>">
        <h2><?php echo $data->id; ?></h2>
        <h2><?php echo $data->post_title; ?></h2>
        <p><?php echo $data->slug; ?></p>
        <p><?php echo $data->post_content; ?></p>
        <p>Meta Title: <?php echo $data->meta_title; ?></p>
        <p>Meta Description: <?php echo $data->meta_description; ?></p>
        <p>Meta Keywords: <?php echo $data->meta_keywords; ?></p>
        <p>Meta Canonical: <?php echo $data->meta_canonical == 1 ? 'Yes' : 'No'; ?></p>
        <p>Robots Tag Index: <?php echo $data->robots_tag_index == 1 ? 'Index' : 'Noindex'; ?></p>
        <p>Robots Tag Follow: <?php echo $data->robots_tag_follow == 1 ? 'Follow' : 'Nofollow'; ?></p>
        <p>Author Tag: <?php echo $data->author_tag; ?></p>
        <p>OG URL: <?php echo $data->og_url; ?></p>
        <p>OG Type: <?php echo $data->og_type; ?></p>
        <p>OG Title: <?php echo $data->og_title; ?></p>
        <p>OG Description: <?php echo $data->og_description; ?></p>
        <p>OG Image: <?php echo $data->og_image; ?></p>
        <p>Twitter Site: <?php echo $data->twitter_site; ?></p>
        <p>Twitter Title: <?php echo $data->twitter_title; ?></p>
        <p>Twitter Description: <?php echo $data->twitter_description; ?></p>
        <p>Twitter Image: <?php echo $data->twitter_image; ?></p>
        <div id="post-<?php echo $data->id; ?>">
            <p>Category: <?php echo $data->category_name; ?></p>
        </div>
        <div id="post-<?php echo $data->id; ?>">
            <p>SubCategory: <?php echo $data->subcategory_name; ?></p>
        </div>
        <p>Tags: <?php echo $data->tags; ?></p>
        <p>Status: <?php 
            switch ($data->status) {
                case 0:
                    echo 'Draft';
                    break;
                case 1:
                    echo 'Published';
                    break;
                case 2:
                    echo 'Archived';
                    break;
                case 3:
                    echo 'Trash';
                    break;
                default:
                    echo 'Unknown';
                    break;
            }
        ?></p>
        <p>Featured: <?php echo $data->featured == 1 ? 'Yes' : 'No'; ?></p>
        <p>Featured Image: <?php echo $data->featured_image; ?></p>
        <p>Featured Image Title: <?php echo $data->featured_image_title; ?></p>
        <p>Featured Image Alt Tag: <?php echo $data->featured_image_alt_tag; ?></p>
        <p>Featured Image Description: <?php echo $data->featured_image_description; ?></p>
        <p>Featured Image Caption: <?php echo $data->featured_image_caption; ?></p>
    </div>
    <?php endforeach; ?>
</div>