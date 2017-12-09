using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace concordia_sis.admin
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["role"]==null || Session["role"].ToString()!= "Admin" )
            {
                Response.Redirect("~/");
            }
            else
            {
                lblUsername.Text = Session["user"].ToString();
            }
        }

        protected void btnLogou1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/");

        }
    }
}