<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AdvisingWeb._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <section class="row" aria-labelledby="aspnetTitle">
            <h1 id="aspnetTitle">GUC Advising website</h1>
        </section>

        <div class="row">
            <section class="col-12" aria-labelledby="gettingStartedTitle">
                <asp:HyperLink CssClass="btn btn-outline-primary p-5 m-2" runat="server" NavigateUrl="~/Students/LoginPage">Student Portal</asp:HyperLink>
                <asp:HyperLink CssClass="btn btn-outline-primary p-5 m-2" runat="server" NavigateUrl="~/Advisors/LoginPage">Advisor Portal</asp:HyperLink>
                <asp:HyperLink CssClass="btn btn-outline-primary p-5 m-2" runat="server" NavigateUrl="~/Admins/AdminLogin">Admin Portal</asp:HyperLink>
            </section>
        </div>
    </main>

</asp:Content>
