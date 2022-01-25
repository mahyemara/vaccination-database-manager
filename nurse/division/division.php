<style>
    body {
        background-color: #DBF9FC;
    }
</style>

<?php
include'connect.php';
include'myTable.php';
$conn = OpenCon();
$sql = "SELECT hin, name FROM resident r 
        WHERE NOT EXISTS (SELECT name from side_effects s
        WHERE NOT EXISTS (SELECT * FROM exhibit e WHERE r.hin=e.hin AND s.name=e.name));";
myTable($conn,$sql);
echo("If no table is appearing, that means that none of the residents have exhibited every side effect");
?>

<form action="nurse.html" method="POST">
    <input type="submit" value="Go Back to Nurse Page">
</form>
