<?php

abstract class BaseModel{
    public $age = 15;
    abstract static public function getTableName() :string;
    public function setAge($age): void{
        $this->age = $age;
    }
}

interface OrderProcess{
    public function detailOrder(): Order;
}

class User extends BaseModel{

    public static function getTableName(): string
    {
        return "users";
    }
}

class Product extends BaseModel implements OrderProcess{
    public static function getTableName(): string
    {
        return "products";
    }

    public function detailOrder(): Order
    {
        $model = new Order();
        return $model;
    }
}

class Order extends BaseModel{
    public static function getTableName(): string
    {
        return "order";
    }
}

// echo User::getTableName();
$x = new User();
echo $x->age;
echo "<br>";
$x->setAge(30);
echo $x->age;

?>