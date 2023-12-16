<%@ Page Title="Admin Portal" Language="C#" MasterPageFile="~/Admins/Admins.Master" AutoEventWireup="true" CodeBehind="AdminHomePage.aspx.cs" Inherits="AdvisingWeb.Admins.AdminHomePage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">

        <div class="col-6 col-md-3 col-xl-2">
            <asp:HyperLink runat="server" CssClass="btn btn-outline-primary py-5 m-2 d-block" Height="150px" NavigateUrl="~/Admins/ListAdvisors">View Advisors</asp:HyperLink>
        </div>
        <div class="col-6 col-md-3 col-xl-2">
            <asp:HyperLink runat="server" CssClass="btn btn-outline-primary py-5 m-2 d-block" Height="150px" NavigateUrl="~/Admins/ListStudentsandAdvisors">View Students with advisors</asp:HyperLink>
        </div>
        <div class="col-6 col-md-3 col-xl-2">
            <asp:HyperLink runat="server" CssClass="btn btn-outline-primary py-5 m-2 d-block" Height="150px" NavigateUrl="~/Admins/AddMakeup">Add Makeup Exam</asp:HyperLink>
        </div>
        <div class="col-6 col-md-3 col-xl-2">
            <asp:HyperLink runat="server" CssClass="btn btn-outline-primary py-5 m-2 d-block" Height="150px" NavigateUrl="~/Admins/DeleteCourse">Delete Course</asp:HyperLink>
        </div>
        <div class="col-6 col-md-3 col-xl-2">
            <asp:HyperLink runat="server" CssClass="btn btn-outline-primary py-5 m-2 d-block" Height="150px" NavigateUrl="~/Admins/DeleteSlot">Delete Slot</asp:HyperLink>
        </div>
        <div class="col-6 col-md-3 col-xl-2">
            <asp:HyperLink runat="server" CssClass="btn btn-outline-primary py-5 m-2 d-block" Height="150px" NavigateUrl="~/Admins/DisplayPayments">Display Payments</asp:HyperLink>
        </div>
        <div class="col-6 col-md-3 col-xl-2">
            <asp:HyperLink runat="server" CssClass="btn btn-outline-primary py-5 m-2 d-block" Height="150px" NavigateUrl="~/Admins/FetchSemsterOfferedCourse">View Semester Offered Courses</asp:HyperLink>
        </div>

        <div class="col-6 col-md-3 col-xl-2">
            <asp:HyperLink runat="server" CssClass="btn btn-outline-primary py-5 m-2 d-block" Height="150px" NavigateUrl="~/Admins/IssueInstallment">Issue Installment</asp:HyperLink>
        </div>
        <div class="col-6 col-md-3 col-xl-2">
            <asp:HyperLink runat="server" CssClass="btn btn-outline-primary py-5 m-2 d-block" Height="150px" NavigateUrl="~/Admins/PendingRequests">Pending Requests</asp:HyperLink>
        </div>
        <div class="col-6 col-md-3 col-xl-2">
            <asp:HyperLink runat="server" CssClass="btn btn-outline-primary py-5 m-2 d-block" Height="150px" NavigateUrl="~/Admins/UpdateStudentStatus">Update Student Status</asp:HyperLink>
        </div>
        <div class="col-6 col-md-3 col-xl-2">
            <asp:HyperLink runat="server" CssClass="btn btn-outline-primary py-5 m-2 d-block" Height="150px" NavigateUrl="~/Admins/ViewActiveStudents">View Active Students</asp:HyperLink>
        </div>
        <div class="col-6 col-md-3 col-xl-2">
            <asp:HyperLink runat="server" CssClass="btn btn-outline-primary py-5 m-2 d-block" Height="150px" NavigateUrl="~/Admins/ViewGradPlan">View Graduation Plans</asp:HyperLink>
        </div>
        <div class="col-6 col-md-3 col-xl-2">
            <asp:HyperLink runat="server" CssClass="btn btn-outline-primary py-5 m-2 d-block" Height="150px" NavigateUrl="~/Admins/ViewStudentTranscript">View Students' transcripts</asp:HyperLink>
        </div>
    </div>
</asp:Content>
