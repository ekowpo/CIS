using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CIS.portals.admin
{
    public partial class Department : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gdvDept_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("ModifyDepartment.aspx?DeptId=" + gdvDept.SelectedDataKey.Value.ToString());
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModifyDepartment.aspx?DeptId=-1");
        }
    }
}