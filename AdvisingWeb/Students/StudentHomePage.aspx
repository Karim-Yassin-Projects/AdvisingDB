<%@ Page Title="Student Homepage" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentHomePage.aspx.cs" Inherits="AdvisingWeb.Students.StudentHomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Button ID="OptionalRedirect" runat="server" OnClick="ViewOptional" Text="View Optional Courses" />
    <br/>
    <asp:Button ID="RequiredRedirect" runat="server" OnClick="ViewRequired" Text="View Required Courses" />
</asp:Content>
