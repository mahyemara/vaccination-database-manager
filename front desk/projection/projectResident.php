<style>
    body {
        background-color: #DBF9FC;
    }
</style>

<?php
include 'connect.php';
include 'myTable.php';
$conn = OpenCon();
echo("Resident Basic Information");
$sql = "SELECT * FROM resident";
myTable($conn,$sql);
echo("Resident Side Effect Information");
$sql = "SELECT * FROM exhibit";
myTable($conn,$sql);
?>

<form action="frontDesk.html" method="POST">
    <input type="submit" value="Go Back to Front Desk Page">
</form>