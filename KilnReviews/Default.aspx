<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="KilnReviews.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <p>Login to your Kiln account at <%=KilnUrlBase %></p>

    <form id="loginForm" runat="server">
        <label>Username</label>
		<asp:TextBox ID="userName" runat="server"></asp:TextBox>
        <label>Password</label>
		<asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
		<asp:Button ID="submitButton" runat="server" Text="Log in" OnClick="submitButtonClick" />
    </form>
</body>
</html>
