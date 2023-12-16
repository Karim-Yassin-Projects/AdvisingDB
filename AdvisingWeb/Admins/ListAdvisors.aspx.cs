using AdvisingWeb.DatabaseAccess;
using AdvisingWeb.Students;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdvisingWeb.Admins
{
    public partial class ListAdvisors : AdminPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            gridAdvisors.DataSource = Procedures.ListAdvisors();
            gridAdvisors.DataBind();
            gridAdvisors.Visible = true;
        }
    }
}