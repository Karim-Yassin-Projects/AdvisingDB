<%@ Page Title="Sending Credit Hour Request" Language="C#" MasterPageFile="~/Students/Students.Master" AutoEventWireup="true" CodeBehind="SendingCHRequestPage.aspx.cs" Inherits="AdvisingWeb.Students.SendingCHRequestPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel runat="server" ID="ResultPanel" Visible="false">
        <div class="alert alert-info">
            Credit hours' request sent successfully.
        <asp:Label runat="server" ID="CourseRequestSentLabel" />
        </div>
    </asp:Panel>

    <asp:Panel runat="server" ID="ErrorPanel" Visible="false">
        <div class="alert alert-danger">
            You are not assigned an advisor yet. You will be able to send credit hour requests when an administrator assigns an advisor to you.
        </div>
    </asp:Panel>

    <asp:Panel runat="server" ID="FormPanel">
        <div class="form-horizontal">
            <div class="form-group row my-2">
                <label class="form-label col-md-2 text-md-end" for="creditHours">Crdit Hours:</label>
                <div class="col-md-10">
                    <asp:TextBox ID="creditHours" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator Display="Dynamic" runat="server" ControlToValidate="creditHours" Text="Please enter number of credit hours." CssClass="text-danger" />
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
                <asp:Button ID="SendCHRequestButton" runat="server" OnClick="SendCHRequest" Text="Send Credit Hours Request" CssClass="btn btn-primary" />
            </div>
        </div>

    </asp:Panel>
</asp:Content>
