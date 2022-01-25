<style>
    body {
        background-color: #DBF9FC;
    }
</style>

<?php
include 'connect.php';
$phone = $_POST['phone'];
$zip = $_POST['zip'];
$conn = OpenCon();
$sql = "update resident_address set address = 
    '$zip' where phone = '$phone'";
if ($conn->query($sql) ===
    TRUE) { echo "Address updated
     successfully";
} else {
    echo "Error updating record: " . $conn->error;
}
?>

<form action="resident.html" method="POST">
    <input type="submit" value="Go Back to Resident Page">
</form>
