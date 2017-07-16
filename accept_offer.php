<?php
	// session_start();
  include("header.html");
  $_SESSION["borrower"] = true;
  $_SESSION["lender"] = false;



  include("Sidebaru.html");
?>
<div class="content-wrapper">

	<div class="panel-body">
		
			<!-- <div class="col-lg-3">
				Hello
			</div>
			<div class="col-lg-3">
				Hello
			</div>
			<div class="col-lg-3">
				Hello
			</div>
			<div class="col-lg-3">
				Hello
			</div> -->
			<?php
				include("dao/loan_negotiation_display.php");
			?>

		
	</div>
</div>
							
	<!-- <div class="form-group row">
		<form action="dao/loan_request_model_insert.php" method="POST">

			<input type="number" class="form-group" name="loan_amt" placeholder="Enter Amount in Peso"><br>
			<select name="collateral_id">
			<?php 
				
			?>
			<button type="button" name="submit">Click Me!</button>

			</select>
		</form>
	</div> -->
</div>

<?php
	include("footer.html");
?>