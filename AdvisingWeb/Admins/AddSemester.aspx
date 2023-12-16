<%@ Page Title="Add Semester" Language="C#" MasterPageFile="~/Admins/Admins.master" AutoEventWireup="true" CodeBehind="AddSemester.aspx.cs" Inherits="AdvisingWeb.Admins.AddSemester" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel runat="server" CssClass="form-horizontal" ID="FormPanel">
        <div class="form-group row">
            <label for="SemesterCode" class="form-label col-md-2 text-end">
                Semester Code:
            </label>
            <div class="col-md-10">
                <asp:TextBox ID="SemesterCode" CssClass="form-control" runat="server" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="SemesterCode" Display="Dynamic" Text="Please enter semester code" CssClass="text-danger" />
                <asp:RegularExpressionValidator runat="server" ValidationExpression="^(S\d{2}R(1|2))|((W|S)\d{2})$" ControlToValidate="SemesterCode" Display="Dynamic" Text="Please enter a valid semester code" CssClass="text-danger" />
            </div>
        </div>
        <div class="form-group row my-2">
            <label for="StarDate" class="form-label col-md-2 text-end">
                Start date:
            </label>
            <div class="col-md-10">
                <asp:TextBox ID="StartDate" CssClass="form-control" runat="server" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="StartDate" Display="Dynamic" Text="Please enter a start date" CssClass="text-danger" />
                <asp:RangeValidator runat="server" MinimumValue="1/1/2000" MaximumValue="1/1/2100" Type="Date" ControlToValidate="StartDate" Display="Dynamic" Text="Please enter a valid date" CssClass="text-danger" />
            </div>
        </div>
        <div class="form-group row my-2">
            <label for="EndDate" class="form-label col-md-2 text-end">
                End date:
            </label>
            <div class="col-md-10">
                <asp:TextBox ID="EndDate" CssClass="form-control" runat="server" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="EndDate" Display="Dynamic" Text="Please enter a end date" CssClass="text-danger" />
                <asp:CompareValidator runat="server" ControlToCompare="StartDate" ControlToValidate="EndDate" Display="Dynamic" Text="End date must be a valid date greater than end date." Operator="GreaterThan" CssClass="text-danger" />
            </div>
        </div>
        <div class="form-group mt-4">
            <div class="offset-md-2">
                <asp:Button CssClass="btn btn-primary" ID="AddButton" runat="server" OnClick="AddButton_Click" Text="Add Semester" />
            </div>
        </div>
    </asp:Panel>
    <asp:Panel runat="server" CssClass="my-5 alert alert-info" Visible="false" ID="ResultPanel">
        Semester added successfully.
    </asp:Panel>
    <asp:Panel runat="server" CssClass="my-5 alert alert-danger" Visible="false" ID="ErrorPanel">
        A semester with this code already exists.
    </asp:Panel>
</asp:Content>
