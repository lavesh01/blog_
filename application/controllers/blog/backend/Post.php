<?php
defined('BASEPATH') OR exit('No direct script access allowed');
//include_once(FCPATH.'system/core/MY_Controller.php');
class Post extends Admin_Controller   {

public function __construct() {
       parent::__construct();
       $this->load->model('blog/Post_model');
}

public function index($table_name="")
{
    $tags = array('Sample tag');
    $data['tags'] = $tags;

    $data["title"] =  "Post";
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
        
        site_url()."resources/themes/".$this->theme_selected_template."/assets/custom/js/blog/post.js",
    ];

    $data["css"] = [ 
        site_url()."resources/themes/".$this->theme_selected_template."/assets/grapesjs/dist/css/grapes.min.css",

        site_url()."resources/themes/".$this->theme_selected_template."/assets/custom/css/blog/blog.css",
    ];

    $categories = $this->Post_model->get_categories();
    $subcategories = $this->Post_model->get_subcategories();

    $data['categories'] = $categories;
    $data['subcategories'] = $subcategories;


    $this->load_view("blog/blogpage", $data, 'operation/sidebar/sidebar'); 
}

public function save_post(){
    $data = $this->input->post();

    $input_data = $this->input->input_stream();
    if (
        !isset($input_data['post_title']) || empty($input_data['post_title']) ||
        !isset($input_data['slug'])
    ) {
        echo $this->ajax__response_data_preperation('Error', 'Missing data in the request', 'error');
        die();
    }

    $result = $this->Post_model->save_post($data);

    if ($result == "error") {
        echo $this->ajax__response_data_preperation('Error', 'Failed to create new Post', 'error', $result );
    } else {
        $input_data['post_id'] = $result; 
        echo $this->ajax__response_data_preperation('Saved', 'Post created successfully', 'success', $input_data);

    }
}


public function saveFormData()
{
    $this->load->library('form_validation');
    
    $this->form_validation->set_rules('post_type', 'Post Type', 'required');
    $this->form_validation->set_rules('post_title', 'Post Title', 'required');
    $this->form_validation->set_rules('slug', 'Slug', 'required');
    $this->form_validation->set_rules('post_content', 'Post Content', 'required');
    $this->form_validation->set_rules('meta_title', 'Meta Title', 'required');
    $this->form_validation->set_rules('meta_description', 'Meta Description', 'required');
    $this->form_validation->set_rules('meta_keywords', 'Meta Keywords', 'required');
    $this->form_validation->set_rules('author_tag', 'Author Tag', 'required');
    $this->form_validation->set_rules('og_url', 'OG URL', 'required');
    $this->form_validation->set_rules('og_type', 'OG Type', 'required');
    $this->form_validation->set_rules('og_title', 'OG Title', 'required');
    $this->form_validation->set_rules('og_description', 'OG Description', 'required');
    $this->form_validation->set_rules('og_image', 'OG Image', 'required');
    $this->form_validation->set_rules('twitter_site', 'Twitter Site', 'required');
    $this->form_validation->set_rules('twitter_title', 'Twitter Title', 'required');
    $this->form_validation->set_rules('twitter_description', 'Twitter Description', 'required');
    $this->form_validation->set_rules('twitter_image', 'Twitter Image', 'required');
    // $this->form_validation->set_rules('category', 'Category', 'required');
    // $this->form_validation->set_rules('sub_category', 'Sub Category', 'required');
    // $this->form_validation->set_rules('featured_image', 'Featured Image', 'required');
    // $this->form_validation->set_rules('featured_image_title', 'Featured Image Title', 'required');
    // $this->form_validation->set_rules('featured_image_alt_tag', 'Featured Image Alt Tag', 'required');
    // $this->form_validation->set_rules('featured_image_description', 'Featured Image Description', 'required');
    // $this->form_validation->set_rules('featured_image_caption', 'Featured Image Caption', 'required');
    
    if ($this->form_validation->run() == FALSE) {
        $response = array('status' => 'error', 'errors' => $this->form_validation->error_array());
        $this->output->set_content_type('application/json')->set_output(json_encode($response));
    } else {
        $input = $this->input->post();
        
        $data = array(
            'post_type' => $input["post_type"],
            'post_title' => $input["post_title"],
            'slug' => $input["slug"],
            'post_content' => $input["post_content"],
            'meta_title' => $input["meta_title"],
            'meta_description' => $input["meta_description"],
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

        $this->load->model('blog/Post_model');

        $insert_id = $this->Post_model->save_form_data($data);
        
        if ($insert_id) {
            $response = array('status' => 'success', 'message' => 'Post form Data saved successfully', 'post_id' => $insert_id);
        } else {
            $response = array('status' => 'error', 'message' => 'Post form Failed to save data.');
        }
        
        echo json_encode($response);
    }
}

public function getCategories()
{
    $this->load->model('blog/Post_model');
    $categories = $this->Post_model->get_categories();

    $data['categories'] = $categories;

    $this->load->view('blog/blogpage', $data);
}


public function saveCategory()
{
        $input = $this->input->post("category_name");
        var_dump($input);

        if (isset($input) && !empty($input)) {
            $data = array(
                'category_name' => $input
            );

        $this->load->model('blog/Post_model');

        $category_row = $this->Post_model->save_category($data);

        if ($category_row) {
            $response = $category_row;
        } else {
            $response = array('status' => 'error', 'message' => 'Category Failed to save data.');
        }

        echo json_encode($response);
    } else {
        $response = array('status' => 'error', 'message' => 'Category Required fields are missing.');
        echo json_encode($response);
    }
}

public function getSubcategories()
{
    $this->load->model('blog/Post_model');
    $subcategories = $this->Post_model->get_subcategories();

    $data['subcategories'] = $subcategories;

    $this->load->view('blog/blogpage', $data);
}


public function saveSubcategory()
{
    $input = $this->input->post("subcategory_name");
    var_dump($input);

    if (isset($input) && !empty($input)) {
        $data = array(
            'subcategory_name' => $input
        );

        $this->load->model('blog/Post_model');

        $subcategory_row = $this->Post_model->save_subcategory($data);

        if ($subcategory_row) {
            $response = $subcategory_row;
        } else {
            $response = array('status' => 'error', 'message' => 'Subcategory failed to save data.');
        }

        echo json_encode($response);
    } else {
        $response = array('status' => 'error', 'message' => 'Subcategory required fields are missing.');
        echo json_encode($response);
    }
}


public function deletepost() {
    $post_id = $this->input->post('id');

    $this->load->model('blog/Post_model');
    $result = $this->Post_model->delete_post($post_id);

    if ($result == "success") {
        echo $this->ajax__response_data_preperation('Deleted', 'Post data deleted successfully', 'success');

    } else {
        echo $this->ajax__response_data_preperation('Error', 'Failed to delete branch data', 'error');
    }
}

}