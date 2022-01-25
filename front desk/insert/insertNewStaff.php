<?php

include 'connect.php';
$eid = $_POST['eid'];
$name = $_POST['name'];
$number = $_POST['number'];
$centreName = $_POST['centreName'];
$conn = OpenCon();

$sql = "INSERT INTO `nurse_assigned_to` (`eid`, `name`, `number`, `centreName`) 
VALUES ('$eid', '$name', '$number','$centreName')";
if ($conn->query($sql) ===
TRUE) {
echo "Staff Inserted Successfully! <br>";
} else {
echo "Error updating record: " . $conn->error;
}

$sql = "INSERT INTO `staff_works_at` (`eid`, `name`)
VALUES ('$eid', '$centreName')";
if ($conn->query($sql) ===
TRUE) {
echo "all set!";
} else {
echo "Error updating record: " . $conn->error;
}
?>

<form action="frontDesk.html" method="POST">
  <input type="submit" value="Go Back to Front Desk Page">
</form>
