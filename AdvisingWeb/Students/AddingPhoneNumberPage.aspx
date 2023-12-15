<%@ Page Title="Adding Phone Number" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddingPhoneNumberPage.aspx.cs" Inherits="AdvisingWeb.Students.AddingPhoneNumberPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<asp:Panel runat="server" ID="ResultPanel" Visible="false">
    <div class="alert alert-info">
        Phone number added successfully.
        <asp:Label runat="server" ID="PhoneAddedLabel" />
    </div>
</asp:Panel>

<asp:Panel runat="server" ID="FormPanel">
    <div class="form-horizontal">
    <div class="form-group row my-2">
        <label class="form-label col-md-2 text-md-end" for="PhoneNumber">Phone Number:</label>
        <div class="col-md-10">
            <asp:TextBox ID="PhoneNumber" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator Display="Dynamic" runat="server" ControlToValidate="PhoneNumber" Text="Please enter a phone number you wish to add." CssClass="text-danger" />
        </div>
    </div>
        </div>
    <div class="form-group my-3 row">
    <div class="offset-md-2">
        <asp:Button ID="AddPhoneButton" runat="server" OnClick="AddPhone" Text="Add Phone Number" CssClass="btn btn-primary" />
    </div>
</div>
        
   </asp:Panel>

</asp:Content>
