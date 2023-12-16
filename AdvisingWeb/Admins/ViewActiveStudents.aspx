<%@ Page Title="View Active Students" MasterPageFile="~/Admins/Admins.master" Language="C#" AutoEventWireup="true" CodeBehind="ViewActiveStudents.aspx.cs" Inherits="AdvisingWeb.Admins.ViewActiveStudents" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <asp:GridView ID="ourgrid1" runat="server" AutoGenerateColumns="True" CssClass="table table-striped" />
</asp:Content>
