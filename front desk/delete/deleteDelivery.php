<style>
    body {
        background-color: #DBF9FC;
    }
</style>

<?php
include 'connect.php';
$did = $_POST['did'];
$conn = OpenCon();
$sql = "delete from deliveries where did = '$did'";
if ($conn->query($sql) ===TRUE) {
    echo "Record of delivery deleted successfully";
}else{
    echo "Error updating record: ".$conn->error;
}
?>

<form action="frontDesk.html" method="POST">
    <input type="submit" value="Go Back to Front Desk Page">
</form>
