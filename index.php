<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Kovács István Gábor</title>
</head>
<body>
    <?php
        $tomb = array (
            array("Nagy János","Nagykanizsa",200),
            array("Kovács Imre","Budapest",190),
            array("Ábrahám Atácska","Győr",180),
            array("Nagy Imre","Miskolc",160)
        );
            echo $tomb[0][0]."  ".$tomb[0][1]."  ".$tomb[0][2].".<br>";
            echo $tomb[1][0]."  ".$tomb[1][1]."  ".$tomb[1][2].".<br>";
            echo $tomb[2][0]."  ".$tomb[2][1]."  ".$tomb[2][2].".<br>";
            echo $tomb[3][0]."  ".$tomb[3][1]."  ".$tomb[3][2].".<br>";
    ?>
</body>
</html>