<!DOCTYPE html>
<html>
 <head>
  <title>Business Is Business</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="BiBstyle.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
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
			<li><a href="mainboard2.php">Le Board</a></li>
		</ul>
		</div>
		<div class="col-sm-10">
		<h1>Les Entreprises</h1>
		<p>
		<table  class="table table-bordered table-condensed table-entreprises">
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
						print '<tr class="table-'.$result2['Nom'].'"><td>'.$result['Nom'].'</td><td>'.$result['UI'].'</td><td>'.$result['Tarif'].'</td></tr>';
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
	</div>
	<div class="col-sm-12 footer">
	Created by: Gunard
	</div>
</div>
</body>
</html>
