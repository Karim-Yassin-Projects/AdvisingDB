<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewGradPlan.aspx.cs" Inherits="AdvisingWeb.Students.ViewGradPlan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Graduation Plan</h3>
<asp:GridView ID="gridGradPlan" runat="server" 
    AutoGenerateColumns="false"
    ShowHeaderWhenEmpty="true" Width="100%" >
    <Columns>
        <asp:BoundField HeaderText="Course ID" DataField="course_id" />
        <asp:BoundField HeaderText="Course Name" DataField="course_name" />
        <asp:BoundField HeaderText="Credit Hours" DataField="credit_hours" />
        <asp:BoundField HeaderText="Is Offered" DataField="is_offered" />
        <asp:BoundField HeaderText="Major" DataField="major" />
        <asp:BoundField HeaderText="Semester" DataField="semester" />
    </Columns>
</asp:GridView>
</asp:Content>
