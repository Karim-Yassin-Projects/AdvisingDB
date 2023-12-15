<%@ Page Title="Available Courses" Language="C#" MasterPageFile="~/Students/Students.Master" AutoEventWireup="true" CodeBehind="AvailableCoursesPage.aspx.cs" Inherits="AdvisingWeb.Students.AvailableCoursesPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-horizontal my-3">
        <div class="row">
            <label for="SemesterCode" class="col-md-2">Semester Code:</label>
            <div class="col-md-10">
                <asp:DropDownList runat="server" ID="SemesterCodes" CssClass="form-control" OnSelectedIndexChanged="SemesterCodes_SelectedIndexChanged" AutoPostBack="true" />
            </div>
        </div>
    </div>
    <asp:GridView ID="gridAvailableCourses" runat="server"
        AutoGenerateColumns="false" Visible="false"
        CssClass="table table-striped"
        ShowHeaderWhenEmpty="true" Width="100%">
        <Columns>
            <asp:BoundField HeaderText="Course ID" DataField="course_id" />
            <asp:BoundField HeaderText="Course Name" DataField="course_name" />
        </Columns>
    </asp:GridView>
</asp:Content>

