<?php

use App\Controllers\DashboardController;
use App\Controllers\HomeController;
use App\Controllers\LoginController;
use App\Controllers\SubjectController;
use Phroute\Phroute\RouteCollector;
function definedRoute($url){
    $router = new RouteCollector();

    $router->filter('auth', function(){
        if(!isset($_SESSION['auth']) || empty($_SESSION['auth'])){
            header('location: ' . BASE_URL . 'login');
            die;
        }
    });

    $router->get('/', [HomeController::class, 'index']);
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