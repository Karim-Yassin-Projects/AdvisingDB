using AdvisingWeb.DatabaseAccess;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdvisingWeb.Students
{
    public partial class ViewGradPlan : StudentPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsCallback)
            {
                gridGradPlan.DataSource = Functions.ViewGradPlan(StudentID);
                gridGradPlan.DataBind();

            }
        }
        
    }
}