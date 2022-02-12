<?php
$id = $_GET['id']; 
// ví dụ $id = -10;
try{
    // 100 dòng code
    echo 1;
    if($id <= 0){
        throw new Exception("Số truyền vào không được là số Âm");
    }

    echo 2;

    $connect = new PDO("mysql:host=127.0.0.1;dbname=kaopizzz;charset=utf8", "root", "12345678");
}catch(Exception $ex){
    echo $ex->getMessage();
}


echo "Done";

?>