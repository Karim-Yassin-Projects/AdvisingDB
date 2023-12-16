<%@ Page Title="Add Makeup Examp" MasterPageFile="~/Admins/Admins.master" Language="C#" AutoEventWireup="true" CodeBehind="AddMakeup.aspx.cs" Inherits="AdvisingWeb.Admins.AddMakeup" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">

    <asp:Panel runat="server" CssClass="form-horizontal" ID="FormPanel">
        <div class="form-group row">
            <label for="CourseId" class="form-label col-md-2 text-end">
                Enter Course Id:
            </label>
            <div class="col-md-10">
                <asp:TextBox ID="CourseId" CssClass="form-control" runat="server" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="CourseId" Display="Dynamic" Text="Please enter course id" CssClass="text-danger" />
                <asp:RangeValidator runat="server" MinimumValue="1" MaximumValue="2147483647" Type="Integer" ControlToValidate="CourseId" Display="Dynamic" Text="Please enter a valid course id" CssClass="text-danger" />
            </div>
        </div>
        <div class="form-group row">
            <label for="Date" class="form-label col-md-2 text-end">
                Enter Date:
            </label>
            <div class="col-md-10">
                <asp:TextBox ID="Date" CssClass="form-control" runat="server" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Date" Display="Dynamic" Text="Please enter date" CssClass="text-danger" />
                <asp:RangeValidator runat="server" MinimumValue="1/1/2000" MaximumValue="1/1/2100" Type="Date" ControlToValidate="Date" Display="Dynamic" Text="Please enter a valid date" CssClass="text-danger" />
            </div>
        </div>
        <div class="form-group row">
            <label for="ExamType" class="form-label col-md-2 text-end">
                Exam Type
            </label>
            <div class="col-md-10">
                <asp:DropDownList ID="ExamType" CssClass="form-control" runat="server">
                    <asp:ListItem Value="Normal">Normal</asp:ListItem>
                    <asp:ListItem Value="First_Makeup">First Makeup</asp:ListItem>
                    <asp:ListItem Value="Second_Makeup">Second Makeup</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <div class="form-group mt-4">
            <div class="offset-md-2">
                <asp:Button CssClass="btn btn-primary" ID="AddButton" runat="server" OnClick="AddButtonClick" Text="Add Makeup Exam" />
            </div>
        </div>
    </asp:Panel>
    <asp:Panel runat="server" CssClass="my-5 alert alert-info" Visible="false" ID="ResultPanel">
        Exam added successfully.
    </asp:Panel>
</asp:Content>
