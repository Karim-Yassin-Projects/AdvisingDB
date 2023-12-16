using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdvisingWeb.Advisors
{
    public partial class ViewPendingRequests : AdvisorPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Grid.DataSource = DatabaseAccess.Procedures.AdvisorPendingRequests(AdvisorID);
                Grid.DataBind();
            }

        }
    }
}