<%@ Page Title="Slot Course Instructor" Language="C#" MasterPageFile="~/Students/Students.Master" AutoEventWireup="true" CodeBehind="SlotCourseInstructor.aspx.cs" Inherits="AdvisingWeb.Students.SlotCourseInstructor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="gridSlotCourses" runat="server"
        AutoGenerateColumns="false"
        CssClass="table table-striped"
        ShowHeaderWhenEmpty="true" Width="100%">
        <Columns>
            <asp:BoundField HeaderText="Course ID" DataField="course_id" />
            <asp:BoundField HeaderText="Course Name" DataField="course_name" />
            <asp:BoundField HeaderText="Slot ID" DataField="slot_id" />
            <asp:BoundField HeaderText="Slot Day" DataField="slot_day" />
            <asp:BoundField HeaderText="Slot Time" DataField="slot_time" />
            <asp:BoundField HeaderText="Slot Location" DataField="slot_location" />
            <asp:BoundField HeaderText="Instructor Name" DataField="instructor_name" />
        </Columns>
    </asp:GridView>
</asp:Content>
