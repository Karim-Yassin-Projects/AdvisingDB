<%@ Page Title="Advisors" Language="C#" MasterPageFile="~/Admins/Admins.Master" AutoEventWireup="true" CodeBehind="ListAdvisors.aspx.cs" Inherits="AdvisingWeb.Admins.ListAdvisors" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="gridAdvisors" runat="server"
    AutoGenerateColumns="false"
        CssClass="table table-striped"
    ShowHeaderWhenEmpty="true" Width="100%">
    <Columns>
        <asp:BoundField HeaderText="Advisor ID" DataField="advisor_id" />
        <asp:BoundField HeaderText="Advisor Name" DataField="advisor_name" />
        <asp:BoundField HeaderText="Advisor Email" DataField="email" />
        <asp:BoundField HeaderText="Advisor Office" DataField="office" />
    </Columns>
</asp:GridView>
</asp:Content>
