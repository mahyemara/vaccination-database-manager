<style>
    body {
        background-color: #DBF9FC;
    }
</style>

<?php
include 'connect.php';
$hin = $_POST['id'];
$doseNumber = $_POST['doseNumber'];
$conn = OpenCon();
$sql = "update resident set doseNumber = 
    '$doseNumber' where hin = '$hin'";
if ($conn->query($sql) ===
    TRUE) { echo "Record updated
     successfully";
} else {
    echo "Error updating record: " . $conn->error;
}
?>

<form action="nurse.html" method="POST">
    <input type="submit" value="Go Back to Nurse Page">
</form>
