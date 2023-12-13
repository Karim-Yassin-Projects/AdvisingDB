<%@ Page Title="Optional Courses" Language="C#" MasterPageFile="~/Students/Students.Master" AutoEventWireup="true" CodeBehind="OptionalCoursesPage.aspx.cs" Inherits="AdvisingWeb.Students.OptionalCoursesPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<asp:GridView ID="gridOptionalCourses" runat="server" 
    AutoGenerateColumns="false"
    ShowHeaderWhenEmpty="true" Width="100%" >
    <Columns>
        <asp:BoundField HeaderText="Course ID" DataField="course_id" />
        <asp:BoundField HeaderText="Course Name" DataField="course_name" />
        <asp:BoundField HeaderText="Credit Hours" DataField="credit_hours" />
        <asp:TemplateField HeaderText="Is Offered">
            <ItemTemplate>
                 <%# (bool)Eval("is_offered") ? "Yes" : "No" %>
            </ItemTemplate>
        </asp:TemplateField>        <asp:BoundField HeaderText="Major" DataField="major" />
        <asp:BoundField HeaderText="Semester" DataField="semester" />
    </Columns>
</asp:GridView>
</asp:Content>
