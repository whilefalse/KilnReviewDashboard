<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReviewSummary.aspx.cs" Inherits="KilnReviews.ReviewSummary" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
	<link rel="stylesheet" type="text/css" href="styles.css"/>
</head>
<body>
	<h2>Code Reviews for <%= UserName %></h2>
	<div id="reviewsTodo" class="fetching"></div>
	<div id="reviewsRejected" class="fetching"></div>
	<div id="reviewsWaiting" class="fetching"></div>
	
    <script type="text/x-jquery-tmpl" id="reviewsTemplate">
		<h3>${title}</h3>
	    <ul>
	    {{if reviews.length > 0}}
			{{each reviews}}
			<li>
				<span class="reviewTitle"><a href="https://nonlinear.kilnhg.com/Review/${sReview}">${sReview}: ${sTitle}</a></span>
				<span class="reviewAge{{if DaysOld > 14}} ancient{{/if}}">[${DaysOld} days old]</span>
			</li>
			{{/each}}
		{{else}}
			<li><span class="noReviews">None :-)</span></li>
		{{/if}}
		</ul>
    </script>

	<script type="text/javascript" src="Scripts/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="Scripts/jQuery.tmpl.min.js"></script>
	<script type="text/javascript" src="Scripts/spine/spine.js"></script>
	<script type="text/javascript" src="Scripts/spine/ajax.js"></script>

	<script type="text/javascript" src="main.js"></script>
</body>
</html>
