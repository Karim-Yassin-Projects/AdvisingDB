<%@ Page Title="Sending Course Request" Language="C#" MasterPageFile="~/Students/Students.Master" AutoEventWireup="true" CodeBehind="SendingCourseRequestPage.aspx.cs" Inherits="AdvisingWeb.Students.SendingCourseRequestPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel runat="server" ID="ResultPanel" Visible="false">
        <div class="alert alert-info">
            Course request sent successfully.
        <asp:Label runat="server" ID="CourseRequestSentLabel" />
        </div>
    </asp:Panel>
    <asp:Panel runat="server" ID="ErrorPanel" Visible="false">
        <div class="alert alert-danger">
            You are not assigned an advisor yet. You will be able to send course requests when an administrator assigns an advisor to you.
        </div>
    </asp:Panel>
    <asp:Panel runat="server" ID="FormPanel">
        <div class="form-horizontal">
            <div class="form-group row my-2">
                <label class="form-label col-md-2 text-md-end" for="courseID">Course:</label>
                <div class="col-md-10">
                    <asp:DropDownList ID="courseID" runat="server" CssClass="form-control" DataTextField="Text" DataValueField="Value" />
                    <asp:RequiredFieldValidator Display="Dynamic" runat="server" ControlToValidate="courseID" Text="Please select a course." CssClass="text-danger" />
                </div>
            </div>
            <div class="form-group row my-2">
                <label class="form-label col-md-2 text-md-end" for="comment">comment:</label>
                <div class="col-md-10">
                    <asp:TextBox ID="comment" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator Display="Dynamic" runat="server" ControlToValidate="comment" Text="Please add a comment." CssClass="text-danger" />
                </div>
            </div>

        </div>
        <div class="form-group my-3 row">
            <div class="offset-md-2">
                <asp:Button ID="SendCourseRequestButton" runat="server" OnClick="SendCourseRequest" Text="Send Course Request" CssClass="btn btn-primary" />
            </div>
        </div>

    </asp:Panel>
</asp:Content>
