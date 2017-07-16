<?php
	include('dao/loan_request_model.php');

	$query = 'SELECT A.fname as "Name", B.position as "Position", LR.amount_loan as "Loan", LN.interest_rate as "Rate"
FROM loan_negotiation LN, banker B, loan_request LR, account A
WHERE LN.banker_id = B.banker_id AND B.acc_id = A.acc_id AND LN.loan_request_id = LR.loan_request_id';
	$result = mysqli_query($con,$query);

	if(mysqli_num_rows($result)>0){
		while($rows = mysqli_fetch_assoc($result)){
			echo "<div class='row'>
					<div class='col-lg-2'>".$rows['Name']."</div>
					<div class='col-lg-2'>".$rows['Position']."</div>
					<div class='col-lg-2'>".$rows['Loan']."</div>
					<div class='col-lg-2'>".$rows['Rate']."</div>
					<div class='col-lg-4'><button>Accept Offer</button></div>
					
				  </div>
			";
		}
	}else{
		echo "Error query";
	}

	mysqli_close($con);

?>