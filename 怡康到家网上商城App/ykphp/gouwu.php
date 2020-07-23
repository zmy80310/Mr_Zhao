<?php
header('Access-Control-Allow-Origin:*');
$src = $_GET['src'];
$name = $_GET['name'];
$price = $_GET['price'];
$number = $_GET['number'];
$tel = $_GET['tel'];
$time = $_GET['time'];
$text = $_GET['text'];
$db = new mysqli('localhost', 'root', '', 'drug');
if ($db->connect_errno) {
    die('连接数据库失败');
}
$db->query('set names utf8');

$sql = "select src from gouwu where tel = '$tel'and src = '$src'";

$res = $db->query($sql);
if ($res->num_rows) {
    echo "1";
} else {
    $sql = "insert into gouwu (name,src,price,number,tel,id,text) values ('{$name}','{$src}','{$price}','{$number}','{$tel}','{$time}','{$text}')";
    $res = $db->query($sql);
    if ($res) {
        echo "2";
    }
}


?>
