<?php
$connect = new mysqli("localhost","root","root","stocktake");

if($connect){
}else{
	echo "Connection Failed";
	exit();
}
?>
