<?php
session_start();
	//mysql_connect("mysql13.000webhost.com","a6103122_testgp","reimsreims");
	//mysql_select_db("a6103122_testgb");
	mysql_connect("localhost","root","");
	mysql_select_db("succursale");
function prot($pwd) {
$x1="azae!54";
$x2="fdgds:5";
//$pwd= md5($x1.$pwd.$x2);
return $pwd ;
}


?>