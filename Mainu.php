<?php 
	session_start();
  include("header.html");
  $_SESSION["borrower"] = false;
  $_SESSION["lender"] = false;



  include("LoginPage.php");

  if($_SESSION["borrower"] == true){
  	include("BorrowerSu.php");
  }else{
  	include("LenderSu.php");
  } 
  
?>


<?php
  include("footer.html");
?>

