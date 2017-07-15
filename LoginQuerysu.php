<?php 
	if($_POST){
		$hostname = "localhost";
		$username = "root";
		$password = "";
		$database = "loanwolf";

		$con=mysqli_connect($hostname,$username,$password,$database);
		if(!$con){
			echo "Connection Failed";
		}
		session_start();
		$email = $_POST["email"];
		$pass = $_POST["pass"];
		
		$_SESSION["loginBanker"] = false;
		$_SESSION["loginBorrower"] = false;

	/*
		$bankquery = "SELECT FROM";

		if(mysqli_num_rows($bankquery) > 0){
			//login success banker
			$_SESSION["loginBanker"] = true;
			header("BankerSu.php");
		}else{
			$borrorwerquery = "SELECT FROM";

			if(mysqli_num_rows($borrorwerquery) > 0){
				//login success borrower
				$_SESSION["loginBorrower"] = true;
				header("BorrowerSu.php");
			}else{
				//login failure borrower
			}
			//login failure banker
		}
	*/
		$query = "SELECT  email, pass, type FROM account WHERE email = '$email' AND pass = '$pass' ";
		$result = mysqli_query($con,$query);

		if(mysqli_num_rows($result) > 0){
			
			$row = mysqli_fetch_assoc($result);

			if($row['type'] == "Banker"){

				$_SESSION["loginBanker"] = true;
				header("location:Bankersu.php");
			}else{

				$_SESSION["loginBorrower"] = true;
				header("location:BorrowerSu.php");

			}

		}else{
			echo "fam this user doens't exist.";
		}
		mysqli_close($con);
	}
?>