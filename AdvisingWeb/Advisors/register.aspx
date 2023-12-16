<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="shalProj.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Registration Form"></asp:Label>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Advisor Name"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>
            <br />
             <asp:Label ID="Label3" runat="server" Text="Password"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox2" runat="server" ></asp:TextBox>
            <br />
            <asp:Label ID="Label4" runat="server" Text="email"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox3" runat="server" ></asp:TextBox>
            <br />
             <asp:Label ID="Label5" runat="server" Text="Office"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox4" runat="server" ></asp:TextBox>
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="register_button" Text="Register" />
            <br />
            <asp:Label ID="Label6" runat="server" Text="Already Registered"></asp:Label>
            <br />
            <asp:Button ID="Button2" runat="server" OnClick="login_button" Text="login" />
        </div>
    </form>
</body>
</html>
