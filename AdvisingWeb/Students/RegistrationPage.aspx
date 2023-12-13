<%@ Page Title="Registration Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistrationPage.aspx.cs" Inherits="AdvisingWeb.Students.RegistrationPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel runat="server" ID="ResultPanel" Visible="false">
        <div class="alert alert-info">
            Thank your for your registration. Your student ID is:
            "<asp:Label runat="server" ID="StudentIDLabel" />".
            Click <asp:HyperLink runat="server" NavigateUrl="~/Students/StudentHomePage.aspx">here</asp:HyperLink> to access the student portal.
        </div>
    </asp:Panel>
    <asp:Panel runat="server" ID="FormPanel">
        <div class="form-horizontal">
            <div class="form-group row my-2">
                <label class="form-label col-md-2 text-md-end" for="FirstName">First Name:</label>
                <div class="col-md-10">
                    <asp:TextBox ID="FirstName" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator Display="Dynamic" runat="server" ControlToValidate="FirstName" Text="Please enter your first name" CssClass="text-danger" />
                </div>
            </div>
            <div class="form-group row my-2">
                <label class="form-label col-md-2 text-md-end" for="LastName">Last Name:</label>
                <div class="col-md-10">
                    <asp:TextBox ID="LastName" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator Display="Dynamic" runat="server" ControlToValidate="LastName" Text="Please enter your last name" CssClass="text-danger" />
                </div>
            </div>
            <div class="form-group row my-2">
                <label class="form-label col-md-2 text-md-end" for="Password">Password:</label>
                <div class="col-md-10">
                    <asp:TextBox ID="Password" runat="server" CssClass="form-control" TextMode="Password" />
                    <asp:RequiredFieldValidator Display="Dynamic" runat="server" ControlToValidate="Password" Text="Please choose a password." CssClass="text-danger" />
                </div>
            </div>
            <div class="form-group row my-2">
                <label class="form-label col-md-2 text-md-end" for="ConfirmPassword">Confirm Password:</label>
                <div class="col-md-10">
                    <asp:TextBox ID="ConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" />
                    <asp:RequiredFieldValidator Display="Dynamic" runat="server" ControlToValidate="ConfirmPassword" Text="Please confirm your password." CssClass="text-danger" />
                    <asp:CompareValidator Display="Dynamic" runat="server" ControlToValidate="ConfirmPassword"
                        ControlToCompare="Password" Text="Password confirm mismatch." CssClass="text-danger" Operator="Equal" />
                </div>
            </div>
            <div class="form-group row my-2">
                <label class="form-label col-md-2 text-md-end" for="Faculty">Faculty:</label>
                <div class="col-md-10">
                    <asp:TextBox ID="Faculty" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator Display="Dynamic" runat="server" ControlToValidate="Faculty" Text="Please choose your faculty." CssClass="text-danger" />
                </div>
            </div>
            <div class="form-group row my-2">
                <label class="form-label col-md-2 text-md-end" for="Major">Major:</label>
                <div class="col-md-10">
                    <asp:TextBox ID="Major" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator Display="Dynamic" runat="server" ControlToValidate="Major" Text="Please choose your major." CssClass="text-danger" />
                </div>
            </div>
            <div class="form-group row my-2">
                <label class="form-label col-md-2 text-md-end" for="Email">Email:</label>
                <div class="col-md-10">
                    <asp:TextBox ID="Email" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator Display="Dynamic" runat="server" ControlToValidate="Email" Text="Please enter your email address." CssClass="text-danger" />
                    <asp:RegularExpressionValidator Display="Dynamic" runat="server" ControlToValidate="Email" Text="Please enter a valid email address" CssClass="text-danger"
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                </div>
            </div>
            <div class="form-group row my-2">
                <label class="form-label col-md-2 text-md-end" for="Semester">Semester:</label>
                <div class="col-md-10">
                    <asp:TextBox ID="Semester" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator Display="Dynamic" runat="server" ControlToValidate="Semester" Text="Please enter your semester." CssClass="text-danger" />
                    <asp:RangeValidator Display="Dynamic" runat="server" MinimumValue="1"
                        MaximumValue="20"
                        ControlToValidate="Semester"
                        CssClass="text-danger"
                        Type="Integer"
                        Text="Please enter an integer from 1 to 20." />
                </div>
            </div>
            <div class="form-group my-3 row">
                <div class="offset-md-2">
                    <asp:Button ID="RegisterButton" runat="server" OnClick="Register" Text="Register" CssClass="btn btn-primary" />
                </div>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
