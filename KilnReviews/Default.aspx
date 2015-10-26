<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="KilnReviews.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Open Code Reviews</title>
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <div class="container">
    <h3>Login to your Kiln account at <%=KilnUrlBase %></h3>
        <form id="loginForm" runat="server">
            <fieldset>
                <label>Email</label>
		        <asp:TextBox ID="userName" runat="server"></asp:TextBox>
				<div style="clear:both"></div>
				<div style="float: left">
					<label>API Token (<a href="<%= FogBugzUrlBase %>f/userPrefs">Generate</a>)<br/>(for users with 2 factor auth)</label>
					<asp:TextBox ID="token" runat="server" TextMode="Password"></asp:TextBox>
				</div>
				<div style="float: left; margin-left: 20px">
					<label>Password<br />(for users without 2 factor auth)</label>
					<asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
				</div>
            </fieldset>
		    <asp:Button ID="submitButton" runat="server" Text="Log in" OnClick="submitButtonClick" />
        </form>
    </div>
</body>
</html>
