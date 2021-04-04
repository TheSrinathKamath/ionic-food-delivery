<?php
    require '../init.php';
    include('../res_handler.php');
    
    $status = false;
    $response = 'Request failed!';

    if(empty($_GET['id'])) send_response($status, $response);

    $item_id = $_GET['id'];

    $query = "SELECT f.name, t.t_name as type, f.description, f.short_desc, image as disp_img, f.unit_price, f.min_order_qty, of.o_desc, of.o_reduction_amt, of.is_percent, of.o_from_date, of.o_valid_to, of.is_active as offer_valid, c1.c_number as w_app_order_contact, c2.c_number as call_order_contact FROM food_items f INNER JOIN food_type t on t.t_id = f.food_type_id INNER JOIN offers of ON of.o_id = f.sale_id INNER JOIN contacts c1 on c1.c_id = f.w_app_order_contact_id INNER JOIN contacts c2 ON c2.c_id = f.call_order_contact_id AND f.is_active = 1 WHERE f.id = '$item_id'";

    $result  = mysqli_query($con, $query);

    if(mysqli_num_rows($result) <= 0) send_response($status, $response);

    $response = mysqli_fetch_assoc($result);
    $status = true;

    send_response($status, $response);
?>