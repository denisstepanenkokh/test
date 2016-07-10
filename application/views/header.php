<!DOCTYPE HTML>
<html>

<head>
    <title>My Blog</title>
    <meta name="description" content="website description" />
    <meta name="keywords" content="website keywords, website keywords" />
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Tangerine&amp;v1" />
    <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Yanone+Kaffeesatz" />
    <link rel="stylesheet" type="text/css" href="<?= base_url()?>public/css/style.css" />
    <link rel="stylesheet" type="text/css" href="<?= base_url()?>public/css/bootstrap-theme.min.css" />
    <link rel="stylesheet" type="text/css" href="<?= base_url()?>public/css/bootstrap.min.css" />
</head>

<body>
    <div id="main">
        <div id="header">
            <div id="logo">
                <h1><a href="<?=base_url()?>blog/">My Blog</a></h1>
                <div class="slogan">Test Work</div>
            </div>
            <div id="menubar">
                <ul id="menu">
                    <li class="<?=$home_class;?>" ><a href="<?=base_url()?>blog/">Главная страница</a></li>
                    <?php if($this->session->userdata('user_id'))
                    {?>
                          <li class="<?=$login_class;?>" ><a href="<?=  base_url()?>users/logout">(<?=$this->session->userdata['login']?>)Выйти</a></li>
                    <?php
                    } 
                    else{ ?>
                        <li class="<?=$login_class;?>" ><a href="<?=  base_url()?>users/login">Войти</a></li>
                    <?php } ?>

                    <li class="<?=$register_class;?>" ><a href="<?=  base_url()?>users/register/">Регистрация</a></li>
<!--                    <li class="<?=$upload_class;?>" ><a href="<?=  base_url()?>upload/">Upload Photo</a></li>-->
<!--                    <li class="<?=$contact_class;?>" ><a href="<?=  base_url()?>pages/contact">Contact Us</a></li>-->
                </ul>
            </div>
        </div>