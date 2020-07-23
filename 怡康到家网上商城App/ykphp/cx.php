<?php
header('Access-Control-Allow-Origin:*');
$s = $_GET['s'];

$db = new mysqli('localhost','root','','drug');
if($db->connect_errno){
    die('连接数据库失败');
}
$db->query('set names utf8');
$sql = "select * from home where name like '%$s%'";
$res = $db->query($sql);
if($res->num_rows){
    $result = [];
    while($data = $res -> fetch_assoc()){
        array_push($result,$data);
    }
    echo json_encode($result);
}else{
    echo 0;
}

$db -> close();













?>
