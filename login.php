<?php

	include 'conn.php';

	//$username = $_POST['username'];
	//$password = $_POST['password'];

	$queryResult=$connect->query("SELECT * FROM users WHERE username='root' and password='root'");
	
	$result=array();

	while($fetchData=$queryResult->fetch_assoc()){
		$result[]=$fetchData;
	}

	echo json_encode($result);

?>