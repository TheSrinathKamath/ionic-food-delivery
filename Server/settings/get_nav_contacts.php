<?php

    require '../init.php';
    include('../res_handler.php');

    $status = false;
    $response = 'Request failed!';

    $query = "SELECT * FROM `contacts` WHERE c_name IN ('nav_order', 'nav_inquiry')";
    $result = mysqli_query($con, $query);

    if(mysqli_num_rows($result) <= 0) send_response($status, $response);

    $row = null;
    $data = [];
    $count = 0;

    while($row = mysqli_fetch_assoc($result)){
        $data[$count++] = $row;
    }

    $status = true;
    send_response($status, $data);

?>