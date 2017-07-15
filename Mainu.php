<?php 
	session_start();
  include("header.html");
  $_SESSION["borrower"] = true;
  $_SESSION["lender"] = false;



  include("Sidebaru.html");

  if($_SESSION["borrower"] == true){
  	include("BorrowerSu.php");
  }else{
  	include("LenderSu.php");
  } 
  
?>


<?php
  include("footer.html");
?>

