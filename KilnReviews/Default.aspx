<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="KilnReviews.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="loginForm" runat="server">
		<asp:TextBox ID="userName" runat="server"></asp:TextBox>
		<asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
		<asp:Button ID="submitButton" runat="server" Text="Log in" OnClick="submitButtonClick" />
    </form>
</body>
</html>
