<%@ Page Title="Pending Requests" Language="C#" MasterPageFile="~/Admins/Admins.Master" AutoEventWireup="true" CodeBehind="PendingRequests.aspx.cs" Inherits="AdvisingWeb.Admins.PendingRequests" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="gridRequests" runat="server"
        AutoGenerateColumns="false"
        CssClass="table table-striped"
        ShowHeaderWhenEmpty="true" Width="100%">
        <Columns>
            <asp:BoundField HeaderText="Request ID" DataField="request_id" />
            <asp:BoundField HeaderText="Request Type" DataField="type" />
            <asp:BoundField HeaderText="Comment" DataField="comment" />
            <asp:BoundField HeaderText="Status" DataField="status" />
            <asp:BoundField HeaderText="Advisor ID" DataField="advisor_id" />
            <asp:BoundField HeaderText="Request Type" DataField="type" />
            <asp:BoundField HeaderText="Student ID" DataField="student_id" />
            <asp:BoundField HeaderText="Course ID" DataField="course_id" />
            <asp:BoundField HeaderText="Student Name" DataField="student_name" />
            <asp:BoundField HeaderText="Advisor Name" DataField="advisor_name" />
        </Columns>
    </asp:GridView>

</asp:Content>
