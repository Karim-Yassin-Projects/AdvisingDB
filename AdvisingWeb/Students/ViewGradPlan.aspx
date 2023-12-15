<%@ Page Title="" Language="C#" MasterPageFile="~/Students/Students.Master" AutoEventWireup="true" CodeBehind="ViewGradPlan.aspx.cs" Inherits="AdvisingWeb.Students.ViewGradPlan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">    
<asp:GridView ID="gridGradPlan" runat="server"
    AutoGenerateColumns="false"
    CssClass="table table-striped"
    ShowHeaderWhenEmpty="true" Width="100%">
    <Columns>
        <asp:BoundField HeaderText="Student ID" DataField="student_id"/>
        <asp:BoundField HeaderText="Student Name" DataField="StudentName"/>
        <asp:BoundField HeaderText="Plan ID" DataField="PlanID"/>
        <asp:BoundField HeaderText="Course ID" DataField="CourseId" />
        <asp:BoundField HeaderText="Course Name" DataField="course_name" />
        <asp:BoundField HeaderText="Semester Code" DataField="semester_code" />
        <asp:BoundField HeaderText="Expected Grad Date" DataField="expected_grad_date" />
        <asp:BoundField HeaderText="Semester Credit Hours" DataField="semester_credit_hours" />
        <asp:BoundField HeaderText="Advisor ID" DataField="advisor_id" />
    </Columns>
</asp:GridView>

</asp:Content>

