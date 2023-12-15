<%@ Page Title="Admin Portal" Language="C#" MasterPageFile="~/Admins/Admins.Master" AutoEventWireup="true" CodeBehind="AdminHomePage.aspx.cs" Inherits="AdvisingWeb.Scripts.Admins.AdminHomePage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">

    <div class="col-6 col-md-3 col-xl-2">
        <asp:HyperLink runat="server" CssClass="btn btn-outline-primary py-5 m-2 d-block" Height="150px" NavigateUrl="~/Admins/ListAdvisors">View Advisors</asp:HyperLink></div>
        <div class="col-6 col-md-3 col-xl-2">
    <asp:HyperLink runat="server" CssClass="btn btn-outline-primary py-5 m-2 d-block" Height="150px" NavigateUrl="~/Admins/ListStudentsandAdvisors">View Students with advisors</asp:HyperLink></div>
        </div>
    </div>
</asp:Content>
