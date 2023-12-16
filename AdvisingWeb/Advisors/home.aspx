<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="shalProj.home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="This is HomePage"></asp:Label>
        </div>
        <asp:Button ID="Button1" runat="server" OnClick="view" Text="View All Advising Students" />
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" OnClick="insert" Text="Insert Grad Plan" />
        <br />
        <br />
        <asp:Button ID="Button3" runat="server" OnClick="courses" Text="Insert Courses for Grad Plan" />
        <br />
        <br />
        <asp:Button ID="Button4" runat="server" OnClick="Update" Text="Update expected graduation date" />
        <br />
        <br />
        <asp:Button ID="Button5" runat="server" OnClick="delete" Text="Delete course from a graduation plan" />
        <br />
        <br />
        <asp:Button ID="Button6" runat="server" OnClick="assigned" Text=" View all students assigned" />
        <br />
        <br />
        <asp:Button ID="Button7" runat="server" OnClick="requests" Text="View All Requests" />
        <br />
        <br />
        <asp:Button ID="Button8" runat="server" OnClick="pending" Text="View All Pending Requests" />
        <br />
        <br />
        <asp:Button ID="Button9" runat="server" OnClick="credit" Text="Approve/ reject extra credit hours request." />
        <br />
        <br />
        <asp:Button ID="Button10" runat="server" OnClick="course" Text="Approve/ reject extra credit hours request." />
    </form>
</body>
</html>
