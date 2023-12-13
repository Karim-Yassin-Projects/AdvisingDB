<%@ Page Title="Login Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="AdvisingWeb.Students.LoginPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-horizontal">
        <div class="form-group">
            <label class="form-label">Student ID:</label>
            <asp:TextBox ID="StudentID" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" CssClass="text-danger" ControlToValidate="StudentID" Text="Please enter your student ID." />
        </div>
        <div class="form-group">
            <label class="form-label">Password:</label>
            <asp:TextBox ID="Password" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" CssClass="text-danger" ControlToValidate="Password" Text="Please enter your password."/>
        </div>
        <asp:Label runat="server" Text="Invalid Student ID or Password." Visible="false" CssClass="text-danger" ID="InvalidLogin"/>
        <div class="form-group my-3">
            <asp:Button CssClass="btn btn-primary" ID="Login" runat="server" OnClick="LoginClick" Text="Sign in" />
            <asp:HyperLink NavigateUrl="~/Students/RegistrationPage" CssClass="btn btn-secondary" runat="server" Text="Don't have an account? Register." />
        </div>
        
    </div>
</asp:Content>
