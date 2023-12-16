<%@ Page Title="Update student status" Language="C#" MasterPageFile="~/Admins/Admins.master" AutoEventWireup="true" CodeBehind="UpdateStudentStatus.aspx.cs" Inherits="AdvisingWeb.Admins.UpdateStudentStatus" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">

    <asp:Panel runat="server" CssClass="form-horizontal" ID="FormPanel">
        <div class="form-group row">
            <label for="StudentId" class="form-label col-md-2 text-end">
                Enter Student Id:
            </label>
            <div class="col-md-10">
                <asp:TextBox ID="StudentId" CssClass="form-control" runat="server" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="StudentId" Display="Dynamic" Text="Please enter student id" CssClass="text-danger" />
                <asp:RangeValidator runat="server" MinimumValue="1" MaximumValue="2147483647" Type="Integer" ControlToValidate="StudentId" Display="Dynamic" Text="Please enter a valid student id" CssClass="text-danger" />
            </div>
        </div>
        <div class="form-group mt-4">
            <div class="offset-md-2">
                <asp:Button CssClass="btn btn-primary" ID="UpdateButton" runat="server" OnClick="UpdateButtonClick" Text="Update student status" />
            </div>
        </div>
    </asp:Panel>

    <asp:Panel runat="server" CssClass="my-5 alert alert-info" Visible="false" ID="ResultPanel">
        Student updated successfully.
    </asp:Panel>
</asp:Content>
