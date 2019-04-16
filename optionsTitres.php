<?php include 'base.php';

try {

	$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
	$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$stmt = $conn->prepare("SELECT * from Titres_conference ORDER BY TitID");
	$stmt->execute();
	$result = $stmt->setFetchMode(PDO::FETCH_ASSOC);
	while($result = $stmt->fetch(PDO::FETCH_ASSOC)){
			print '<option value="'.$result['Nom'].'">'.$result['Nom'].'</option>'."\n";
		}
	}
	catch(PDOException $e) {
		echo "Error: " . $e->getMessage();
	}
	$conn = null;

?>
