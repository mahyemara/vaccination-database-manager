<style>
    body {
        background-color: #DBF9FC;
    }
</style>

<?php
include'connect.php';
include'myTable.php';
$conn = OpenCon();
$sql = "SELECT hin, name FROM resident r WHERE hin IN
        (SELECT hin FROM exhibit e GROUP BY hin HAVING COUNT(e.hin) > 1)";

myTable($conn,$sql);
echo("If no table is appearing, then no resident has exhibited more than one side effect");
?>

<form action="nurse.html" method="POST">
    <input type="submit" value="Go Back to Nurse Page">
</form>
