<?php
header('Access-Control-Allow-Origin:*');
$id = $_POST['id'];
$tel = $_POST['tel'];
$db = new mysqli('localhost', 'root', '', 'drug');
if ($db->connect_errno) {
    die('连接数据库失败');
}
$db->query('set names utf8');

$sql = "delete from site where id = '$id'";

$res = $db->query($sql);
if ($res) {
    $sql = "select * from site where tel = '$tel'";
    $res = $db->query($sql);
    if($res -> num_rows){
        $result = [];
        while($data = $res -> fetch_assoc()){
            array_push($result,$data);
        }
        echo json_encode($result);
    }
} else {
    echo "0";
}


?>
