<?php
include('config.php');
session_start();
$connect = false;
if(isset($_GET['deco'])){
    $deco = ceil($_GET['deco']);
if($deco == 1) {
	session_destroy();
	//header("Location: ../Admin/index.php");
	header("Location: ../ProjetGL/index.php");
	exit;
	}
}
if(!empty($_SESSION['id']))
{
	$connect = true ;
	$id = $_SESSION['id'];
	$sql = "SELECT * FROM gestionnaire WHERE id_personne= '".$id."'";
	$req = mysql_query($sql);
	$rep = mysql_fetch_array($req);
	$login = $rep['login'];
//	$nom = $rep['nom'];
//	$nivo = $rep['type'];
	
}
?>