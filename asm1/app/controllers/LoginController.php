<?php
namespace App\Controllers;

use App\Models\User;

class LoginController{
    
    public function registerForm(){
        include_once './app/views/auth/register-form.php';
    }

    public function createAccount(){
        $data = [
            "name" => $_POST['name'],
            "email" => $_POST['email'],
            "password" => password_hash($_POST['password'], PASSWORD_DEFAULT)
        ];

        $model = new User();
        $model->insert($data);
        header('location: ' . BASE_URL . 'mon-hoc');
        die;
    }
}
?>