<%@ Page Title="Optional Courses" Language="C#" MasterPageFile="~/Students/Students.Master" AutoEventWireup="true" CodeBehind="OptionalCoursesPage.aspx.cs" Inherits="AdvisingWeb.Students.OptionalCoursesPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-horizontal my-3">
        <div class="row">
            <label for="SemesterCode" class="col-md-2">Semester Code:</label>
            <div class="col-md-10">
                <asp:DropDownList runat="server" ID="SemesterCodes" CssClass="form-control" OnSelectedIndexChanged="SemesterCodes_SelectedIndexChanged" AutoPostBack="true" />
            </div>
        </div>
    </div>
    <asp:GridView ID="gridOptionalCourses" runat="server"
        CssClass="table table-striped"
        AutoGenerateColumns="false" Visible="false"
        ShowHeaderWhenEmpty="true" Width="100%">
        <Columns>
            <asp:BoundField HeaderText="Course ID" DataField="course_id" />
            <asp:BoundField HeaderText="Course Name" DataField="course_name" />
            <asp:BoundField HeaderText="Credit Hours" DataField="credit_hours" />
            <asp:TemplateField HeaderText="Is Offered">
                <ItemTemplate>
                    <%# (bool)Eval("is_offered") ? "Yes" : "No" %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="Major" DataField="major" />
            <asp:BoundField HeaderText="Semester" DataField="semester" />
        </Columns>
    </asp:GridView>
</asp:Content>
