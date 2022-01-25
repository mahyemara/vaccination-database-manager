<style>
    body {
        background-color: #DBF9FC;
    }
</style>

<form action="process-update.php"
      method="post"> USED BY NURSE: Update the Resident Dose Number

    </br>
    </br>
    <label>Resident</label>
    <?php
    include 'connect.php';
    $conn = OpenCon();
    $result = $conn->query("select hin from resident");
    echo "<select name='id'>";

    while ($row = $result->fetch_assoc()) {
        unset($hin);
        $hin = $row['hin'];
        echo '<option value="'.$hin.'">'.$hin.'</option>';
    }
    echo "</select>";
    ?>
    <br>
    <label> Dose Number </label>
    <input name="doseNumber" type="text"
           placeholder="Enter new dose number">
    <br>
    <br>
    <input type="submit" value="Search">

</form>

<form action="nurse.html" method="POST">
    <input type="submit" value="Go Back to Nurse Page">
</form>