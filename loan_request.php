<?php
	session_start();
  include("header.html");
  $_SESSION["borrower"] = true;
  $_SESSION["lender"] = false;



  include("Sidebaru.html");
?>
<div class="content-wrapper">

	<div class="panel-body">
		<div class="row">
			<div class="col-lg-6 col-lg-offset-3">
				<form id="login-form" action="dao/loan_request_model_insert.php" method="POST" role="form" style="display: block;">
					<div class="form-group">
						<input type="number" name="loan_amt" id="loan_amt_id" tabindex="1" class="form-control" placeholder="Enter Amount in Peso" value="">
					</div>
					<div class="form-group">
						<select class="form-control" name="collateral_id">
							<?php 
								include('dao/loan_request_model_display.php');  
							?>
						</select>
					</div>
					<div class="col-sm-6 col-sm-offset-3">
						<input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Submit">
					</div>				
				</form>
			</div>
		</div>
	</div>
</div>
							
	<!-- <div class="form-group row">
		<form action="dao/loan_request_model_insert.php" method="POST">

			<input type="number" class="form-group" name="loan_amt" placeholder="Enter Amount in Peso"><br>
			<select name="collateral_id">
			<?php 
				
				include('dao/loan_request_model_display.php');  
			?>
			<button type="button" name="submit">Click Me!</button>

			</select>
		</form>
	</div> -->
</div>

<?php
	include("footer.html");
?>