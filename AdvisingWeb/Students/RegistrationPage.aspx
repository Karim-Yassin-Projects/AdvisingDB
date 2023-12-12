<%@ Page Title="Registration Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistrationPage.aspx.cs" Inherits="AdvisingWeb.Students.RegistrationPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div>
         First Name:<br />
         <asp:TextBox ID="FirstName" runat="server"></asp:TextBox>
         <br />
         Last Name:</div>
        <asp:TextBox ID="LastName" runat="server"></asp:TextBox>
        <br />
        Password:<br />
        <asp:TextBox ID="Password" runat="server"></asp:TextBox>
        <br />
        Faculty:<br />
        <asp:TextBox ID="Faculty" runat="server"></asp:TextBox>
        <br />
        Email:<br />
        <asp:TextBox ID="Email" runat="server"></asp:TextBox>
        <br />
        Major:<br />
<asp:TextBox ID="Major" runat="server"></asp:TextBox>
        <br />
        Semester:<br />
        <asp:TextBox ID="Semester" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="RegisterButton" runat="server" OnClick="Register" Text="Register" />
</asp:Content>
