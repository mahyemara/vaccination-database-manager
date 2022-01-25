<style>
    body {
        background-color: #DBF9FC;
    }
</style>

<?php
include 'connect.php';
include 'myTable.php';
$conn = OpenCon();
echo("Vaccine Adminster Information");
$sql = "SELECT * FROM administers";
myTable($conn,$sql);
?>

<form action="frontDesk.html" method="POST">
    <input type="submit" value="Go Back to Front Desk Page">
</form>