<?php

class Blog extends CI_Controller
{   
    function __construct() 
    {
        parent::__construct();
        $this->load->model('m_db');
    }
    function index($start = 0)//index page
    {
        $data['posts'] = $this->m_db->get_posts(10, $start);
        
        //pagination
        $this->load->library('pagination');
        $config['base_url'] = base_url().'blog/index/';//url to set pagination
        $config['total_rows'] = $this->m_db->get_post_count();
        $config['per_page'] = 10; 
        $this->pagination->initialize($config); 
        $data['pages'] = $this->pagination->create_links(); //Links of pages
        
        $class_name = array(
            'home_class'=>'current', 
            'login_class' => '', 
            'register_class' => '',
            'upload_class'=>'',
            'contact_class'=>'');
        $this->load->view('header',$class_name);
        $this->load->view('v_home',$data);
        $this->load->view('footer');
    }
    function post($post_id)//single post page
    {   
        $this->load->model('m_comment');
        $data['comments'] = $this->m_comment->get_comment($post_id);    
        $data['post'] = $this->m_db->get_post($post_id);
        $class_name = array(
            'home_class'=>'current', 
            'login_class' =>'', 
            'register_class' => '',
            'upload_class'=>'',
            'contact_class'=>'');
        $this->load->view('header',$class_name);
        $this->load->view('v_single_post',$data);
        $this->load->view('footer');
    }
    
    function new_post()//Creating new post page
    {
        if(!$this->check_permissions('author'))//when the user is not an andmin and author
        {
            redirect(base_url().'users/login');
        }
        if($this->input->post())
        {
           $user = $this->session->userdata['user_id'];
            $data = array(
                'user_id'=> $user,
                'post_title' => $this->input->post('post_title'),
                'post' => $this->input->post('post'),
                'active' => 1,
            );
            $this->m_db->insert_post($data);
            redirect(base_url().'blog/');
        }
        else{
            
            $class_name = array(
            'home_class'=>'current', 
            'login_class' =>'', 
            'register_class' => '',
            'upload_class'=>'',
            'contact_class'=>'');
            $this->load->view('header',$class_name);
            $this->load->view('v_new_post');
            $this->load->view('footer');
        }
    }
    function editpost($post_id)//Edit post page
    {
        if(!$this->check_permissions('author'))//when the user is not an andmin and author
        {
            redirect(base_url().'users/login');
        }
        $data['success'] = 0;
        
        if($this->input->post())
        {
            $data = array(
                'post_title' => $this->input->post('post_title'),
                'post' => $this->input->post('post'),
                'active' => 1
            );
            $this->m_db->update_post($post_id, $data);
            $data['success'] = 1;
        }
        $data['post'] = $this->m_db->get_post($post_id);
        
        $class_name = array(
            'home_class'=>'current', 
            'login_class' =>'', 
            'register_class' => '',
            'upload_class'=>'',
            'contact_class'=>'');
        $this->load->view('header',$class_name);
        $this->load->view('v_edit_post',$data);
        $this->load->view('footer');
    }
    function deletepost($post_id)//delete post page
    {
        if(!$this->check_permissions('author'))//when the user is not an andmin and author
        {
            redirect(base_url().'users/login');
        }
        $this->m_db->delete_post($post_id);
        redirect(base_url().'blog/');
    }
    
    function check_permissions($required)
    {
        $user_type = $this->session->userdata('user_type');
        if($required == 'user')
        {
            if($user_type){return TRUE;}
        }
        elseif($required == 'author')
        {
            if($user_type == 'author' || $user_type == 'admin')
            {
                return TRUE;
            }
        }
        elseif($required == 'admin')
        {
            if($user_type == 'admin'){return TRUE;}
        }
    }
}