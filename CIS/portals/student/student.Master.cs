using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace concordia_sis.portals.student
{
    public partial class student : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] == null || Session["role"].ToString() != "Student")
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