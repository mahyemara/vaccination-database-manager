<style>
    body {
        background-color: #DBF9FC;
    }
</style>

<?php
include 'connect.php';
$eid = $_POST['eid'];
$conn = OpenCon();

$sql = "delete from nurse_assigned_to where eid = '$eid'";
if ($conn->query($sql) ===TRUE) {
    echo "Employee deleted successfully <br>";
}else{
    echo "Error updating record: ".$conn->error;
}

?>

<form action="frontDesk.html" method="POST">
    <input type="submit" value="Go Back to Front Desk Page">
</form>
