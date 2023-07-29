<?php
defined('BASEPATH') OR exit('No direct script access allowed');
//include_once(FCPATH.'system/core/MY_Controller.php');
class EditBlog extends Admin_Controller {

public function __construct() {
       parent::__construct();
       $this->load->model('blog/Blog_model');
       $this->load->model('blog/Post_model');
}

public function index($table_name="")
{
    $data["title"] =  "Update Post";
    $data['form_data'] = $this->Blog_model->getBlogPosts();

    
    $this->load_view("blog/editblogpage", $data, 'operation/sidebar/sidebar');
}

public function edit($postId) {
    $data["title"] =  "Edit Post";
    
    $data["css"] = [ 
        site_url()."resources/themes/".$this->theme_selected_template."/assets/grapesjs/dist/css/grapes.min.css",
        site_url()."resources/themes/".$this->theme_selected_template."/assets/custom/css/blog/blog.css",
    ];

    $data["js"] =  [             
        site_url()."resources/themes/".$this->theme_selected_template."/assets/grapesjs/dist/grapes.min.js",   
        "https://cdn.jsdelivr.net/npm/grapesjs-preset-webpage@1.0.3/dist/index.min.js",
        "https://cdn.jsdelivr.net/npm/grapesjs-blocks-basic@1.0.2/dist/index.min.js",
        "https://cdn.jsdelivr.net/npm/grapesjs-plugin-forms@2.0.6/dist/index.min.js",
        "https://cdn.jsdelivr.net/npm/grapesjs-custom-code@1.0.2/dist/index.min.js",
        "https://cdn.jsdelivr.net/npm/grapesjs-component-countdown@1.0.2/dist/index.min.js",
        "https://cdn.jsdelivr.net/npm/grapesjs-navbar@1.0.2/dist/index.min.js",
        "https://cdn.jsdelivr.net/npm/grapesjs-typed@2.0.1/dist/index.min.js",
        "https://cdn.jsdelivr.net/npm/grapesjs-tooltip@0.1.8/dist/index.min.js",
        "https://cdn.jsdelivr.net/npm/grapesjs-tabs@1.0.6/dist/grapesjs-tabs.min.js",
        
        site_url()."resources/themes/".$this->theme_selected_template."/assets/custom/js/blog/editblog.js",
    ];


    $this->load->model('blog/Blog_model');
    $post = $this->Blog_model->getBlogPost($postId);


    $this->load->model('blog/Post_model');
    $categories = $this->Post_model->get_categories();
    $subcategories = $this->Post_model->get_subcategories();
    $status_type = $this->Post_model->get_status();

    $data['categories'] = $categories;
    $data['subcategories'] = $subcategories;
    $data['status_type'] = $status_type;

    if ($post) {
        $data['post'] = $post;

        $this->load_view('blog/editblogpage', $data);
    } else {
        echo "Blog post not found!";
    }
}

public function update($id) {
    // $input = $this->input->put();
    // $input = json_decode($this->input->raw_input_stream, true);
    // var_dump(file_get_contents('php://input'));
    parse_str(file_get_contents('php://input'), $input);

    var_dump($input);
    if ( 
        isset($input["post_title"]) && isset($input["slug"]) && isset($input["post_content"]) 
        && !empty($input["post_title"]) && !empty($input["slug"]) && !empty($input["post_content"])
    ){
    $updatedData = array(
        'post_type' => $input['post_type'],
        'post_title' => $input['post_title'],
        'slug' => $input['slug'],
        'post_content' => $input['post_content'],
        'meta_title' => $input['meta_title'],
        'meta_description' => $input['meta_description'],
        'meta_keywords' => $input["meta_keywords"],
        'meta_canonical' => $input["meta_canonical"],
        'robots_tag_index' => $input["robots_tag_index"],
        'robots_tag_follow' => $input["robots_tag_follow"],
        'author_tag' => $input["author_tag"],
        'og_url' => $input["og_url"],
        'og_type' => $input["og_type"],
        'og_title' => $input["og_title"],
        'og_description' => $input["og_description"],
        'og_image' => $input["og_image"],
        'twitter_site' => $input["twitter_site"],
        'twitter_title' => $input["twitter_title"],
        'twitter_description' => $input["twitter_description"],
        'twitter_image' => $input["twitter_image"],
        'category' => $input["category"],
        'sub_category' => $input["sub_category"],
        'tags' => implode(",", $input["tags"]),
        'status' => $input["status"],
        'featured' => $input["featured"],
        'featured_image' => $input["featured_image"],
        'featured_image_title' => $input["featured_image_title"],
        'featured_image_alt_tag' => $input["featured_image_alt_tag"],
        'featured_image_description' => $input["featured_image_description"],
        'featured_image_caption' => $input["featured_image_caption"]
    );
    
    $this->load->model('blog/Blog_model');
    $result = $this->Blog_model->updateBlogPost($id, $updatedData);
    
    if ($result == "error") {
        echo $this->ajax__response_data_preperation('Error', 'Missing data in the request', 'error', $result);
    } else {
        $input_data['post_id'] = $result; 
        echo $this->ajax__response_data_preperation('Updated', 'Post data updated successfully', 'success');
    }
} else {
    echo $this->ajax__response_data_preperation('Error', 'Failed to update branch data', 'error');
}

}


// public function getCategories()
// {
//     $categories = $this->Post_model->get_categories();

//     $data['categories'] = $categories;

//     $this->load->view('blog/editblogpage', $data);
// }


// public function saveCategory()
// {
//         $input = $this->input->post("category_name");
//         var_dump($input);

//         if (isset($input) && !empty($input)) {
//             $data = array(
//                 'category_name' => $input
//             );

//         $category_row = $this->Post_model->save_category($data);

//         if ($category_row) {
//             $response = $category_row;
//         } else {
//             $response = array('status' => 'error', 'message' => 'Category Failed to save data.');
//         }

//         echo json_encode($response);
//     } else {
//         $response = array('status' => 'error', 'message' => 'Category Required fields are missing.');
//         echo json_encode($response);
//     }
// }
// public function getSubcategories()
// {

//     $subcategories = $this->Post_model->get_subcategories();

//     $data['subcategories'] = $subcategories;

//     $this->load->view('blog/editblogpage', $data);
// }


// public function saveSubcategory()
// {
//     $input = $this->input->post("subcategory_name");
//     var_dump($input);

//     if (isset($input) && !empty($input)) {
//         $data = array(
//             'subcategory_name' => $input
//         );

//         $subcategory_row = $this->Post_model->save_subcategory($data);

//         if ($subcategory_row) {
//             $response = $subcategory_row;
//         } else {
//             $response = array('status' => 'error', 'message' => 'Subcategory failed to save data.');
//         }

//         echo json_encode($response);
//     } else {
//         $response = array('status' => 'error', 'message' => 'Subcategory required fields are missing.');
//         echo json_encode($response);
//     }
// }




}