<?php
	$con =  mysqli_connect('localhost','root','','loan_wolf');
	if(!$con){
		echo "Error DB connection";
	}
	session_start();
?>