<%@ Page Title="Delete Slot" MasterPageFile="~/Admins/Admins.master" Language="C#" AutoEventWireup="true" CodeBehind="DeleteSlot.aspx.cs" Inherits="AdvisingWeb.Admins.DeleteSlot" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <asp:Panel runat="server" CssClass="form-horizontal" ID="FormPanel">
        <div class="form-group row">
            <label for="SemesterCode" class="form-label col-md-2 text-end">
                Enter semster code:
            </label>
            <div class="col-md-10">
                <asp:TextBox ID="SemesterCode" CssClass="form-control" runat="server" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="SemesterCode" Display="Dynamic" Text="Please enter semester code" CssClass="text-danger" />
            </div>
        </div>
        <div class="form-group mt-4">
            <div class="offset-md-2">
                <asp:Button CssClass="btn btn-primary" ID="DeleteButton" runat="server" OnClick="DeleteButtonClick" Text="Delete Slot" />
            </div>
        </div>
    </asp:Panel>
    <asp:Panel runat="server" CssClass="my-5 alert alert-info" Visible="false" ID="ResultPanel">
        Slot deleted successfully.
    </asp:Panel>    
</asp:Content>
