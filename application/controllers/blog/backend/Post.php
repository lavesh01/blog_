<?php
defined('BASEPATH') OR exit('No direct script access allowed');
//include_once(FCPATH.'system/core/MY_Controller.php');
class Post extends Admin_Controller   {

public function __construct() {
       parent::__construct();
}


public function saveFormData()
{
    $input = $this->input->post();

    if (isset($input["post_title"]) && isset($input["slug"]) && isset($input["post_content"]) && !empty($input["post_title"]) && !empty($input["slug"]) && !empty($input["post_content"]))
    {
        $data = array(
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
        
    } else {
        $response = array('status' => 'error', 'message' => 'Post form Required fields are missing.');
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
    $post_id = $this->input->post('post_id');

    $this->load->model('blog/Post_model');
    $rows_affected = $this->Post_model->delete_post($post_id);

    if ($rows_affected > 0) {
        $response = array('status' => 'success', 'message' => 'Post deleted successfully');
    } else {
        $response = array('status' => 'error', 'message' => 'Failed to delete post');
    }

    echo json_encode($response);
}

public function index($table_name="")
{
    $tags = array('Technology');
    $data['tags'] = $tags;

    $data["title"] =  "Bug Reporting";
    $data["js"] =  [
            site_url()."resources/themes/".$this->theme_selected_template."/assetsassets/x-editable/moment/moment.min.js",
           site_url()."resources/themes/".$this->theme_selected_template."/assetsassets/x-editable/bootstrap4-editable/js/bootstrap-editable.min.js",
            site_url()."resources/themes/".$this->theme_selected_template."/assetsassets/x-editable/poshytip/jquery.poshytip.min.js",
            site_url()."resources/themes/".$this->theme_selected_template."/assets/custom/js/bugs/index.js" ];

    $data["css"] = [ site_url()."resources/themes/".$this->theme_selected_template."/assetsassets/x-editable/bootstrap4-editable/css/bootstrap-editable.css",
    site_url()."resources/themes/".$this->theme_selected_template."/assetsassets/x-editable/poshytip/tip-yellowsimple/tip-yellowsimple.css",
    ];

    $this->load->model('blog/Post_model');
    $categories = $this->Post_model->get_categories();
    $subcategories = $this->Post_model->get_subcategories();

    $data['categories'] = $categories;
    $data['subcategories'] = $subcategories;


    $this->load_view("blog/blogpage", $data, 'operation/sidebar/sidebar');
      
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