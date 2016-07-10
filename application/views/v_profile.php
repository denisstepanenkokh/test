<div id="site_content">

    <div id="content">

        <table>
            <tr>
                <td> <h3>Name : <?= $first_name ?></h3></td>
                <td>  <h3>Last Name : <?= $last_name ?></h3></td>
            </tr>
            <tr>
                
                <td><h3>Photo : <img src='<?php echo base_url();?>uploads/<?php echo $filetoupload; ?>'  alt="user" style="width:304px;height:228px;"></h3>  </td>
                <td></td>
            </tr>
            <tr>
                <td> <h3>Email : <?= $email1 ?></h3></td>
                <td><h3>User Type : <?= $user_type ?></h3>  </td>
            </tr>
        </table>
    </div>
</div>