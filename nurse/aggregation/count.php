<style>
    body {
        background-color: #DBF9FC;
    }
</style>

<?php
include'connect.php';
include'myTable.php';
$where_cols= $_POST['where_cols'];
$conn = OpenCon();
$sql = "SELECT company, COUNT(hin) AS Number FROM administers WHERE company like '%$where_cols%' GROUP BY company;";
myTable($conn,$sql);
echo("If no table is appearing, that means it has been given 0 times");
?>

<form action="nurse.html" method="POST">
    <input type="submit" value="Go Back to Nurse Page">
</form>
