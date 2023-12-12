<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddingPhoneNumberPage.aspx.cs" Inherits="AdvisingWeb.Students.AddingPhoneNumberPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    Phone Number:
    <br/>
    <asp:TextBox ID="PhoneNumber" runat="server"></asp:TextBox>
    <br/>
    <asp:Button ID="AddNumber" runat="server" Text="Add"/>
</asp:Content>
