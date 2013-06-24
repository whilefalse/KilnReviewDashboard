<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReviewSummary.aspx.cs" Inherits="KilnReviews.ReviewSummary" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
	<link rel="stylesheet" type="text/css" href="styles.css"/>
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <div class="container">
	<h2>Code Reviews for <%= UserName %></h2>
	<div id="reviewsTodo" class="fetching"></div>
	<div id="reviewsRejected" class="fetching"></div>
	<div id="reviewsWaiting" class="fetching"></div>
	
    <script type="text/x-jquery-tmpl" id="reviewsTemplate">
		<h3>${title}</h3>
        
	    {{if reviews.length > 0}}
            <div class="row">
                <div class="span12">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>Review</th>
                                <th>Days&nbsp;old</th>
                                <th>Who</th>
                            </tr>
                        </thead>
                        <tbody>
			                {{each reviews}}
                                <tr>
                                    <td><span class="reviewTitle"><a href="<%= ConfigurationManager.AppSettings["kilnUrlBase"] %>Review/${sReview}">${sReview}: ${sTitle}</a></span></td>
                                    <td><span class="reviewAge{{if DaysOld > 14}} ancient{{/if}}">${DaysOld}</span></td>
                                    <td>
                                        {{each People}} 
                                            <img src="${$value}"/>
                                        {{/each}}
                                    </td>
                                </tr>
			                {{/each}}
                        </tbody>
                    </table>
                </div>
            </div>
		{{else}}
			<span class="noReviews">None</span>
		{{/if}}
    </script>

	<script type="text/javascript" src="Scripts/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="Scripts/jQuery.tmpl.min.js"></script>
	<script type="text/javascript" src="Scripts/spine/spine.js"></script>
	<script type="text/javascript" src="Scripts/spine/ajax.js"></script>

	<script type="text/javascript" src="main.js"></script>
    </div>
</body>
</html>
