<%@ Page Title="Delete Course" MasterPageFile="~/Admins/Admins.master" Language="C#" AutoEventWireup="true" CodeBehind="DeleteCourse.aspx.cs" Inherits="AdvisingWeb.Admins.DeleteCourse" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <asp:Panel runat="server" CssClass="form-horizontal" ID="FormPanel">
        <div class="form-group row">
            <label for="CourseId" class="form-label col-md-2 text-end">
                Enter Course Id:
            </label>
            <div class="col-md-10">
                <asp:TextBox ID="CourseId" CssClass="form-control" runat="server" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="CourseId" Display="Dynamic" Text="Please enter coruse id" CssClass="text-danger" />
                <asp:RangeValidator runat="server" MinimumValue="1" MaximumValue="2147483647" Type="Integer" ControlToValidate="CourseId" Display="Dynamic" Text="Please enter a valid course id" CssClass="text-danger" />
            </div>
        </div>
        <div class="form-group mt-4">
            <div class="offset-md-2">
                <asp:Button CssClass="btn btn-primary" ID="DeleteButton" runat="server" OnClick="DeleteButtonClick" Text="Delete Course" />
            </div>
        </div>
    </asp:Panel>
    <asp:Panel runat="server" CssClass="my-5 alert alert-info" Visible="false" ID="ResultPanel">
        Course deleted successfully.
    </asp:Panel>
    <asp:Panel runat="server" CssClass="my-5 alert alert-danger" Visible="false" ID="ErrorPanel">
        Unable to delete course because there are records depending on it.
    </asp:Panel>

</asp:Content>
