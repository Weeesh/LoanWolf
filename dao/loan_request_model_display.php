<?php
	include('dao/loan_request_model.php');

	$query = "SELECT * FROM collateral";
	$result = mysqli_query($con,$query);

	if(mysqli_num_rows($result)>0){
		while($rows = mysqli_fetch_assoc($result)){
			echo "<option value='".$rows['collateral_id']."'>".$rows['collateral_type']."</option>";
		}
	}else{
		echo "Error query";
	}

	mysqli_close($con);

?>