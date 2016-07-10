<?php

class Users extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('m_user');
    }

    function login()
    {
        if ($this->session->userdata("user_id")) {//If already logged in
            redirect(base_url()); //redirect to the blog page
        }
        $data['error'] = 0;
        if ($this->input->post()) {//data inputed for login
//            $first_name = $this->input->post('first_name', TRUE);
            $login = $this->input->post('login', TRUE);
            $password = $this->input->post('password', TRUE);
            $role = $this->input->post('user_type', TRUE);
            $user = $this->m_user->login($login, $password, $role);
            if (!$user) {
                $data['error'] = 1;
            }//when user doesn't exist
            else { //when user exist
                $this->session->set_userdata('user_id', $user['user_id']);
                $this->session->set_userdata('login', $user['login']);
                $this->session->set_userdata('user_type', $user['user_type']);
                redirect(base_url() . 'blog/');
            }
        }
        $class_name = array(
            'home_class' => '',
            'login_class' => 'current',
            'register_class' => '',
            'upload_class' => '',
            'contact_class' => '');
        $this->load->view('header', $class_name);
        $this->load->view('v_login', $data);
        $this->load->view('footer');
    }

    function logout()
    {
        $this->session->sess_destroy();
        redirect(base_url() . 'blog/');
    }

    function register()
    {
        $data['error'] = NULL;
        if ($this->input->post()) {
            $config = array(
                array(
                    'field' => 'last_name',
                    'label' => 'Last name',
                    'rules' => 'trim|required'//is unique username in the user's table of DB
                ),
                 array(
                    'field' => 'filetoupload',
                    'label' => 'Photo',
                    //'rules' => 'trim|required'//is unique username in the user's table of DB
                ),
                array(
                    'field' => 'login',
                    'label' => 'Login',
                    'rules' => 'trim|required|is_unique[users.last_name]'//is unique username in the user's table of DB
                ),
                array(
                    'field' => 'first_name',
                    'label' => 'First name',
                    'rules' => 'trim|required'//is unique username in the user's table of DB
                ),
                array(
                    'field' => 'password',
                    'label' => 'Password',
                    'rules' => 'trim|required|min_length[5]|max_length[20]'
                ),
                array(
                    'field' => 'passconf',
                    'label' => 'Password confirmed',
                    'rules' => 'trim|required|matches[password]',
                ),
                array(
                    'field' => 'user_type',
                    'label' => 'User type',
                    'rules' => 'trim|required',
                ),
                array(
                    'field' => 'email',
                    'label' => 'Email',
                    'rules' => 'trim|required|is_unique[users.email]|valid_email', //is unique email in the user's table of DB
                ),
            );
            
            $img = $_FILES['filetoupload']['tmp_name'];
            $rand = rand(100000,1000000);
            $uploaddir = 'uploads';
            
           $name= $rand.$_FILES['filetoupload']['name'];
           if (!empty($_FILES['filetoupload']['name'])) {
            if (move_uploaded_file($img, "$uploaddir/$name")) {
                
            } else {
               
            }
           }

            $this->load->library('form_validation');
            $this->form_validation->set_rules($config);
            if ($this->form_validation->run() == FALSE) {
                $data['error'] = validation_errors();
            } else {
                $data = array(
                    'login' => $this->input->post('login'),
                    'last_name' => $this->input->post('last_name'),
                    'first_name' => $this->input->post('first_name'),
                    'email' => $this->input->post('email'),
                    'password' => sha1($this->input->post('password')),
                    'user_type' => $this->input->post('user_type'),
                    'filetoupload'=>(string)$name,
                );
                $user_id = $this->m_user->create_user($data);
                $this->session->set_userdata('user_id', $user_id);
                $this->session->set_userdata('login', $this->input->post('login'));
                $this->session->set_userdata('user_type', $this->input->post('user_type'));
                redirect(base_url() . 'blog/');
            }
        }
        $class_name = array(
            'home_class' => '',
            'login_class' => '',
            'register_class' => 'current',
            'upload_class' => '',
            'contact_class' => '');

        $this->load->view('header', $class_name);
        $this->load->view('v_register', $data);
        $this->load->view('footer');
    }

    function getUser($id)
    {
        $match = array(
            'user_id' => $id,
        );
        $this->db->select()->from('users')->where($match);
        $query = $this->db->get();
        $user = $query->result_array();
        $data = array(
            'login' => $user[0]['login'],
            'last_name' => $user[0]['last_name'],
            'first_name' => $user[0]['first_name'],
            'email1' => $user[0]['email'],
            'user_type' => $user[0]['user_type'],
            'filetoupload' => $user[0]['filetoupload'],
        );
        $class_name = array(
            'home_class' => '',
            'login_class' => '',
            'register_class' => 'current',
            'upload_class' => '',
            'contact_class' => '');
        $this->load->view('header', $class_name);
        $this->load->view('v_profile', $data);
        $this->load->view('footer');
    }
}
