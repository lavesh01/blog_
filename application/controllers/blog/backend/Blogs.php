<?php
defined('BASEPATH') OR exit('No direct script access allowed');
//include_once(FCPATH.'system/core/MY_Controller.php');
class Blogs extends Admin_Controller   {

public function __construct() {
       parent::__construct();
}

public function index($table_name="")
{

    $data["title"] =  "Update Post";
    $data["js"] =  [                
        "https://rawgit.com/artf/grapesjs-preset-webpage/master/dist/grapesjs-preset-webpage.min.js",
        "https://cdn.jsdelivr.net/npm/grapesjs-preset-webpage@1.0.3/dist/index.min.js",
        "https://cdn.jsdelivr.net/npm/grapesjs-blocks-basic@1.0.2/dist/index.min.js",
        "https://cdn.jsdelivr.net/npm/grapesjs-plugin-forms@2.0.6/dist/index.min.js",
        "https://cdn.jsdelivr.net/npm/grapesjs-custom-code@1.0.2/dist/index.min.js",
        "https://cdn.jsdelivr.net/npm/grapesjs-component-countdown@1.0.2/dist/index.min.js",
        "https://cdn.jsdelivr.net/npm/grapesjs-navbar@1.0.2/dist/index.min.js",
        "https://cdn.jsdelivr.net/npm/grapesjs-typed@2.0.1/dist/index.min.js",
        "https://cdn.jsdelivr.net/npm/grapesjs-tooltip@0.1.8/dist/index.min.js",
        "https://cdn.jsdelivr.net/npm/grapesjs-tabs@1.0.6/dist/grapesjs-tabs.min.js",
        site_url()."resources/themes/".$this->theme_selected_template."/assets/grapesjs/dist/grapes.min.js",
        
        site_url()."resources/themes/".$this->theme_selected_template."/assets/custom/js/blog/post.js",
    ];

    $data["css"] = [ 
        "https://rawgit.com/artf/grapesjs-preset-webpage/master/dist/grapesjs-preset-webpage.min.css",
        site_url()."resources/themes/".$this->theme_selected_template."/assets/grapesjs/dist/css/grapes.min.css",

        site_url()."resources/themes/".$this->theme_selected_template."/assets/custom/css/blog/blog.css",
    ];

    $this->load->model('blog/Blog_model');
    $data['form_data'] = $this->Blog_model->getBlogPosts();

    $this->load_view("blog/allblogspage", $data, 'operation/sidebar/sidebar');
}


public function deletepost() {
    $post_id = $this->input->post('post_id');

    $this->load->model('blog/Blog_model');
    $rows_affected = $this->Blog_model->delete_post($post_id);

    if ($rows_affected > 0) {
        $response = array('status' => 'success', 'message' => 'Post deleted successfully');
    } else {
        $response = array('status' => 'error', 'message' => 'Failed to delete post');
    }

    echo json_encode($response);
}

public function edit($postId) {
    $this->load->model('blog/Blog_model');
    $post = $this->Blog_model->getBlogPost($postId);


    $this->load->model('blog/Post_model');
    $categories = $this->Post_model->get_categories();
    $subcategories = $this->Post_model->get_subcategories();

    $data['categories'] = $categories;
    $data['subcategories'] = $subcategories;

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


    // var_dump($input);
    if ( 
        isset($input["post_title"]) && isset($input["slug"]) && isset($input["post_content"]) 
        && !empty($input["post_title"]) && !empty($input["slug"]) && !empty($input["post_content"])
    ){
    $updatedData = array(
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
    $success = $this->Blog_model->updateBlogPost($id, $updatedData);
    
    if ($success) {
        echo $this->ajax__response_data_preperation('Updated', 'Post data updated successfully', 'success');
    } else {
        echo $this->ajax__response_data_preperation('Error', 'Missing data in the request', 'error');
    }
} else {
    echo $this->ajax__response_data_preperation('Error', 'Failed to update branch data', 'error');
}

}




public function addBugs($table_name="")
{
 
   $input = $this->input->post();
   if(isset($input["title"]) && isset($input["description"]) && !empty($input["title"]) && !empty($input["description"]) )
   {
        
      $data =  array('title' =>$input["title"], 'url' =>$input["url"],'Summary'=>$input["description"], "customer_id" => $this->customer_id,"created_by" => $this->user_id);
      $this->db->insert('bugs',$data);
      echo $this->ajax__response_data_preperation("Successfully Added","","success");
      $email_config = $this->email_config();
      $subject = "Bug Added - ". $input["title"];
       $dataemail = array(
        'blog_title'   =>$subject ,
        'blog_heading' => $input["description"]
        );
       $email_message = $this->parser->parse('themes/email-templates/settings', $dataemail, true);
       $this->send_email($email_config, $this->config->item('support_email'),$subject,$email_message);
   }
   else
   {
        echo $this->ajax__response_data_preperation("Not Added","Parameter are Missing","error");
   }
}

    public function ajax_getall($value='')
    {
       
        $this->db->select('bugs.id as # , title,summary, users.username as created_by,bugs.created_on, bugs.status, bugs.eta')->from('bugs');
        $query = $this->db->join('users', 'bugs.created_by = users.id');
        echo $this->ajax__response_data_preperation("","asas","success",$this->datatable_data($query,"" ,$value,"title"));
        die;

    }

}