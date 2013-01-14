<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReviewSummary.aspx.cs" Inherits="KilnReviews.ReviewSummary" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
	<link rel="stylesheet" type="text/css" href="styles.css"/>
</head>
<body>
	<h2>Your Code Reviews</h2>
	<h3>Reviews to do:</h3>
	<ul id="reviewsTodo"></ul>
	
	<h3>Rejected reviews to fix:</h3>
	<ul id="reviewsRejected"></ul>
	
	<h3>Your code being reviewed by others:</h3>
	<ul id="reviewsWaiting"></ul>
	
    <script type="text/x-jquery-tmpl" id="reviewTemplate">
        <li>
            <span class="reviewTitle"><a href="https://nonlinear.kilnhg.com/Review/${sReview}">${sReview}: ${sTitle}</a></span>
            <span class="reviewAge{{if DaysOld > 14}} ancient{{/if}}">[${DaysOld} days old]</span>
        </li>
    </script>

	<script type="text/javascript" src="Scripts/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="Scripts/jQuery.tmpl.min.js"></script>
	<script type="text/javascript" src="Scripts/spine/spine.js"></script>
	<script type="text/javascript" src="Scripts/spine/ajax.js"></script>

	<script type="text/javascript" src="main.js"></script>
</body>
</html>
