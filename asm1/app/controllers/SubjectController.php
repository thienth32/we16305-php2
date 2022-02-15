<?php
namespace App\Controllers;

use App\Models\Subject;

class SubjectController{
    public function index(){
        $subjects = Subject::all();

        include_once "./app/views/mon-hoc/index.php";
    }

    public function detail($slug, $id){
        var_dump($slug, $id);die;
    }

    public function addForm(){
        include_once "./app/views/mon-hoc/add-form.php";
    }

    public function editForm(){
        $id = $_GET['id'];
        $model = Subject::where(['id', '=', $id])->first();
        if(!$model){
            header('location: ' . BASE_URL . 'mon-hoc');
            die;
        }

        include_once "./app/views/mon-hoc/edit-form.php";
    }

    public function saveAdd(){
        $model = new Subject();
        $data = [
            'name' => $_POST['name']
        ];
        $model->insert($data);
        header('location: ' . BASE_URL . 'mon-hoc');
        die;
    }

    public function saveEdit(){
        $id = $_GET['id'];
        $model = Subject::where(['id', '=', $id])->first();
        if(!$model){
            header('location: ' . BASE_URL . 'mon-hoc');
            die;
        }

        $data = [
            'name' => $_POST['name']
        ];

        $model->update($data);
        header('location: ' . BASE_URL . 'mon-hoc');
        die;
    }

    public function remove(){
        $id = $_GET['id'];
        Subject::destroy($id);
        header('location: ' . BASE_URL . 'mon-hoc');
        die;
    }
}
?>