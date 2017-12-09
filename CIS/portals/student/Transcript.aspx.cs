using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CIS.model;

namespace CIS.portals.student
{
    public partial class Transcript : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] == null || Session["role"].ToString() != "Student")
            {
                Response.Redirect("~/");
            }
            using (var context = new csisEntities())
            {
                CIS.model.login log = (CIS.model.login)Session["log"];
                CIS.model.user user = CIS.App_Code.User.getUser(log.user_id);
                edsTrans.WhereParameters["id"].DefaultValue = user.students.First().student_id.ToString();
                
                edsTrans.DataBind();
                ReportViewer1.DataBind();
            }
        }
    }
}