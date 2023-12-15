<%@ Page Title="Courses and Prerequisites" Language="C#" MasterPageFile="~/Students/Students.Master" AutoEventWireup="true" CodeBehind="CoursesAndPrerequisites.aspx.cs" Inherits="AdvisingWeb.Students.CoursesAndPrerequisites" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="gridPrerequisiteCourses" runat="server"
    ShowHeaderWhenEmpty="true"
    AutoGenerateColumns="false"
        CssClass="table table-striped"
    Width="100%">
    <Columns>
        <asp:BoundField HeaderText="Course ID" DataField="course_id" />
        <asp:BoundField HeaderText="Course Name" DataField="course_name" />
        <asp:BoundField HeaderText="Credit Hours" DataField="credit_hours" />
        <asp:BoundField HeaderText="Major" DataField="major" />
        <asp:BoundField HeaderText="Semester" DataField="semester" />
        <asp:TemplateField HeaderText="Is Offered">
            <ItemTemplate>
                <%# (bool)Eval("is_offered") ? "Yes" : "No" %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="Prerequisite Course ID" DataField="prerequisite_course_id" NullDisplayText="No prerequisites" />
        
        
    </Columns>
</asp:GridView>
</asp:Content>
