
<html>
 <head>
  <title>Business Is Business Conférence</title>
  <link rel="stylesheet" type="text/css" href="BiBstyle.css">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
 </head>


<div class="section">
<h1>Les Titres</h1>
<p>
<table style="width:100%">
	<tr>
		<th>Titre</th>
	</tr>
<?php
include 'base.php';
try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$stmt = $conn->prepare("SELECT * FROM Titres_conference");
    $stmt->execute();
	// set the resulting array to associative
    $result = $stmt->setFetchMode(PDO::FETCH_ASSOC);
	while ($result = $stmt->fetch(PDO::FETCH_ASSOC)){
		print '<tr><td>'.$result['Nom'].'</td></tr>';
	}

}
catch(PDOException $e) {
    echo "Error: " . $e->getMessage();
}
$conn = null;
?>

</table>
</p>

</div>
</html>
