<div>
    <div class="content-wrapper">
        <br>
        <form action="dao/insertLoanNegotiation.php?requestId=1" method="POST">
            <input name="interestRate">
            <input name="paymentDue">
            <button type="submit">SUBMIT!</button>
        </form>
    </div>
</div>
<?php
    require("../sql_connect.php");

    $result = mysqli_query($mysqli, "SELECT `req`.`amount_loan`, `req`.`date_requested`, CONCAT(`a`.`fname`,' ', `a`.`lname`) AS `name`
FROM `loan_request` `req`
INNER JOIN `borrower` `b`
ON `b`.`borrower_id` = `req`.`borrower_id`
INNER JOIN `account` `a`
ON `a`.`acc_id` = `b`.`acc_id`"); /*$_SESSION['account_id']*/

    while($rs = mysqli_fetch_array($result)) {
    if ($result) {
        echo "
        <div align='center'>
            <table>
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Amount of Loan</th>
                        <th>Date Requested</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>".$rs[2]."</td>
                        <td>".$rs[0]."</td>
                        <td>".$rs[1]."</td>
                    </tr>
                </tbody>

            </table>
        </div>
        ";
    }
}
?>
