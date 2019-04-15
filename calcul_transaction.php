<!DOCTYPE html>
<html>
<head>

</head>
<body>

<?php
$titre = "'%".$_GET['t']."%'";
$qtte = intval($_GET['q']);
$titre2 = "'%".$_GET['t2']."%'";
$qtte2 = intval($_GET['q2']);
//print $qtte;
//print $titre;
//$q="'%Croquenroute%'";
include 'base.php';
try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	if ($titre=="'%%'"){
		$montant_transaction=0;
	}
	else {
		$stmt = $conn->prepare("SELECT * FROM Titres_conference WHERE Nom LIKE $titre");
		$stmt->execute();
		// set the resulting array to associative
		$result = $stmt->setFetchMode(PDO::FETCH_ASSOC);
		while ($result = $stmt->fetch(PDO::FETCH_ASSOC)){
			// print '<tr><td>'.$result['Nom'].'</td><td>'.$result['Tarif'].'</td></tr>';
			$montant_transaction=$result['Tarif']*$qtte;
			// print 'Montant : '.$montant_transaction;
		}
	}
	if ($titre2=="'%%'"){
		$montant_transaction2=0;
	}
	else {
		$stmt2 = $conn->prepare("SELECT * FROM Titres_conference WHERE Nom LIKE $titre2");
		$stmt2->execute();
		// set the resulting array to associative
		$result2 = $stmt2->setFetchMode(PDO::FETCH_ASSOC);
		while ($result2 = $stmt2->fetch(PDO::FETCH_ASSOC)){
			// print '<tr><td>'.$result['Nom'].'</td><td>'.$result['Tarif'].'</td></tr>';
			$montant_transaction2=$result2['Tarif']*$qtte2;
			// print 'Montant 2 : '.$montant_transaction;
		}
	}
	$stmt = $conn->prepare("SELECT Valeur FROM Constantes_conference WHERE Nom LIKE 'ARRONDI_TARIF_ENT'");
	$stmt->execute();
	$arrondi=1;
	while ($result = $stmt->fetch(PDO::FETCH_ASSOC)){
			$arrondi=$result['Valeur'];
		}
	$montant_total=ceil(($montant_transaction+$montant_transaction2)/$arrondi)*$arrondi;
	// rendre un champ static pour le formulaire ex :<p class="form-control-static">Veuillez selectionner des titres</p>
	print '<p class="form-control-static">Montant : '.$montant_total.'</p>';
}
catch(PDOException $e) {
    echo "Error: " . $e->getMessage();
}
$conn = null;
?>

</body>
</html>
