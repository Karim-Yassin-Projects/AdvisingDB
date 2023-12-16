<%@ Page Title="Display Payments" MasterPageFile="~/Admins/Admins.master" Language="C#" AutoEventWireup="true" CodeBehind="DisplayPayments.aspx.cs" Inherits="AdvisingWeb.Admins.DisplayPayments" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">

    <asp:GridView runat="server" ID="gridView" CssClass="table table-striped" />
    <asp:Panel runat="server" CssClass="my-5 alert alert-info" Visible="false" ID="ResultPanel">
        There are no Payments at this moment
    </asp:Panel>
</asp:Content>
