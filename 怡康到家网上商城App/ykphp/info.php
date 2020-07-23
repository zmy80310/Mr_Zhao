<?php
header('Access-Control-Allow-Origin:*');
$db = new mysqli('localhost','root','','drug');
$id = $_GET['id'];
// 中文编码
if($db->connect_errno !==0){
    die("连接数据库失败");
}
$db -> query('set names utf8');
$sql = "select * from home where id = '$id'";
$res = $db -> query($sql);
if($res -> num_rows){
    echo json_encode($res -> fetch_assoc());
}
$db -> close();
?>


