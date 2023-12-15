<%@ Page Title="Courses and their makeup exams" Language="C#" MasterPageFile="~/Students/Students.Master" AutoEventWireup="true" CodeBehind="ViewCoursesandExams.aspx.cs" Inherits="AdvisingWeb.Students.ViewCoursesandExams" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="gridViewCoursesAndExams" runat="server"
    AutoGenerateColumns="false"
        CssClass="table table-striped"
    ShowHeaderWhenEmpty="true" Width="100%">
    <Columns>
        <asp:BoundField HeaderText="Course Name" DataField="course_name"/>
        <asp:BoundField HeaderText="Semester" DataField="semester"/>
    </Columns>
</asp:GridView>
</asp:Content>
