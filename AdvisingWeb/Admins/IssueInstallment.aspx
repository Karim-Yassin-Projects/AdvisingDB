<%@ Page Title="Issue Installment" MasterPageFile="~/Admins/Admins.master" Language="C#" AutoEventWireup="true" CodeBehind="IssueInstallment.aspx.cs" Inherits="AdvisingWeb.Admins.IssueInstallment" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <asp:Panel runat="server" CssClass="form-horizontal" ID="FormPanel">
        <div class="form-group row">
            <label for="PaymentId" class="form-label col-md-2 text-end">
                Enter Payment Id:
            </label>
            <div class="col-md-10">
                <asp:TextBox ID="PaymentId" CssClass="form-control" runat="server" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="PaymentId" Display="Dynamic" Text="Please enter payment id" CssClass="text-danger" />
                <asp:RangeValidator runat="server" MinimumValue="1" MaximumValue="2147483647" Type="Integer" ControlToValidate="PaymentId" Display="Dynamic" Text="Please enter a valid payment id" CssClass="text-danger" />
            </div>
        </div>
        <div class="form-group mt-4">
            <div class="offset-md-2">
                <asp:Button CssClass="btn btn-primary" ID="UpdateButton" runat="server" OnClick="UpdateButtonClick" Text="Issue installments" />
            </div>
        </div>
    </asp:Panel>
    <asp:Panel runat="server" CssClass="my-5 alert alert-info" Visible="false" ID="ResultPanel">
        Installments issued successfully.
    </asp:Panel>
     <asp:Panel runat="server" CssClass="my-5 alert alert-danger" Visible="false" ID="ErrorPanel">
        Cannot issue installments.    
    </asp:Panel>
</asp:Content>
