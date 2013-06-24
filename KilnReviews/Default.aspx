<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="KilnReviews.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <div class="container">
    <h3>Login to your Kiln account at <%=KilnUrlBase %></h3>
        <form id="loginForm" runat="server">
            <fieldset>
                <label>Email</label>
		        <asp:TextBox ID="userName" runat="server"></asp:TextBox>
                <label>Password</label>
		        <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
            </fieldset>
		    <asp:Button ID="submitButton" runat="server" Text="Log in" OnClick="submitButtonClick" />
        </form>
    </div>
</body>
</html>
