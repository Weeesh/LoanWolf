<?php
	include('loan_request_model.php');
	$amount = $_POST['loan_amt'];
	$borrower_id = 1;
	$collat_id = $_POST['collateral_id'];

	$query = "INSERT INTO loan_request( amount_loan, borrower_id, collateral_id) VALUES (".$amount.", ".$borrower_id.",".$collat_id.")";

	if(mysqli_query($con,$query)){
		header('location:../index.php');
	}else{
		echo "Error insert";
	}

	// echo $amount."".$borrower_id."".$collat_id ;



	mysqli_close($con);
?>