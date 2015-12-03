<?php
	session_start();
	include('config/config.php');
	if(isset($_SESSION['choix']))
	{
		switch($_SESSION['choix'])
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
				$sql = "INSERT INTO `succursale`.`theme` (`ID_THEME`, `LIBELLE`, `CODE`) VALUES (NULL,\"".$_POST['libel']."\",\"".$_POST['code']."\");";
				echo $sql;
				$req = mysql_query($sql) or die("Erreur SQL ".mysql_error());;
				header("Location: ../gestion1.php");
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