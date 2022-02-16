<?php

use App\Controllers\DashboardController;
use App\Controllers\HomeController;
use App\Controllers\LoginController;
use App\Controllers\SubjectController;
use App\Models\User;
use Phroute\Phroute\RouteCollector;
function definedRoute($url){
    $router = new RouteCollector();

    $router->filter('auth', function(){
        if(!isset($_SESSION['auth']) || empty($_SESSION['auth'])){
            header('location: ' . BASE_URL . 'login');
            die;
        }
    });
    // Model::find([2, 9]);
    // status 1 - đã đặt, 2 - xác nhận, 3 - đang giao, 4 - hoàn thành, 5 - hủy
    // Model::whereIn('id', [3, 9])->get();
    // Model::whereNotIn(tên cột, [mảng giá trị])->get();

    $router->get('/', function(){
        $arr = [
            'email' => 'thienth@fpt.edu.vn',
            'password' => '123456',
            'role_id' => 1
        ];
        $model = new User();
        $model->fill($arr);

        echo "<pre>";
        var_dump($model->email);die;

    });
    // $router->get('/', [HomeController::class, 'index']);
    $router->get('profile', function(){
        return "Trang thông tin cá nhân";
    }, ['before' => 'auth']);

    $router->get('login', [LoginController::class, 'loginForm']);
    $router->post('login', [LoginController::class, 'postLogin']);
    $router->any('logout', function(){
        unset($_SESSION['auth']);
        header('location: ' . BASE_URL);
        die;
    });

    $router->group(['prefix' => 'mon-hoc', 'before' => 'auth'], function($router){
        $router->get('/', [SubjectController::class, 'index']);
        $router->get('tao-moi', [SubjectController::class, 'addForm']);
        $router->post('tao-moi', [SubjectController::class, 'saveAdd']);
        $router->get('cap-nhat/{id}', [SubjectController::class, 'editForm']);
        $router->post('cap-nhat/{id}', [SubjectController::class, 'saveEdit']);
        $router->get('{slug}-sid{id}', [SubjectController::class, 'detail']);
        $router->get('xoa/{id}/{permanance}?', 
                function($id, $permanance = false){
                var_dump($id, $permanance);die;
        });
    });

    
    
    

    $router->get('dashboard', [DashboardController::class, 'index']);

    $dispatcher = new Phroute\Phroute\Dispatcher($router->getData());
    $response = $dispatcher->dispatch($_SERVER['REQUEST_METHOD'], parse_url($url, PHP_URL_PATH));
    // Print out the value returned from the dispatched function
    echo $response;
}

?>