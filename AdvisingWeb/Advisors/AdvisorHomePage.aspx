<%@ Page Title="" Language="C#" MasterPageFile="~/Advisors/AdvisorMaster.master" AutoEventWireup="true" CodeBehind="AdvisorHomePage.aspx.cs" Inherits="AdvisingWeb.Advisors.AdvisorHomePage" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">

    <div class="row">

        <div class="col-6 col-md-3 col-xl-2">
            <asp:HyperLink runat="server" CssClass="btn btn-outline-primary py-5 m-2 d-block" Height="150px" NavigateUrl="~/Advisors/AddGradPlan">Add Graduation Plan</asp:HyperLink>
        </div>
        <div class="col-6 col-md-3 col-xl-2">
            <asp:HyperLink runat="server" CssClass="btn btn-outline-primary py-5 m-2 d-block" Height="150px" NavigateUrl="~/Advisors/UpdateGradDate">Change Graduation Plan Graduation Date</asp:HyperLink>
        </div>
        <div class="col-6 col-md-3 col-xl-2">
            <asp:HyperLink runat="server" CssClass="btn btn-outline-primary py-5 m-2 d-block" Height="150px" NavigateUrl="~/Advisors/AddCourseToGradPlan">Add Course to Graduation Plan</asp:HyperLink>
        </div>
        <div class="col-6 col-md-3 col-xl-2">
            <asp:HyperLink runat="server" CssClass="btn btn-outline-primary py-5 m-2 d-block" Height="150px" NavigateUrl="~/Advisors/DeleteCourseFromPlan">Delete Course from Plan</asp:HyperLink>
        </div>
        <div class="col-6 col-md-3 col-xl-2">
            <asp:HyperLink runat="server" CssClass="btn btn-outline-primary py-5 m-2 d-block" Height="150px" NavigateUrl="~/Advisors/ViewAdvisingStudents">View Advising Students</asp:HyperLink>
        </div>
        <div class="col-6 col-md-3 col-xl-2">
            <asp:HyperLink runat="server" CssClass="btn btn-outline-primary py-5 m-2 d-block" Height="150px" NavigateUrl="~/Advisors/ViewAllRequests">View All Requests</asp:HyperLink>
        </div>
        <div class="col-6 col-md-3 col-xl-2">
            <asp:HyperLink runat="server" CssClass="btn btn-outline-primary py-5 m-2 d-block" Height="150px" NavigateUrl="~/Advisors/ViewPendingRequests">ViewPendingRequests</asp:HyperLink>
        </div>
        
    </div>

</asp:Content>
