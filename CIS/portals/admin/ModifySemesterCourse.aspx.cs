using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CIS.portals.admin
{
    public partial class ModifySemesterCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack == true)
            {
                Uri myUri = new Uri(Request.Url.AbsoluteUri.ToString());
                string semesterCourse_id = HttpUtility.ParseQueryString(myUri.Query).Get("SemesterCourse");
                if (semesterCourse_id != null)
                {
                    int semesterCourseId = int.Parse(HttpUtility.ParseQueryString(myUri.Query).Get("SemesterCourse"));
                    if (semesterCourseId > 0)
                    {
                        CIS.model.semestercourse semesterCourse = CIS.App_Code.SemesterCourse.getSemesterCourse(semesterCourseId);
                        ddlSemester.SelectedValue = semesterCourse.semester_id.ToString();
                        ddlLectureHall.SelectedValue = semesterCourse.lecture_hall.ToString();
                        ddlLecture.SelectedValue = semesterCourse.lecturer.ToString();
                        ddlDepartment.SelectedValue = semesterCourse.course.department.ToString();
                        ddlCourse.SelectedValue = semesterCourse.course_id.ToString();
                        ddlDay.SelectedValue = semesterCourse.day;
                        txtStartTime.Text = semesterCourse.start_time.ToString(@"hh\:mm");
                        txtEndTime.Text = semesterCourse.end_time.ToString(@"hh\:mm");



                    }
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            reset();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            CIS.model.semestercourse semesterCourse = new model.semestercourse();
            semesterCourse.course_id = int.Parse(ddlCourse.SelectedValue);
            semesterCourse.semester_id = int.Parse(ddlSemester.SelectedValue);
            semesterCourse.lecturer = int.Parse(ddlLecture.SelectedValue);
            semesterCourse.lecture_hall = int.Parse(ddlLectureHall.SelectedValue);
            semesterCourse.start_time = TimeSpan.Parse(txtStartTime.Text);
            semesterCourse.end_time = TimeSpan.Parse(txtEndTime.Text);
            semesterCourse.day = ddlDay.SelectedValue;

            Uri myUri = new Uri(Request.Url.AbsoluteUri.ToString());
            string semesterCourse_id = HttpUtility.ParseQueryString(myUri.Query).Get("SemesterCourse");
            if (semesterCourse_id != null)
            {
                int semesterCourseId = int.Parse(HttpUtility.ParseQueryString(myUri.Query).Get("SemesterCourse"));
                if (semesterCourseId > 0)
                {
                    semesterCourse.id = semesterCourseId;
                   string status = CIS.App_Code.SemesterCourse.updateSemesterCourse(semesterCourse);
                    if(status.Equals("success"))
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Info", "success('"+ status + "')", true);
                        reset();
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Error", "error('"+ status + "')", true);
                        
                    }

                }
                else
                {
                    string status  = CIS.App_Code.SemesterCourse.saveSemesterCourse(semesterCourse);
                    if (status.Equals("successful"))
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Info", "success('" + status + "')", true);
                        reset();
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Error", "error('" + status + "')", true);

                    }
                }

            }
        }

        public void reset()
        {
            txtEndTime.Text = string.Empty;
            txtStartTime.Text = string.Empty;
            ddlDay.SelectedIndex = 0;
            ddlCourse.SelectedIndex = 0;
            ddlDepartment.SelectedIndex = 0;
            ddlLecture.SelectedIndex = 0;
            ddlLectureHall.SelectedIndex = 0;
            ddlSemester.SelectedIndex = 0;
        }
    }
}