<%@ Page Title="Change Course Instructor" Language="C#" MasterPageFile="~/Students/Students.Master" AutoEventWireup="true" CodeBehind="ChooseInstructorPage.aspx.cs" Inherits="AdvisingWeb.Students.ChooseInstructorPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="form-horizontal">
        <asp:PlaceHolder runat="server" ID="ChooseCourse">
            <div class="form-group row my-2">
                <label class="form-label col-md-2 text-md-end" for="courseID">Course:</label>
                <div class="col-md-10">
                    <asp:DropDownList ID="courseID" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="courseID_SelectedIndexChanged" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="courseId" CssClass="text-danger" Text="Please please select course." />
                </div>
            </div>
        </asp:PlaceHolder>
        <asp:PlaceHolder runat="server" Visible="false" ID="Success">
            <div class="form-group row my-2">
                <div class="alert alert-info">
                    Instructor was changed successfully.
                </div>
            </div>
        </asp:PlaceHolder>
        <asp:PlaceHolder runat="server" Visible="false" ID="NoAvailableInstructors">
            <div class="form-group row my-2">
                <div class="alert alert-danger">
                    There are currently no other instructors teaching this course.

                </div>
            </div>
        </asp:PlaceHolder>
        <asp:PlaceHolder runat="server" ID="InstructorChoicePanel" Visible="false">
            <div class="form-group row my-2">
                <label class="form-label col-md-2 text-md-end" for="courseID">Current Instructor:</label>
                <div class="col-md-10">
                    <asp:Label runat="server" Text="" ID="CurrentInstructorLabel" />
                </div>
            </div>
            <div class="form-group row my-2">
                <label class="form-label col-md-2 text-md-end" for="courseID">New Instructor:</label>
                <div class="col-md-10">
                    <asp:DropDownList ID="newInstructorId" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="newInstructorId" CssClass="text-danger" Text="Please choose new instructor" />
                </div>
            </div>
            <div class="form-group my-3 row">
                <div class="offset-md-2">
                    <asp:Button ID="ChangeInstructorButton" runat="server" OnClick="ChangeInstructorButton_Click" Text="Change Instructor" CssClass="btn btn-primary" />
                </div>
            </div>
        </asp:PlaceHolder>
    </div>
</asp:Content>
