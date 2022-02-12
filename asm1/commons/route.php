<?php

use App\Controllers\DashboardController;
use App\Controllers\HomeController;
use App\Controllers\LoginController;
use App\Controllers\SubjectController;
use Phroute\Phroute\RouteCollector;
function definedRoute($url){
    $router = new RouteCollector();

    $router->get('/', [HomeController::class, 'index']);

    $router->get('login', [LoginController::class, 'loginForm']);
    $router->post('login', [LoginController::class, 'postLogin']);

    $router->get('mon-hoc', [SubjectController::class, 'index']);
    $router->get('mon-hoc/{id}/{name}', [SubjectController::class, 'detail']);

    $router->get('dashboard', [DashboardController::class, 'index']);

    $dispatcher = new Phroute\Phroute\Dispatcher($router->getData());
    $response = $dispatcher->dispatch($_SERVER['REQUEST_METHOD'], parse_url($url, PHP_URL_PATH));
    // Print out the value returned from the dispatched function
    echo $response;
}

?>