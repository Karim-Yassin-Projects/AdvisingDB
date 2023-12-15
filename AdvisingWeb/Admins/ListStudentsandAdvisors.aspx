<%@ Page Title="" Language="C#" MasterPageFile="~/Admins/Admins.Master" AutoEventWireup="true" CodeBehind="ListStudentsandAdvisors.aspx.cs" Inherits="AdvisingWeb.Scripts.Admins.ListStudentsandAdvisors" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <asp:GridView ID="gridStudentsandAdvisors" runat="server"
    AutoGenerateColumns="false"
            CssClass="table table-striped"
    ShowHeaderWhenEmpty="true" Width="100%">
    <Columns>
        <asp:BoundField HeaderText="Student ID" DataField="s.student_id" />
        <asp:BoundField HeaderText="Student First Name" DataField="f_name" />
        <asp:BoundField HeaderText="Student Last Name" DataField="l_name" />
        <asp:BoundField HeaderText="Student GPA" DataField="Gpa" />
        <asp:BoundField HeaderText="Advisor ID" DataField="advisor_id" />
        <asp:BoundField HeaderText="Faculty" DataField="faculty" />
        <asp:BoundField HeaderText="Major" DataField="major" />
        <asp:BoundField HeaderText="Password" DataField="passoword" />
        <asp:BoundField HeaderText="Financial Status" DataField="financial_status" />
        <asp:BoundField HeaderText="Semester" DataField="semester" />
        <asp:BoundField HeaderText="Student Email" DataField="s.email" />
        <asp:BoundField HeaderText="Acquired Hours" DataField="acquired_hours" />
        <asp:BoundField HeaderText="Assigned Hours" DataField="assigned_hours" />
        <asp:BoundField HeaderText="Advisor ID" DataField="s.advisor_id" />
        <asp:BoundField HeaderText="Advisor ID" DataField="a.advisor_id" />
        <asp:BoundField HeaderText="Advisor Name" DataField="advisor_name" />
        <asp:BoundField HeaderText="Advisor Email" DataField="a.email" />
        <asp:BoundField HeaderText="Advisor Office" DataField="office" />
</Columns>
</asp:GridView>
</asp:Content>
