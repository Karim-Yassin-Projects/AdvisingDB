<%@ Page Title="View Graduation Plans" Language="C#" MasterPageFile="~/Admins/Admins.master" AutoEventWireup="true" CodeBehind="ViewGradPlan.aspx.cs" Inherits="AdvisingWeb.Admins.ViewGradPlan" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <asp:GridView runat="server" ID="gridView" CssClass="table table-striped" />

    <asp:Panel runat="server" ID="NoGradPlans" CssClass="alert alert-warning my-5" Visible="false">
        <asp:Label runat="server" Text="There are no graduation plans at this moment." />
    </asp:Panel>
</asp:Content>

