using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CIS.portals.admin
{
    public partial class SemesterCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModifySemesterCourse.aspx?SemesterCourse=-1");
        }

        protected void gdvSemesterCourse_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("ModifySemesterCourse.aspx?SemesterCourse="+gdvSemesterCourse.SelectedDataKey.Value.ToString());
        }
    }
}