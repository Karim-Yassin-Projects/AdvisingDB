<%@ Page Title="Slots Instructors" Language="C#" MasterPageFile="~/Students/Students.Master" AutoEventWireup="true" CodeBehind="SlotsInstructor.aspx.cs" Inherits="AdvisingWeb.Students.SlotsInstructor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:PlaceHolder runat="server" Visible="false" ID="NoAvailableInstructors">
        <div class="form-group row my-2">
            <div class="alert alert-danger">
                There are currently no other instructors teaching this course.

            </div>
        </div>
    </asp:PlaceHolder>
    <asp:PlaceHolder runat="server" ID="CourseSelectionPanel">
        <div class="form-horizontal my-3">
            <div class="row">
                <label for="CourseID" class="col-md-2">Course:</label>
                <div class="col-md-10">
                    <asp:DropDownList runat="server" ID="CourseID" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="courseID_SelectedIndexChanged" />
                </div>
            </div>
        </div>
    </asp:PlaceHolder>
    <asp:PlaceHolder runat="server" ID="InstructorChoicePanel" Visible="false">
        <div class="form-group row my-2">
            <label class="form-label col-md-2 text-md-end" for="courseID">Instructor:</label>
            <div class="col-md-10">
                <asp:DropDownList ID="InstructorId" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged
                    ="InstructorId_SelectedIndexChanged"/>
            </div>
    </asp:PlaceHolder>
    <asp:GridView ID="gridSlotsInstructor" runat="server"
    AutoGenerateColumns="false"
    CssClass="table table-striped"
    ShowHeaderWhenEmpty="true" Width="100%">
    <Columns>
        <asp:BoundField HeaderText="Slot ID" DataField="slot_id" />
        <asp:BoundField HeaderText="Slot Day" DataField="slot_day" />
        <asp:BoundField HeaderText="Slot Time" DataField="slot_time" />
        <asp:BoundField HeaderText="Slot Location" DataField="slot_location" />
    </Columns>
</asp:GridView>
</asp:Content>
