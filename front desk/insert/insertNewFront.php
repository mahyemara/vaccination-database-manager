<style>
    body {
        background-color: #DBF9FC;
    }
</style>

<?php

include 'connect.php';
$eid = $_POST['eid'];
$name = $_POST['name'];
$centreName = $_POST['centreName'];
$conn = OpenCon();

$sql = "INSERT INTO `front_desk` (`eid`, `name`) 
VALUES ('$eid', '$name')";
if ($conn->query($sql) ===
    TRUE) {
    echo "Front Desk Employee Information Inserted Successfully!";
} else {
    echo "Error updating record: " . $conn->error;
}

$sql = "INSERT INTO `front_works_at` (`eid`, `name`)
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
