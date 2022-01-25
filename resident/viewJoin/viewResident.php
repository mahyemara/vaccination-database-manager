<style>
    body {
        background-color: #DBF9FC;
    }
</style>

<?php
include'connect.php';
include'myTable.php';
$hin= $_POST['hin'];
$conn = OpenCon();

echo "Types of Vaccine you have taken: <br>";
$sql = "SELECT DISTINCT company FROM administers a WHERE a.hin like '%$hin%'";
myTable($conn,$sql);

echo "Side Effects you have exhibited (if no table, then you have exhibited none): <br>";
$sql = "SELECT name FROM exhibit WHERE hin like '%$hin%'";
myTable($conn,$sql);

echo "Your previous CID(s) (if no table, then you have none): <br>";
$sql = "SELECT cid FROM vaccination_certificate_generate WHERE hin like '%$hin%'";
myTable($conn,$sql);

?>

<form action="resident.html" method="POST">
    <input type="submit" value="Go Back to Resident Page">
</form>