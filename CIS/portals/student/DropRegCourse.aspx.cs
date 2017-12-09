using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

namespace CIS.portals.student
{
    public partial class DropRegCourse : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] == null || Session["role"].ToString() != "Student")
            {
                Response.Redirect("~/");
            }
           

            if (!IsPostBack)
            {
                edsSemester.Where = "it.DNE >= @date";
                edsSemester.WhereParameters.Add("date", System.Data.DbType.Date, DateTime.Now.ToShortDateString());
                CIS.model.login log = (CIS.model.login)Session["log"];
                CIS.model.user user = CIS.App_Code.User.getUser(log.user_id);
                edsRegCourse.WhereParameters["studentId"].DefaultValue= user.students.First().student_id.ToString();
                edsRegCourse.DataBind();
            }
        }

        protected void ddlSemester_SelectedIndexChanged(object sender, EventArgs e)
        {
            edsRegCourse.WhereParameters["semesterId"].DefaultValue = ddlSemester.SelectedValue;
            edsRegCourse.DataBind();
        }

        protected void gdvRegCourses_SelectedIndexChanged(object sender, EventArgs e)
        {
            int student_id = int.Parse(gdvRegCourses.DataKeys[0].Values["student_id"].ToString());
            int semesterCourse_id = int.Parse(gdvRegCourses.DataKeys[0].Values["semesterCourse_id"].ToString());
            string message =CIS.App_Code.CourseEnrollment.dropRegisteredCourse(semesterCourse_id, student_id);
            if (message.Equals("success"))
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Info", "success('Course dropped successfully')", true);
                gdvRegCourses.DataBind();
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Info", "error('"+ message+"')", true);

            }
        }
    }
}