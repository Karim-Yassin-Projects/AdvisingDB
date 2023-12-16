<%@ Page Title="Admin Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="AdvisingWeb.Admins.AdminLogin" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-horizontal">
    <div class="form-group">
        <label class="form-label">Admin ID:</label>
        <asp:TextBox ID="AdminID" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" CssClass="text-danger" ControlToValidate="AdminID" Text="Please enter your admin ID." />
    </div>
    <div class="form-group">
        <label class="form-label">Password:</label>
        <asp:TextBox ID="Password" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" CssClass="text-danger" ControlToValidate="Password" Text="Please enter your password."/>
    </div>
    <asp:Label runat="server" Text="Invalid Student ID or Password." Visible="false" CssClass="text-danger" ID="InvalidLogin"/>
    <div class="form-group my-3">
        <asp:Button CssClass="btn btn-primary" ID="Login" runat="server" OnClick="LoginClick" Text="Sign in"/>
    </div>
    
</div>
</asp:Content>
