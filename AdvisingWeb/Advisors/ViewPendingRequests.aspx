<%@ Page Title="Pending Requests" Language="C#" MasterPageFile="~/Advisors/AdvisorMaster.master" AutoEventWireup="true" CodeBehind="ViewPendingRequests.aspx.cs" Inherits="AdvisingWeb.Advisors.ViewPendingRequests" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView runat="server" ID="Grid" CssClass="table table-striped" OnRowCommand="Grid_RowCommand">
        <Columns>

            <asp:ButtonField ButtonType="Button" CommandName="ApproveReject" Text="Approve / Reject" />
        </Columns>

    </asp:GridView>
</asp:Content>
