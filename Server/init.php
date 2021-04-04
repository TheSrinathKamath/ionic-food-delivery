<?php
    header('Content-type: text/plain; charset=utf-8');
    header("Access-Control-Allow-Origin: *");
    header('Access-Control-Allow-Methods: GET, POST');

    define('HOST', '127.0.0.1');
    define('USER', 'root');
    define('PASS', '');
    define('DB', 'vfd');

    $con = mysqli_connect(HOST, USER, PASS, DB);
    mysqli_set_charset($con, 'utf8');
    
    if(!$con){
        die("Error in connection ".mysqli_connect_error());
    }
?>