<!DOCTYPE html>
<html>
 <head>
  <title>Business Is Business - BiB, le jeu du monde des affaires</title>
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
		document.getElementById("txtHint").innerHTML="<p class=\"form-control-static\">Selectionnez des titres</p>";
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
<script>
$(document).ready(function(){
  $("#modal-dividendes").on('show.bs.modal', function () {

    if (window.XMLHttpRequest) {
      // code for IE7+, Firefox, Chrome, Opera, Safari
      xmlhttp=new XMLHttpRequest();
    } else { // code for IE6, IE5
      xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange=function() {
    if (xmlhttp.readyState==4 && xmlhttp.status==200) {
      document.getElementById("txt_table_dividendes").innerHTML=xmlhttp.responseText;
      }
    }
    xmlhttp.open("GET","update_dividendes.php?",true);
    xmlhttp.send();
  });
	$("#modal-impots").on('show.bs.modal', function () {

		if (window.XMLHttpRequest) {
			// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp=new XMLHttpRequest();
		} else { // code for IE6, IE5
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange=function() {
		if (xmlhttp.readyState==4 && xmlhttp.status==200) {
			document.getElementById("txt_table_impots").innerHTML=xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET","update_impots.php?",true);
		xmlhttp.send();
	});

});
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
				$titre_achete = '%'.$_POST["titre_achete"].'%';
				$quantite_titre_achete = test_input($_POST["quantite_titre_achete"]);
				$titre_achete2 = '%'.$_POST["titre_achete2"].'%';
				$quantite_titre_achete2 = test_input($_POST["quantite_titre_achete2"]);
				try {
				$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
				$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
				$stmt2 = $conn->prepare("select * from Gentlemen_conference where nom LIKE :acheteur");
				$stmt2->bindParam(':acheteur', $acheteur);
				$stmt2->execute();
				// set the resulting array to associative
				$result2 = $stmt2->setFetchMode(PDO::FETCH_ASSOC);
				while($result2 = $stmt2->fetch(PDO::FETCH_ASSOC)){
					$genID=$result2['GenID'];
					}
				$stmt2 = $conn->prepare("select * from Titres_conference where nom LIKE :titre");
				$stmt2->bindParam(':titre', $titre_achete);
				$stmt2->execute();
				// set the resulting array to associative
				$result2 = $stmt2->setFetchMode(PDO::FETCH_ASSOC);
				while($result2 = $stmt2->fetch(PDO::FETCH_ASSOC)){
					$titID=$result2['TitID'];
					}
				$stmt = $conn->prepare("CALL achat_titres_conference(:acheteurID, :titre_acheteID, :quantite_titre_achete)");
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
				$stmt = $conn->prepare("CALL add_ui_conference(:entreprise_ui, :quantite_UI_achete)");
				$stmt->bindParam(':entreprise_ui', $entreprise_ui);
				// $stmt->bindParam(':quantite_UI_achete', $titID);
				$stmt->bindParam(':quantite_UI_achete', $quantite_UI_achete);
				// adds UI
				$stmt->execute();
			}
			catch(PDOException $e) {
				echo "Error: " . $e->getMessage();
			}
			$conn = null;
		}
		elseif (!empty($_POST['fraudes-submit']))
		{
			$qtte_fraudes_genID_1 = test_input($_POST["qtte_fraudes_genID_1"]);
			$qtte_fraudes_genID_2 = test_input($_POST["qtte_fraudes_genID_2"]);
			$qtte_fraudes_genID_3 = test_input($_POST["qtte_fraudes_genID_3"]);
			$qtte_fraudes_genID_4 = test_input($_POST["qtte_fraudes_genID_4"]);
			$genID = 0;
			try {
				$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
				$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
				$stmt = $conn->prepare("CALL add_fraudes_conference(:genID, :qtte_fraudes)");
				$genID = 1;
				$stmt->bindParam(':genID', $genID);
				$stmt->bindParam(':qtte_fraudes', $qtte_fraudes_genID_1);
				// adds fraudes
				$stmt->execute();
				$genID = 2;
				$stmt->bindParam(':genID', $genID);
				$stmt->bindParam(':qtte_fraudes', $qtte_fraudes_genID_2);
				// adds fraudes
				$stmt->execute();
				$genID = 3;
				$stmt->bindParam(':genID', $genID);
				$stmt->bindParam(':qtte_fraudes', $qtte_fraudes_genID_3);
				// adds fraudes
				$stmt->execute();
				$genID = 4;
				$stmt->bindParam(':genID', $genID);
				$stmt->bindParam(':qtte_fraudes', $qtte_fraudes_genID_4);
				// adds fraudes
				$stmt->execute();
			}
			catch(PDOException $e) {
				echo "Error: " . $e->getMessage();
			}
			$conn = null;
		}
		elseif (!empty($_POST['politique-submit']))
		{
			$qtte_cn_PolID_1 = test_input($_POST["qtte_cn_PolID_1"]);
			$qtte_cn_PolID_2 = test_input($_POST["qtte_cn_PolID_2"]);
			try {
				$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
				$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
				$stmt = $conn->prepare("CALL add_caisse_noire_conference(:polID, :montant_cn)");
				$polID = 1;
				$stmt->bindParam(':polID', $polID);
				$stmt->bindParam(':montant_cn', $qtte_cn_PolID_1);
				// adds droite
				$stmt->execute();
				$polID = 2;
				$stmt->bindParam(':polID', $polID);
				$stmt->bindParam(':montant_cn', $qtte_cn_PolID_2);
				// adds gauche
				$stmt->execute();
			}
			catch(PDOException $e) {
				echo "Error: " . $e->getMessage();
			}
			$conn = null;
		}
		elseif (!empty($_POST['elections-submit']))
		{
			try {
				$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
				$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
				$stmt = $conn->prepare("CALL declenche_elections_conference()");
				// elections
				$stmt->execute();
			}
			catch(PDOException $e) {
				echo "Error: " . $e->getMessage();
			}
			$conn = null;
		}
    elseif (!empty($_POST['reinit-submit']))
    {
      try {
        $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $stmt = $conn->prepare("CALL init_bib_conference()");
        // elections
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
	<h1>Business Is Business Conférence</h1>
	</div>

	<div class="row">
		<div class="col-sm-2 col-md-2">
		</br>
		<div class="MenuBar">
		<ul>
			<li><a href="index.html">Le Lobby</a></li>
			<li><a href="entreprises.php">Les Entreprises</a></li>
			<li><a href="titres.php">Les Titres</a></li>
			<li><a href="gentlemen.php">Les Gentlemen</a></li>
			<!--<li><a href="mainboard.php">Le Board</a></li>-->
			<li><a href="mainboard_conference.php">Le Board Conference</a></li>
		</ul>
		</div>
			<br>
			<table class="table table-bordered table-condensed table-striped table-hover table-titres">
			<tr>
				<th style="text-align:center">Casiers Judiciaires</th>
			</tr>
			<?php
			include 'base.php';
			try {
				$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
				$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
				$stmt = $conn->prepare("SELECT * FROM Gentlemen_conference");
				$stmt->execute();
				// set the resulting array to associative
				$result = $stmt->setFetchMode(PDO::FETCH_ASSOC);
				while ($result = $stmt->fetch(PDO::FETCH_ASSOC)){
					print '<tr><td><a data-toggle="modal" data-target="#modal-fraudes" href="">'.$result['Nom'].'<span class="badge alert-info  pull-right">'.$result['Nb_Fraudes'].'</span>'.'</a></td></tr>';
				}
			}
			catch(PDOException $e) {
				echo "Error: " . $e->getMessage();
			}
			$conn = null;
			?>
			</table>
			<br><table class="table table-bordered table-condensed table-striped table-hover table-titres" style="text-align:center">
			<tr>
				<th colspan="2" style="text-align:center">Caisses Noires</th>
			</tr>
			<?php
			include 'base.php';
			try {
				$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
				$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
				$stmt = $conn->prepare("SELECT * FROM Politique_conference ORDER BY Nom DESC");
				$stmt->execute();
				// set the resulting array to associative
				$result = $stmt->setFetchMode(PDO::FETCH_ASSOC);
				print '<tr>';
				$parti_actif='';
				while ($result = $stmt->fetch(PDO::FETCH_ASSOC)){
					print '<td><a data-toggle="modal" data-target="#modal-politique" href="">'.$result['Nom'].'</a></td>';
					if ($result['Actif']) {$parti_actif=$result['Nom'];}
				}
				print '</tr>';
				print '<tr>';
				$stmt->execute();
				while ($result = $stmt->fetch(PDO::FETCH_ASSOC)){
					print '<td><a data-toggle="modal" data-target="#modal-politique" href="">'.$result['Caisse_Noire'].'</a></td>';
				}
				print '</tr>';
				print '<tr><th colspan="2" style="text-align:center">Parti au Pouvoir</th></tr>';
				print '<tr><td colspan="2" class="parti-'.$parti_actif.'" style="text-align:center"><a data-toggle="modal" data-target="#modal-elections" href="">'.$parti_actif.'<a></td></tr>';
			}
			catch(PDOException $e) {
				echo "Error: " . $e->getMessage();
			}
			$conn = null;
			?>
			</table>
		</div>
		<!-- Modal Fraudes -->
		<div id="modal-fraudes" class="modal fade" role="dialog">
			<div class="modal-dialog modal-fraudes">
		<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header" style="background-color:#914800; color:orange;">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Ajouter/Blanchir des Fraudes</h4>
					</div>
					<div class="modal-body ">
						<form class="form-horizontal" method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
							<div class="form-group form-group-sm">
								<?php include 'base.php';
									try {
										$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
										$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
										$stmt2 = $conn->prepare("SELECT * FROM Gentlemen_conference");
										$stmt2->execute();
										// set the resulting array to associative
										$result2 = $stmt2->setFetchMode(PDO::FETCH_ASSOC);
										while ($result2 = $stmt2->fetch(PDO::FETCH_ASSOC)){
											print '<label for="qtte_fraudes_genID_'.$result2['GenID'].'" class="col-sm-3 control-label">'.$result2['Nom'].'</label>'."\n";
											print '<div class="col-sm-9">'."\n";
											print '<input type="number" class="form-control" id="qtte_fraudes_genID_'.$result2['GenID'].'" name="qtte_fraudes_genID_'.$result2['GenID'].'" placeholder=0>'."\n";
											print '</div>'."\n";
										}
									}
									catch(PDOException $e) {
										echo "Error: " . $e->getMessage();
									}
									$conn = null;
								?>
							</div>
							<div class="form-group form-group-sm">
								<div class="col-sm-12">
									<div class="modal-footer">
										<input name="fraudes-submit" class="btn " type="submit" value="Valider">
										<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- FIN Modal Fraudes -->

		<!-- Modal Politique -->
		<div id="modal-politique" class="modal fade" role="dialog">
			<div class="modal-dialog modal-politique">
		<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header" style="background-color:#914800; color:orange;">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Alimenter les Caisses Noires</h4>
					</div>
					<div class="modal-body ">
						<form class="form-horizontal" method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
							<div class="form-group form-group-sm">
								<?php include 'base.php';
									try {
										$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
										$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
										$stmt2 = $conn->prepare("SELECT * FROM Politique_conference ORDER BY Nom DESC");
										$stmt2->execute();
										// set the resulting array to associative
										$result2 = $stmt2->setFetchMode(PDO::FETCH_ASSOC);
										while ($result2 = $stmt2->fetch(PDO::FETCH_ASSOC)){
											print '<label for="qtte_cn_PolID_'.$result2['PolID'].'" class="col-sm-3 control-label  parti-'.$result2['Nom'].'">'.$result2['Nom'].'</label>'."\n";
											print '<div class="col-sm-9">'."\n";
											print '<input type="number" class="form-control" id="qtte_cn_PolID_'.$result2['PolID'].'" name="qtte_cn_PolID_'.$result2['PolID'].'" placeholder=0>'."\n";
											print '</div>'."\n";
										}
									}
									catch(PDOException $e) {
										echo "Error: " . $e->getMessage();
									}
									$conn = null;
								?>
							</div>
							<div class="form-group form-group-sm">
								<div class="col-sm-12">
									<div class="modal-footer">
										<input name="politique-submit" class="btn " type="submit" value="Valider">
										<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- FIN Modal Politique  -->

		<!-- Modal Elections -->
		<div id="modal-elections" class="modal fade" role="dialog">
			<div class="modal-dialog modal-politique">
		<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header" style="background-color:#914800; color:orange;">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Elections</h4>
					</div>
					<div class="modal-body ">
						<form class="form-horizontal" method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
							<div class="form-group form-group-sm">
								<div class="col-sm-12">
									<label for="valid-elections" class="control-label">Declencher des Elections ?</label>
								</div>
							</div>
							<div class="form-group form-group-sm">
								<div class="col-sm-12">
									<div class="modal-footer">
										<input name="elections-submit" class="btn " type="submit" value="Valider">
										<button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- FIN Modal Elections -->
    <!-- Modal Reinit -->
		<div id="modal-reinit" class="modal fade" role="dialog">
			<div class="modal-dialog modal-politique">
		<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header" style="background-color:#914800; color:orange;">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Reinitilisation du Jeu</h4>
					</div>
					<div class="modal-body ">
						<form class="form-horizontal" method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
							<div class="form-group form-group-sm">
								<div class="col-sm-12">
									<label for="valid-reinit" class="control-label">Reinitialiser le Jeu ?</label>
								</div>
							</div>
							<div class="form-group form-group-sm">
								<div class="col-sm-12">
									<div class="modal-footer">
										<input name="reinit-submit" class="btn " type="submit" value="Valider">
										<button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- FIN Modal Reinit -->

		<div class="col-sm-4 col-md-3">
			<br>
			<table class="table table-bordered table-condensed table-entreprises" >
			<tr>
				<th>Administrateur</th>
				<th>UI</th>
				<th>Salaire</th>
			</tr>
			<?php
			include 'base.php';
			try {
				$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
				$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
				$stmt2 = $conn->prepare("SELECT * FROM Secteurs_conference");
				$stmt2->execute();
				// set the resulting array to associative
				$result2 = $stmt2->setFetchMode(PDO::FETCH_ASSOC);
				while ($result2 = $stmt2->fetch(PDO::FETCH_ASSOC)){
					$sect=$result2['SectID'];
					$stmt = $conn->prepare("SELECT * FROM Entreprises_conference where sectID=$sect ORDER BY EntID");
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
		<div class="col-sm-6 col-md-7">
			</br>
			<div class="row">
			<div class="col-sm-12 col-md-8 col-lg-8">
				<table class="table table-bordered table-striped table-condensed table-hover table-titres">
					<tr>
						<th>Main d'oeuvre</th>
						<th>Cours</th>
						<?php
						include 'base.php';
						try {
							$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
							$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
							$stmt2 = $conn->prepare("SELECT Nom FROM Gentlemen_conference ORDER BY GenID");
							$stmt2->execute();
							// set the resulting array to associative
							$result2 = $stmt2->setFetchMode(PDO::FETCH_ASSOC);
							while ($result2 = $stmt2->fetch(PDO::FETCH_ASSOC)){
								print '<th>'.$result2['Nom'].'</th>';
							}
						}
						catch(PDOException $e) {
							echo "Error: " . $e->getMessage();
						}
						$conn = null;
						?>
						<th>Nb emis</th>

					</tr>
				<?php
				include 'base.php';
				try {
					$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
					$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
					$stmt = $conn->prepare("SELECT * FROM RECAP_TITRES_conference ORDER BY TitID");
					$stmt->execute();
					// set the resulting array to associative
					$result = $stmt->setFetchMode(PDO::FETCH_ASSOC);
					while ($result = $stmt->fetch(PDO::FETCH_ASSOC)){
						$titre_id_encours=$result['TitID'];
						$maj_id=$result['MajID'];
						print '<tr><td>'.$result['Titre'].'</td><td>'.$result['tarif'].'</td>';
						$stmt3 = $conn->prepare("SELECT * FROM Portfolio_conference WHERE TitID=$titre_id_encours ORDER BY GenID");
						$stmt3->execute();
						$result3 = $stmt3->setFetchMode(PDO::FETCH_ASSOC);
						while ($result3 = $stmt3->fetch(PDO::FETCH_ASSOC)){
							$style_maj="";
							if ($maj_id == $result3['GenID'])
								{ $style_maj=' style="color:red"';
								}
							print '<td'.$style_maj.'>'.$result3['Nb'].'</td>';
						}
						print '<td>'.$result['total_possedes'].'</td></tr>';
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
							<label for="acheteur" class="col-sm-3 col-md-3 col-lg-2 control-label">Acheteur</label>
							<div class="col-sm-9 col-md-9 col-lg-10">
							  <select class="form-control" id="acheteur" name="acheteur">
								<option value=""></option>
								<?php include 'optionsJoueurs.php'; ?>
							  </select>
							</div>
						  </div>
						  <div class="form-group form-group-sm">
							<label for="titre_achete" class="col-sm-3 col-md-3 col-lg-2 control-label">MO 1</label>
							<div class="col-sm-5 col-md-5 col-lg-6">
							  <select class="form-control" id="titre_achete" name="titre_achete" onchange="showMontant()">
								<option value=""></option>
								<?php include 'optionsTitres.php'; ?>
							</select>
							</div>
							<div class="col-sm-1 col-md-1 col-lg-1">
								*
							</div>
							<div class="col-sm-3 col-md-3 col-lg-3">
								<input type="number" class="form-control" id="quantite_titre_achete" name="quantite_titre_achete" onkeyup="showMontant()" onmouseup="showMontant()" max="50" placeholder=0>
							</div>
						  </div>
						  <div class="form-group form-group-sm">
							<label for="titre_achete2" class="col-sm-3 col-md-3 col-lg-2 control-label">MO 2</label>
							<div class="col-sm-5 col-md-5 col-lg-6">
							  <select class="form-control" id="titre_achete2" name="titre_achete2" onchange="showMontant()">
								<option value=""></option>
								<?php include 'optionsTitres.php'; ?>
							</select>
							</div>
							<div class="col-sm-1 col-md-1 col-lg-1">
								*
							</div>
							<div class="col-sm-3 col-md-3 col-lg-3">
								<input type="number" class="form-control" id="quantite_titre_achete2" name="quantite_titre_achete2" onkeyup="showMontant()" onmouseup="showMontant()" max="50" placeholder=0>
							</div>
						  </div>
						  <div class="form-group form-group-sm">
							<div class="col-sm-6" id="txtHint">
							<p class="form-control-static">Selectionnez de la MO</p>
							</div>
							<div class="col-sm-6 align-right">
							  <span class="pull-right"><input name="titres-submit" class="btn btn-primary" type="submit" value="Valider l'Ordre"></span>
							</div>
						  </div>
						</form>
        <!-- Rajout NL 24/01/2017 -->
        <div class="btn-group">
          <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modal-impots">Charges Sociales</button>
          <button type="button" class="btn btn-success" data-toggle="modal" data-target="#modal-dividendes">Benefices</button>
          <?php
    			include 'base.php';
    			try {
    				$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    				$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    				$stmt = $conn->prepare("SELECT * FROM Constantes_conference WHERE Nom LIKE 'PROCASH'");
    				$stmt->execute();
    				// set the resulting array to associative
    				$result = $stmt->setFetchMode(PDO::FETCH_ASSOC);
    				while ($result = $stmt->fetch(PDO::FETCH_ASSOC)){
    					//print '<p class="form-control-static" style="background-color:#914800; color:orange;text-align:center">PROCASH : '.$result['Valeur'].'</p>';
              print '<button type="button" class="btn btn-warning">PROCASH : '.$result['Valeur'].'</button>';
    				}
    			}
    			catch(PDOException $e) {
    				echo "Error: " . $e->getMessage();
    			}
    			$conn = null;
    		?>
        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#modal-reinit">Re-Init</button>
        </div>
        <!-- FIN Rajout NL 24/01/2017 -->
        <!-- Modal Impots -->
				<div id="modal-impots" class="modal fade" role="dialog">
					<div class="modal-dialog modal-impots">
				<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header" style="background-color:#914800; color:orange;">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">Charges Sociales</h4>
							</div>
							<div class="modal-body" id="txt_table_impots">
								<table class="table table-bordered table-condensed table-striped table-titres" >
								<tr>
									<th>Gentleman</th>
									<th>Assiette</th>
									<th>Taux de Charges</th>
									<th>Charges Sociales</th>
								</tr>
								</table>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
							</div>
						</div>
					</div>
				</div>
				<!-- FIN Modal Impots -->
        <!-- Modal Dividendes -->
        <div id="modal-dividendes" class="modal fade" role="dialog">
          <div class="modal-dialog modal-impots">
        <!-- Modal content-->
            <div class="modal-content">
              <div class="modal-header" style="background-color:#914800; color:orange;">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Bénéfices</h4>
              </div>
              <div class="modal-body" id="txt_table_dividendes">
                <table class="table table-bordered table-condensed table-striped table-titres" >
                <tr>
                  <th>Gentleman</th>
                  <th>Assiette</th>
                  <th>Taux</th>
                  <th>Bénéfices</th>
                </tr>
                </table>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
              </div>
            </div>
          </div>
        </div>
        <!-- FIN Modal Dividendes -->

			</div>
			<div class="col-sm-12 col-md-4 col-lg-4">
				<table class="table table-bordered table-striped table-condensed table-hover table-titres">
					<tr><th>Main d'oeuvre</th><th>Nb</th><th>Valeur</th></tr>
					<?php
					include 'base.php';
					try {
						$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
						$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

						$stmt2 = $conn->prepare("SELECT * FROM RECAP_GENTLEMEN_conference");
						$stmt2->execute();
						// set the resulting array to associative
						$result2 = $stmt2->setFetchMode(PDO::FETCH_ASSOC);
						while ($result2 = $stmt2->fetch(PDO::FETCH_ASSOC)){
							$gen=$result2['GenID'];
							$nb_derricks=$result2['Nb_Derricks'];
							if ($nb_derricks == "") {$nb_derricks=0;}
							print '<tr><th colspan=4 style="text-align:center">'.$result2['Nom'].'<span class="badge alert-info  pull-right">'.$nb_derricks.'</span>'.'</th></tr>';
							$stmt = $conn->prepare("SELECT * from RECAP_PORTFOLIO_conference where genID=$gen ORDER BY TitID");
							$stmt->execute();
							$result = $stmt->setFetchMode(PDO::FETCH_ASSOC);
							while($result = $stmt->fetch(PDO::FETCH_ASSOC)){
								$major='';
								$style_maj="";
								if ($result['is_majoritaire']) {
									$major='MAJOR.';
									$style_maj=' style="color:red"';}
								print '<tr><td>'.$result['Titre'].'</td><td'.$style_maj.'>'.$result['Nb'].'</td><td>'.$result['Montant'].'</td></tr>';
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
	</div>
	</div>
	<div class="col-sm-12 footer">
	Created by: Gunard
	</div>

</div>

<?php include 'modalsUI.php'; ?>

</body>
</html>
