<?php include 'base.php';

try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$stmt = $conn->prepare("SELECT * FROM Entreprises_conference ORDER BY EntID");
	$stmt->execute();
	$self = htmlspecialchars($_SERVER["PHP_SELF"]);
	// set the resulting array to associative
	$result = $stmt->setFetchMode(PDO::FETCH_ASSOC);
	while ($result = $stmt->fetch(PDO::FETCH_ASSOC)){
		$sectID=$result['SectID'];
		$secteur_nom='';
		$stmt2 = $conn->prepare("SELECT Nom FROM Secteurs_conference WHERE SectID=$sectID");
		$stmt2->execute();
		$result2 = $stmt2->setFetchMode(PDO::FETCH_ASSOC);
		while ($result2 = $stmt2->fetch(PDO::FETCH_ASSOC)){
			$secteur_nom=$result2['Nom'];
			}
		print '<!-- Modal -->'."\n";
		print '<div id="modal-'.$result['EntID'].'" class="modal fade" role="dialog">'."\n";
		print '<div class="modal-dialog modal-UI ">'."\n";
		print '<!-- Modal content-->'."\n";
		print '<div class="modal-content">'."\n";
		print '<div class="modal-header table-'.$secteur_nom.'">'."\n";
        print '<button type="button" class="close" data-dismiss="modal">&times;</button>'."\n";
		print '<h4 class="modal-title">'.$result['Nom'].'</h4>'."\n";
		print '</div>'."\n";
		print '<div class="modal-body ">'."\n";
		print '<form class="form-horizontal" method="post" action="'.$self.'">'."\n";
		print '<div class="form-group form-group-sm">'."\n";
		print '<label for="quantite_UI_achete" class="col-sm-2 control-label">MO</label>'."\n";
		print '<div class="col-sm-10">'."\n";
		print '<input type="number" class="form-control" id="quantite_UI_achete" name="quantite_UI_achete" placeholder=0>'."\n";
		print '</div>'."\n";
		print '</div>'."\n";
		print '<div class="form-group form-group-sm">'."\n";
		print '<div class="col-sm-12">'."\n";
		print '<div class="modal-footer">'."\n";
		print '<input type="hidden" id="entreprise_ui" name="entreprise_ui" value="'.$result['EntID'].'">'."\n";
		print '				  <input name="ui-submit" class="btn " type="submit" value="Investir">'."\n";
        print '<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>'."\n";
		print '</div>'."\n";
		print '</div>'."\n";
		print '</div>'."\n";
		print '	</form>	'."\n";
		print '</div>'."\n";
		print '</div>'."\n";

		print '</div>'."\n";
		print '</div>'."\n";
		print '<!-- FIN Modal -->'."\n";
		}
	}

catch(PDOException $e) {
    echo "Error: " . $e->getMessage();
}
$conn = null;
?>
