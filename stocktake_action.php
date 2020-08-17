<?php
require_once('connection.php');
$table = "stocktake";
//we will get actions from the app to do operations in the database
$action = $_POST["action"];
// get all objects records from the database
if("GET_ALL" == $action){
$db_data = array();
$sql = "SELECT id,stocktake_id,store_name,location,status,date_created,date_closed
FROM $table ORDER BY date_created";
$result = $conn->query($sql);
if($result->num_rows > 0 ) {
while($row = $result->fetch_assoc()){
$db_data[] = $row;
}
//send back the complete records as a json
echo json_encode($db_data);
}else{
echo "error";
}
$conn->close();
return;
}
//Add a new object
if("_ADD" ==$action){
$store_name= $_POST["store_name"];
$location = $_POST["location"];
$sql ="INSERT INTO $table (store_name,location)
 VALUES( '$store_name','$location')";
if( $conn->query($sql) == TRUE){
echo "success";
}else{
echo "Error: " . $sql . "<br>" . $conn->error;
}
$conn->close();
return;
}
?>