<?php
	//include('config/verif.php');
	session_start();
	if(isset($_POST['choix']))
	{
	    $_SESSION['choix'] = $_POST['choix'];
		switch($_POST['choix'])
		{
			case "AjoutSalle":
				echo "<h1>Formulaire AjoutSalle</h1>";
				break;
			case "SuppressionSalle":
				echo "<h1>Formulaire SuppressionSalle</h1>";
				break;
			case "ModificationSalle":
				echo "<h1>Formulaire ModificationSalle</h1>";
				break;
			case "AjoutFormation":
				echo "<h1>Formulaire AjoutFormation</h1>";
				break;
			case "SuppressionFormation":
				echo "<h1>Formulaire SuppressionFormation</h1>";
				break;
			case "ModificationFormation":
				echo "<h1>Formulaire ModificationFormation</h1>";
				break;
			case "AjoutTheme":
				echo "<h1>Formulaire AjoutTheme</h1>";
				echo "<form action=\"traitement.php\" method=\"post\">";
				echo "Libellé: <input type=\"text\" name=\"libel\" maxLength=\"100\" size=\"100\">";
				echo "<br>";
				echo "Code: <input type=\"text\" name=\"code\" maxLength=\"10\" size=\"10\">";
				echo "<br>";
				echo "<button type=\"submit\">Valider</button>";
				echo "</form>";
				break;
			case "AjoutSousTheme":
				echo "<h1>Formulaire AjoutSousTheme</h1>";
				break;
			case "AjoutClient":
				echo "<h1>Formulaire AjoutClient</h1>";
				break;
			case "SuppressionClient":
				echo "<h1>Formulaire SuppressionClient</h1>";
				break;
			case "AjoutFormateur":
				echo "<h1>Formulaire AjoutFormateur</h1>";
				break;
			case "SuppressionFormateur":
				echo "<h1>Formulaire SuppressionFormateur</h1>";
				break;
			case "AjoutFormation":
				echo "<h1>Formulaire AjoutFormation</h1>";
				break;
		}
	}
	else
	{
		echo "<h1>Erreur</h1>";
	}
?>