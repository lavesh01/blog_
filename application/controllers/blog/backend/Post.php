<?php
defined('BASEPATH') OR exit('No direct script access allowed');
//include_once(FCPATH.'system/core/MY_Controller.php');
class Post extends Admin_Controller   {

public function __construct() {
       parent::__construct();
}

public function showFormData()
{
    $tags = array('Technology');
    $data['tags'] = $tags;

       $this->load->model('blog/Blog_model');   

       $data['form_data'] = $this->Blog_model->get_form_data();
   
       $this->load_view('blog/blogpage', $data);
}

public function saveFormData()
{
    $input = $this->input->post();
    // var_dump($input);

    // Check if required fields are set and not empty
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
            'social_tags' => $input["social_tags"],
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

        $insert_id = $this->Blog_model->save_form_data($data);
        
        if ($insert_id) {
            $response = array('status' => 'success', 'message' => 'Data saved successfully', 'post_id' => $insert_id);
        } else {
            $response = array('status' => 'error', 'message' => 'Failed to save data.');
        }
        
        echo json_encode($response);
        
    } else {
        echo "Not Added: Required fields are missing.";
    }
}

public function saveSocialTags()
{
    $input = $this->input->post();
    // var_dump($input);

    // Check if required fields are set and not empty
        $data = array(
            'og_url' => $input["og_url"],
            'og_type' => $input["og_type"],
            'og_title' => $input["og_title"],
            'og_description' => $input["og_description"],
            'og_image' => $input["og_image"],
            'twitter_site' => $input["twitter_site"],
            'twitter_title' => $input["twitter_title"],
            'twitter_description' => $input["twitter_description"],
            'twitter_image' => $input["twitter_image"],
            
        );

        $this->load->model('blog/Blog_model');

        $insert_id = $this->Blog_model->save_social_tags($data);
        
        if ($insert_id) {
            $response = array('status' => 'success', 'message' => 'Data saved successfully', 'post_id' => $insert_id);
        } else {
            $response = array('status' => 'error', 'message' => 'Failed to save data.');
        }
        
        echo json_encode($response);
        
    // } else {
    //     echo "Not Added: Required fields are missing.";
    // }
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

    
    // $this->load->model('blog/Blog_model');
    // $data['form_data'] = $this->Blog_model->get_form_data();




       
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