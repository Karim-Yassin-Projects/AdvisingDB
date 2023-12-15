<%@ Page Title="Second Makeup Registration" Language="C#" MasterPageFile="~/Students/Students.Master" AutoEventWireup="true" CodeBehind="SecondMakeupRegistration.aspx.cs" Inherits="AdvisingWeb.Students.SecondMakeupRegistration" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-horizontal">
        <asp:PlaceHolder ID="SemesterCodesPanel" runat="server">
            <div class="form-horizontal my-3">
                <div class="row">
                    <label for="SemesterCode" class="col-md-2">Semester Code:</label>
                    <div class="col-md-10">
                        <asp:DropDownList runat="server" ID="SemesterCodes" CssClass="form-control" OnSelectedIndexChanged="SemesterCodes_SelectedIndexChanged" AutoPostBack="true" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="SemesterCodes" Display="Dynamic" Text="Please select a semester code." CssClass="text-danger" />
                    </div>
                </div>
            </div>
        </asp:PlaceHolder>
        <asp:Panel runat="server" Visible="false" ID="ResultPanel" >
            <div class="form-group row my-2">
                <asp:Label ID="ResultText" runat="server" />
            </div>
        </asp:Panel>
        <asp:PlaceHolder runat="server" ID="CourseSelectionPanel">
            <div class="form-horizontal my-3">
                <div class="row">
                    <label for="CourseID" class="col-md-2">Course:</label>
                    <div class="col-md-10">
                        <asp:DropDownList runat="server" ID="CourseID" CssClass="form-control" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="CourseID" Display="Dynamic" Text="Please select a course." CssClass="text-danger" />
                    </div>
                </div>
            </div>
            <div class="form-group my-3 row">
                <div class="offset-md-2">
                    <asp:Button ID="RegisterButton" runat="server" OnClick="RegisterButton_Click" Text="Register" CssClass="btn btn-primary" />
                </div>
            </div>
        </asp:PlaceHolder>
    </div>
</asp:Content>
