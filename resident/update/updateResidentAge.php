<style>
    body {
        background-color: #DBF9FC;
    }
</style>

<?php
include 'connect.php';
$age = $_POST['age'];
$hin = $_POST['hin'];
$conn = OpenCon();
$sql = "update resident set age = 
    '$age' where hin = '$hin'";
if ($conn->query($sql) ===
    TRUE) { echo "Age updated
     successfully";
} else {
    echo "Error updating record: " . $conn->error;
}
?>

<form action="resident.html" method="POST">
    <input type="submit" value="Go Back to Resident Page">
</form>
