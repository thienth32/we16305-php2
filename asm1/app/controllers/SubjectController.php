<?php
namespace App\Controllers;

use App\Models\Subject;

class SubjectController{
    public function index(){
        $subjects = Subject::all();

        return view('mon-hoc.index', [
            'monhoc' => $subjects,
            'name' => 'thienth'
        ]);
    }

    public function detail($slug, $id){
        var_dump($slug, $id);die;
    }

    public function addForm(){
        return view('mon-hoc.add-form');
    }

    public function editForm($id){
        $model = Subject::find($id);

        include_once "./app/views/mon-hoc/edit-form.php";
    }

    public function saveAdd(){
        Subject::create([
            'name' => $_POST['name']
        ]);
        header('location: ' . BASE_URL . 'mon-hoc');
        die;
    }

    public function saveEdit($id){
        $model = Subject::find($id);
        $model->name = $_POST['name'];
        $model->save();
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