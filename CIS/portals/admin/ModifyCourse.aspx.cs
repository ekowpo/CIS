using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace CIS.portals.admin
{
    public partial class ModifyCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack == true)
            {
                Uri myUri = new Uri(Request.Url.AbsoluteUri.ToString());
                string course_id = HttpUtility.ParseQueryString(myUri.Query).Get("courseId");
                if (course_id != null)
                {
                    int courseId = int.Parse(HttpUtility.ParseQueryString(myUri.Query).Get("courseId"));
                    if (courseId > 0)
                    {
                        CIS.model.course course = CIS.App_Code.Course.getCourse(courseId);
                        txtDescription.Text = course.description;
                        txtCode.Text = course.code;
                        txtCredit.Text = course.credit.ToString();
                        ddlDepartment.SelectedValue = course.department.ToString();


                    }


                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Uri myUri = new Uri(Request.Url.AbsoluteUri.ToString());
            string course_id = HttpUtility.ParseQueryString(myUri.Query).Get("courseId");
            if (course_id != null)
            {
                int courseId = int.Parse(HttpUtility.ParseQueryString(myUri.Query).Get("courseId"));

                CIS.model.course course = new CIS.model.course();
                course.code = txtCode.Text;
                course.description = txtDescription.Text;
                course.credit= int.Parse(txtCredit.Text);
                course.department = int.Parse(ddlDepartment.SelectedValue);


                if (courseId == -1)
                {

                    CIS.App_Code.Course.saveCourse(course);
                    if (course.course_id > 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Info", "success('Record Inserted Successfully')", true);
                        reset();
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "error('Record Was Not Inserted Successfully')", true);

                    }
                }
                else
                {
                    course.course_id = courseId;
                    
                    if (CIS.App_Code.Course.updateCourse(course))
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Info", "success('Record Updated Successfully')", true);
                        reset();
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "error('Record Was Not Updated Successfully')", true);

                    }
                }
            }
        }
        
        public void reset()
        {
            txtCode.Text = string.Empty;
            txtCredit.Text = "0";
            txtDescription.Text = string.Empty;
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            reset();
        }
    }
}