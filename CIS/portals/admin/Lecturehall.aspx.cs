using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CIS.portals.admin
{
    public partial class Lecturehall : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModifyLectureHall.aspx?lectureHall=-1");
        }

        protected void gdvLectureHall_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("ModifyLectureHall.aspx?lectureHall=" + gdvLectureHall.SelectedDataKey.Value.ToString());

        }
    }
}