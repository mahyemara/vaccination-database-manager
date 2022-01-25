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

echo "Personal and Appointment Details: <br>";
$sql = "SELECT * FROM resident_address JOIN (resident JOIN appointment ON resident.hin=appointment.hin)
        ON resident_address.phone=resident.phone WHERE resident.hin like '%$hin%'
        Group By resident.phone, resident_address.phone, appointment.aid";
myTable($conn,$sql);

?>

<form action="resident.html" method="POST">
    <input type="submit" value="Go Back to Resident Page">
</form>