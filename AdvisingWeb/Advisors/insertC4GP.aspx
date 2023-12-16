<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="insertC4GP.aspx.cs" Inherits="shalProj.insertC4GP" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="student_id"></asp:Label> <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br/>
                        <asp:Label ID="Label2" runat="server" Text="sem_code"></asp:Label><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br/>

                        <asp:Label ID="Label3" runat="server" Text="course_name"></asp:Label><asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br/>
            <asp:Button ID="Button1"  OnClick="insert" runat="server"  Text="insert" />
        </div>
    </form>
</body>
</html>
