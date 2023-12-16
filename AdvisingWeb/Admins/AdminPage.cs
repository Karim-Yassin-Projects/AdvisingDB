using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace AdvisingWeb.Admins
{
    public class AdminPage : Page
    {
        protected override void OnLoad(EventArgs e)
        {
            if (Session["AdminID"] == null)
            {
                Response.Redirect("~/Admins/AdminLogin");
            }
            AdminID = (int)Session["AdminID"];
            base.OnLoad(e);
        }

        public int AdminID { get; private set; }
    }
}
