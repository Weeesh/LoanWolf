<?php

	if($_POST){
		include('sql_connect.php');

		$email = $_POST["email"];
		$pass = $_POST["pass"];
		$type = $_POST["type"];
		$fname = $_POST["fname"];
		$lname = $_POST["lname"];
		$affiliation = $_POST["affiliation"];
		
		
		$quer = mysqli_query($mysqli,"SELECT * FROM account WHERE email='$email'");

		if(mysqli_num_rows($quer)>0){
			echo "Already taken lulz";
		}else{

			$sql = "INSERT INTO `account`( `fname`, `lname`, `email`, `pass`, `type`, `affiliation`) 
				VALUES ('$fname','$lname','$email','$pass','$type','affiliation')";
			if(mysqli_query($mysqli,$sql)){
				echo "Successful!";
					
			}
		}
		
	}

	mysqli_close($mysqli);
?>