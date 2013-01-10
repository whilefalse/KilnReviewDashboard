<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="KilnReviews.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
	<h3>Reviews you need to do:</h3>
	<ul id="reviewsTodo"></ul>
	
	<h3>Rejected reviews you need to fix:</h3>
	<ul id="reviewsRejected"></ul>
	
	<h3>Reviews of your code you're waiting for:</h3>
	<ul id="reviewsWaiting"></ul>
	
    <script type="text/x-jquery-tmpl" id="reviewTemplate">
        <li>
            <span class="reviewId">${sReview}</span>
            <span class="reviewStatus">${sStatus}</span>
            <span class="reviewTitle">${sTitle}</span>
        </li>
    </script>

	<script type="text/javascript" src="Scripts/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="Scripts/jQuery.tmpl.min.js"></script>
	<script type="text/javascript" src="Scripts/spine/spine.js"></script>
	<script type="text/javascript" src="Scripts/spine/ajax.js"></script>

	<script type="text/javascript" src="main.js"></script>
</body>
</html>
