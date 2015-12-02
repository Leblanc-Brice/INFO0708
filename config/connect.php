<?php

include('config.php');



$connect = false;

if(!empty($_POST['util']) && !empty($_POST['pass'])) 
{
   $_SESSION['connect'] = false;
   extract($_POST);
   $pass = prot($pass) ;
   print_r($pass);
   $util = mysql_real_escape_string($util);
   $sql =  "SELECT * FROM gestionnaire WHERE login='".$util."' ";
   $req =  mysql_query($sql) or die ('Erreur SQL');
   if(mysql_num_rows($req) >0 ) {
   $rep = mysql_fetch_array($req);
   if($rep['MDP'] == $pass) {
	$connect = true;
	$_SESSION['id'] = $rep['id_personne'];
	$_SESSION['connect'] = true;
	$_SESSION['login'] = $_POST['util'];
	
}}}
if($connect == true) {
header("Location: ../gestion1.php");
exit;
}
elseif($connect == false) {
header("Location: ../index.php?err=mdp");
exit;
}

?>