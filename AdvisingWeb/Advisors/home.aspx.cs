using System;

namespace shalProj
{
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void view(object sender, EventArgs e)
        {
            Response.Redirect("view.aspx");
        }

        protected void insert(object sender, EventArgs e)
        {
            Response.Redirect("insert.aspx");
        }

        protected void courses(object sender, EventArgs e)
        {
            Response.Redirect("courses.aspx");
        }

        protected void Update(object sender, EventArgs e)
        {
            Response.Redirect("Update.aspx");
        }

        protected void delete(object sender, EventArgs e)
        {
            Response.Redirect("delete.aspx");
        }

        protected void assigned(object sender, EventArgs e)
        {
            Response.Redirect("assigned.aspx");
        }

        protected void requests(object sender, EventArgs e)
        {
            Response.Redirect("requests.aspx");
        }

        protected void pending(object sender, EventArgs e)
        {
            Response.Redirect("pending.aspx");
        }

        protected void credit(object sender, EventArgs e)
        {
            Response.Redirect("credit.aspx");
        }

        protected void course(object sender, EventArgs e)
        {
            Response.Redirect("course.aspx");
        }

       

    }
}