<%@ Page Title="Login Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="AdvisingWeb.Students.LoginPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    Student ID:
    <br/>
    <asp:TextBox ID="StudentID" runat="server"></asp:TextBox>
    <br/>
    Password:
    <br/>
    <asp:TextBox ID="Password" runat="server"></asp:TextBox>
    <br/>
    <asp:Button ID="Login" runat="server" OnClick="Redirect" Text="Sign in" />
    <asp:Button ID="RegisterRedirect" runat="server" OnClick="Register" Text="Don't have an account? Register." />
</asp:Content>
