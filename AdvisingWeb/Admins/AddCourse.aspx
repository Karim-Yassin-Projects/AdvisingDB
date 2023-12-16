<%@ Page Title="Add Course" Language="C#" MasterPageFile="~/Admins/Admins.master" AutoEventWireup="true" CodeBehind="AddCourse.aspx.cs" Inherits="AdvisingWeb.Admins.AddCourse" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel runat="server" CssClass="form-horizontal" ID="FormPanel">
        <div class="form-group row">
            <label for="CourseName" class="form-label col-md-2 text-end">
                Course Name:
            </label>
            <div class="col-md-10">
                <asp:TextBox ID="CourseName" CssClass="form-control" runat="server" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="CourseName" Display="Dynamic" Text="Please enter course name" CssClass="text-danger" />
            </div>
        </div>
        <div class="form-group row my-2">
            <label for="Major" class="form-label col-md-2 text-end">
                Major:
            </label>
            <div class="col-md-10">
                <asp:TextBox ID="Major" CssClass="form-control" runat="server" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Major" Display="Dynamic" Text="Please enter major" CssClass="text-danger" />
            </div>
        </div>
        <div class="form-group row my-2">
            <label for="Semester" class="form-label col-md-2 text-end">
                Semester:
            </label>
            <div class="col-md-10">
                <asp:TextBox ID="Semester" CssClass="form-control" runat="server" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Semester" Display="Dynamic" Text="Please enter semester" CssClass="text-danger" />
                <asp:RangeValidator runat="server" Type="Integer" ControlToValidate="Semester" MinimumValue="1" MaximumValue="20" Display="Dynamic" Text="Please enter a valid semester" CssClass="text-danger" />
            </div>
        </div>
        <div class="form-group row my-2">
            <label for="CreditHorus" class="form-label col-md-2 text-end">
                Credit Hours:
            </label>
            <div class="col-md-10">
                <asp:TextBox ID="CreditHours" CssClass="form-control" runat="server" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="CreditHours" Display="Dynamic" Text="Please enter credit hours" CssClass="text-danger" />
                <asp:RangeValidator runat="server" Type="Integer" ControlToValidate="CreditHours" MinimumValue="1" MaximumValue="20" Display="Dynamic" Text="Please enter valid credit hours." CssClass="text-danger" />
            </div>
        </div>
        <div class="form-group row my-2">
            <label for="IsOffered" class="form-label col-md-2 text-end">
                Is Offered:
            </label>
            <div class="col-md-10">
                <asp:CheckBox ID="IsOffered" runat="server" />
            </div>
        </div>
        <div class="form-group mt-4">
            <div class="offset-md-2">
                <asp:Button CssClass="btn btn-primary" ID="AddButton" runat="server" OnClick="AddButton_Click" Text="Add Semester" />
            </div>
        </div>
    </asp:Panel>
    <asp:Panel runat="server" CssClass="my-5 alert alert-info" Visible="false" ID="ResultPanel">
        Course added successfully.
    </asp:Panel>
    <asp:Panel runat="server" CssClass="my-5 alert alert-danger" Visible="false" ID="ErrorPanel">
        Failed to add course.
    </asp:Panel>
</asp:Content>