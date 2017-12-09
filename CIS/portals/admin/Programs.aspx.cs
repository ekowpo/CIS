using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CIS.portals.admin
{
    public partial class Programs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModifyProgram.aspx?ProgId=-1");
        }

      

        protected void gdvPrograms_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("ModifyProgram.aspx?ProgId=" + gdvPrograms.SelectedDataKey.Value.ToString());

        }
    }
}