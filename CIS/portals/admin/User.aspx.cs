using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CIS.portals.admin
{
    public partial class User : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gdvUser_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("ModifyUser.aspx?userId=" + gdvUser.DataKeys[0].Values["user_id"].ToString());

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModifyUser.aspx");
        }

    
    }
}