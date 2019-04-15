<!DOCTYPE html>
<html>
<head>

</head>
<body>

<?php

include 'base.php';
try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

	$stmt = $conn->prepare("CALL update_taux_dividendes_conference()");
	$stmt->execute();
	}
catch(PDOException $e) {
    echo "Error: " . $e->getMessage();
}

print '<table class="table table-bordered table-condensed table-striped table-titres" >';
print '								<tr>';
print '									<th>Gentleman</th>';
print '									<th>Assiette</th>';
print '									<th>Taux</th>';
print '									<th>Dividendes</th>';
print '								</tr>';

try {
	$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
	$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$stmt = $conn->prepare("SELECT * FROM RECAP_DIVIDENDES_conference ORDER BY GenID");
	$stmt->execute();
	// set the resulting array to associative
	$result = $stmt->setFetchMode(PDO::FETCH_ASSOC);
	while ($result = $stmt->fetch(PDO::FETCH_ASSOC)){
		print '<tr><td>'.$result['Nom'].'</td><td>'.$result['Capital'].'</td><td>'.$result['Taux_dividendes'].' %</td><td>'.$result['Dividendes'].'</td></tr>';
	}
}
catch(PDOException $e) {
	echo "Error: " . $e->getMessage();
}
print '								</table>';
$conn = null;
?>

</body>
</html>
