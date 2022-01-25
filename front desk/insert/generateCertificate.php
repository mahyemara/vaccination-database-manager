<style>
    body {
        background-color: #DBF9FC;
    }
</style>

<?php

include 'connect.php';
$eid = $_POST['eid'];
$hin = $_POST['hin'];
$conn = OpenCon();

$sql = "INSERT INTO `vaccination_certificate_generate` (`eid`, `hin`) VALUES ('$eid', '$hin')";
if ($conn->query($sql) ===
    TRUE) {
    echo "Certificate generated successfully. Please view resident information to view CID";
} else {
    echo "Error updating record: " . $conn->error;
}
?>


<form action="frontDesk.html" method="POST">
    <input type="submit" value="Go Back to Front Desk Page">
</form>
