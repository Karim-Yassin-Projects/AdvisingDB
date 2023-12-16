using AdvisingWeb.DatabaseAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdvisingWeb.Admins
{
    public partial class ListStudentsandAdvisors : AdminPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            gridStudentsandAdvisors.DataSource = Procedures.ListStudentsWithAdvisors();
            gridStudentsandAdvisors.DataBind();
            gridStudentsandAdvisors.Visible = true;
        }
    }
}