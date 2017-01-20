<!DOCTYPE html>
<html>
 <head>
  <title>Business Is Business</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="BiBstyle.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>  
<script>
	function showMontant() {
		//document.write("quantite");
		var quantite=document.getElementById("quantite_titre_achete").value;
		var quantite2=document.getElementById("quantite_titre_achete2").value;
		var titre=document.getElementById("titre_achete").value;
		var titre2=document.getElementById("titre_achete2").value;

		//document.write(quantite2);
	  if (titre=="" && titre2=="") {
		document.getElementById("txtHint").innerHTML="<p class=\"form-control-static\">Veuillez sélectionner des titres</p>";
		return;
	  } 
	  if (window.XMLHttpRequest) {
		// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp=new XMLHttpRequest();
	  } else { // code for IE6, IE5
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	  }
	  xmlhttp.onreadystatechange=function() {
		if (xmlhttp.readyState==4 && xmlhttp.status==200) {
		  document.getElementById("txtHint").innerHTML=xmlhttp.responseText;
		}
	  }
	  xmlhttp.open("GET","calcul_transaction.php?t="+titre+"&q="+quantite+"&t2="+titre2+"&q2="+quantite2,true);
	  xmlhttp.send();
	}
</script>  
 <?php
	// define variables and set to empty values
	$acheteur = $titre_achete = $titre_achete2 = "";
	$quantite_titre_achete = $quantite_titre_achete2 = $genID = $titID = 0;

	function test_input($data) {
	   $data = trim($data);
	   $data = stripslashes($data);
	   $data = htmlspecialchars($data);
	   return $data;
	}

	if ($_SERVER["REQUEST_METHOD"] == "POST") {		
		include 'base.php';
		if (!empty($_POST['titres-submit'])) 
			{
			   //do something here;
				$acheteur = '%'.test_input($_POST["acheteur"]).'%';
				$titre_achete = test_input($_POST["titre_achete"]);
				$quantite_titre_achete = test_input($_POST["quantite_titre_achete"]);
				$titre_achete2 = test_input($_POST["titre_achete2"]);
				$quantite_titre_achete2 = test_input($_POST["quantite_titre_achete2"]);
				try {
				$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
				$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
				$stmt2 = $conn->prepare("select * from Gentlemen where nom LIKE :acheteur"); 
				$stmt2->bindParam(':acheteur', $acheteur);
				$stmt2->execute();
				// set the resulting array to associative
				$result2 = $stmt2->setFetchMode(PDO::FETCH_ASSOC);
				while($result2 = $stmt2->fetch(PDO::FETCH_ASSOC)){ 
					$genID=$result2['GenID']; 
					}
				$stmt2 = $conn->prepare("select * from Titres where nom LIKE :titre"); 
				$stmt2->bindParam(':titre', $titre_achete);
				$stmt2->execute();
				// set the resulting array to associative
				$result2 = $stmt2->setFetchMode(PDO::FETCH_ASSOC);
				while($result2 = $stmt2->fetch(PDO::FETCH_ASSOC)){ 
					$titID=$result2['TitID']; 
					}
				$stmt = $conn->prepare("CALL achat_titres(:acheteurID, :titre_acheteID, :quantite_titre_achete)");
				$stmt->bindParam(':acheteurID', $genID);
				$stmt->bindParam(':titre_acheteID', $titID);
				$stmt->bindParam(':quantite_titre_achete', $quantite_titre_achete);
				// achat 1er titre
				$stmt->execute();
				// set variables pour acaht 2eme titre
				$stmt2->bindParam(':titre', $titre_achete2);
				$stmt2->execute();
				// set the resulting array to associative
				$result2 = $stmt2->setFetchMode(PDO::FETCH_ASSOC);
				while($result2 = $stmt2->fetch(PDO::FETCH_ASSOC)){ 
					$titID=$result2['TitID']; 
					}
				$quantite_titre_achete=$quantite_titre_achete2;
				// achat 2eme titre
				$stmt->execute();
			}
			catch(PDOException $e) {
				echo "Error: " . $e->getMessage();
			}
			$conn = null;
		}
		elseif (!empty($_POST['ui-submit'])) 
		{
			$entreprise_ui=test_input($_POST["entreprise_ui"]);
			$quantite_UI_achete = test_input($_POST["quantite_UI_achete"]);
			try {
				$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
				$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
				$stmt = $conn->prepare("CALL add_ui(:entreprise_ui, :quantite_UI_achete)");
				$stmt->bindParam(':entreprise_ui', $entreprise_ui);
				$stmt->bindParam(':quantite_UI_achete', $titID);
				$stmt->bindParam(':quantite_UI_achete', $quantite_UI_achete);
				// adds UI
				$stmt->execute();
			}
			catch(PDOException $e) {
				echo "Error: " . $e->getMessage();
			}
			$conn = null;
		}
	}
?>
 </head>
 
<body>
<div class="container-fluid">
	<div class="header">
	<h1>Business Is Business</h1>
	</div>

	<div class="row">
		<div class="col-sm-2 MenuBar">
		</br>
		<ul>
			<li><a href="index.html">Le Lobby</a></li>
			<li><a href="entreprises.php">Les Entreprises</a></li>
			<li><a href="titres.php">Les Titres</a></li>
			<li><a href="gentlemen.php">Les Gentlemen</a></li>
			<li><a href="mainboard.php">Le Board</a></li>
			<li><a href="mainboard2.php">Le Board 2</a></li>
		</ul>
		<?php
			echo "<h2>Your Input:</h2>";
			echo $acheteur;
			echo "<br>t1 :";
			echo $titre_achete;
			echo "<br>Q1 :";
			echo $quantite_titre_achete;
			echo "<br>GenID : ";
			echo $genID;
			echo "<br> T2 : ";
			echo $titre_achete2;
			echo "<br> Q2 : ";
			echo $quantite_titre_achete2;
			echo "<br> GenID :";
			echo $genID;
		?>
		<a data-toggle="modal" data-target="#modal-1" style="color:black" href="">Test UI Auroch's Sportif</a>
		</div>
		
		<div class="col-sm-3">
			<br>
			<table class="table table-bordered table-condensed table-entreprises" >
			<tr>
				<th>Entreprise</th>
				<th>UI</th>
				<th>Tarif</th>
			</tr>
			<?php
			include 'base.php';
			try {
				$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
				$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
				$stmt2 = $conn->prepare("SELECT * FROM Secteurs"); 
				$stmt2->execute();
				// set the resulting array to associative
				$result2 = $stmt2->setFetchMode(PDO::FETCH_ASSOC);
				while ($result2 = $stmt2->fetch(PDO::FETCH_ASSOC)){
					$sect=$result2['SectID'];
					$stmt = $conn->prepare("SELECT * FROM Entreprises where sectID=$sect ORDER BY EntID"); 
					$stmt->execute();
					// set the resulting array to associative
					$result = $stmt->setFetchMode(PDO::FETCH_ASSOC);
					while ($result = $stmt->fetch(PDO::FETCH_ASSOC)){
						print '<tr class="table-'.$result2['Nom'].'"><td class="table-'.$result2['Nom'].'"><a data-toggle="modal" data-target="#modal-'.$result['EntID'].'" href="">'.$result['Nom'].'</a></td><td>'.$result['UI'].'</td><td>'.$result['Tarif'].'</td></tr>';
					}
				}
			}
			catch(PDOException $e) {
				echo "Error: " . $e->getMessage();
			}
			$conn = null;
			?>
			</table>
		</div>
		<div class="col-sm-4">
			</br>
			<table class="table table-bordered table-striped table-condensed table-hover table-titres" >
			<tr>
				<th>Titre</th>
				<th>Cours</th>
				<th>Nb émis</th>
				<th>Action. Major.</th>
			</tr>
			<?php
			include 'base.php';
			try {
				$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
				$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
				$stmt = $conn->prepare("SELECT * FROM RECAP_TITRES ORDER BY TitID"); 
				$stmt->execute();
				// set the resulting array to associative
				$result = $stmt->setFetchMode(PDO::FETCH_ASSOC);
				while ($result = $stmt->fetch(PDO::FETCH_ASSOC)){
					print '<tr><td>'.$result['Titre'].'</td><td>'.$result['tarif'].'</td><td>'.$result['total_possedes'].'</td><td>'.$result['Gentleman_majoritaire'].'</td></tr>';
				}
				
			}
			catch(PDOException $e) {
				echo "Error: " . $e->getMessage();
			}
			$conn = null;
			?>
			</table>

			<form class="form-horizontal" method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
			  <div class="form-group  form-group-sm">
				<label for="acheteur" class="col-sm-2 control-label">Acheteur</label>
				<div class="col-sm-10">
				  <input type="text" class="form-control" id="acheteur" name="acheteur" placeholder="Acheteur">
				</div>
			  </div>
			  <div class="form-group form-group-sm">
				<label for="titre_achete" class="col-sm-2 control-label">Titre 1</label>
				<div class="col-sm-6">
				  <select class="form-control" id="titre_achete" name="titre_achete" onchange="showMontant()">
					<option value=""></option>
					<?php include 'optionsTitres.php'; ?>
				</select>
				</div>
				<div class="col-sm-1">
					*
				</div>
				<div class="col-sm-3">
					<input type="number" class="form-control" id="quantite_titre_achete" name="quantite_titre_achete" onkeyup="showMontant()" onmouseup="showMontant()" max="50" placeholder=0>
				</div>
			  </div>
			  <div class="form-group form-group-sm">
				<label for="titre_achete2" class="col-sm-2 control-label">Titre 2</label>
				<div class="col-sm-6">
				  <select class="form-control" id="titre_achete2" name="titre_achete2" onchange="showMontant()">
					<option value=""></option>
					<?php include 'optionsTitres.php'; ?>
				</select>
				</div>
				<div class="col-sm-1">
					*
				</div>
				<div class="col-sm-3">
					<input type="number" class="form-control" id="quantite_titre_achete2" name="quantite_titre_achete2" onkeyup="showMontant()" onmouseup="showMontant()" max="50" placeholder=0>
				</div>
			  </div>
			  <div class="form-group form-group-sm">
				<div class="col-sm-6" id="txtHint">
				<p class="form-control-static">Veuillez sélectionner des titres</p>				
				</div>
				<div class="col-sm-6 align-right">
				  <span class="pull-right"><input name="titres-submit" class="btn btn-primary" type="submit" value="Valider l'Ordre"></span>
				</div>
			  </div>
			</form>
		</div>
		<div class="col-sm-3">
			</br>
			<table class="table table-bordered table-striped table-condensed table-hover">
				<tr><th>Titre</th><th>Nb</th><th>Valeur</th><th>Major.</th></tr>
				<?php
				include 'base.php';
				try {
					$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
					$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
					
					$stmt2 = $conn->prepare("SELECT * FROM RECAP_GENTLEMEN"); 
					$stmt2->execute();
					
					// set the resulting array to associative
					$result2 = $stmt2->setFetchMode(PDO::FETCH_ASSOC);
					while ($result2 = $stmt2->fetch(PDO::FETCH_ASSOC)){
						$gen=$result2['GenID'];
						$nb_derricks=$result2['Nb_Derricks'];
						if ($nb_derricks == "") {$nb_derricks=0;}
						print '<tr><th colspan=4 style="text-align:center">'.$result2['Nom'].'<span class="label label-success  pull-right">'.$nb_derricks.'</span>'.'</th></tr>';
						$stmt = $conn->prepare("SELECT * from RECAP_PORTFOLIO where genID=$gen ORDER BY TitID"); 
						$stmt->execute();
						$result = $stmt->setFetchMode(PDO::FETCH_ASSOC);
						while($result = $stmt->fetch(PDO::FETCH_ASSOC)){
						$major='';
						if ($result['is_majoritaire']) {$major='MAJOR.';}
						print '<tr><td>'.$result['Titre'].'</td><td>'.$result['Nb'].'</td><td>'.$result['Montant'].'</td><td>'.$major.'</td></tr>'; 
						}
						//print '</tr>';
					}
				}
				catch(PDOException $e) {
					echo "Error: " . $e->getMessage();
				}
				$conn = null;
				echo "</table>";
				?>
			</table>
		</div>
	</div>
	<div class="col-sm-12 footer">
	Created by: Gunard
	</div>
</div>

<?php include 'modalsUI.php'; ?>

</body>
</html>
