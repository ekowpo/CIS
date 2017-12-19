using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CIS.portals.student
{
    public partial class RegisterCourse : System.Web.UI.Page
    {
        public static ArrayList addCourse;
        public static ArrayList regCourse;
        public static Boolean status;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Info", "hide('selectedCourse')", true);
                edsSemester.Where = "it.DNE >= @date";
                edsSemester.WhereParameters.Add("date", System.Data.DbType.Date, DateTime.Now.ToShortDateString());
                addCourse = new ArrayList();
                status = false;
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
 
            gdvSemesterCourse.DataBind();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Info", "hide('selectedCourse')", true);


        }


        protected void gdvSemesterCourse_SelectedIndexChanged(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Info", "hide('selectedCourse')", true);

            CIS.model.login log = (CIS.model.login)Session["log"];
            CIS.model.user user = CIS.App_Code.User.getUser(log.user_id);
            if (status == false)
            {

                regCourse = CIS.App_Code.CourseEnrollment.getALLsemesterRegistedCourse(int.Parse(ddlSemester.SelectedValue), user.students.First().student_id);
             
            }
            
            int semesterCourseId = int.Parse(gdvSemesterCourse.SelectedDataKey.Value.ToString());//gdvSemesterCourse.DataKeys[0].Values["id"].ToString());
            CIS.model.semestercourse sc = CIS.App_Code.SemesterCourse.getSemesterCourse(semesterCourseId);
            
            
            if (sc.course.department == user.students.First().program1.Department)   {


                if (CIS.App_Code.SemesterCourse.getCurrentClassSize(semesterCourseId) <= sc.lecturehall.space)
                {

                    if (!regCourse.Contains(semesterCourseId))
                    {
                        bool state = false;
                        foreach(CIS.model.semestercourse cs in addCourse)
                        {
                            if(cs.course_id == sc.course_id)
                            {
                                state = true;
                                break;
                            }
                        }
                        if (!state)
                        {

                            addCourse.Add(CIS.App_Code.SemesterCourse.getSemesterCourse(semesterCourseId));
                            regCourse.Add(semesterCourseId);
                        }
                        else
                        {
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Info", "error('Course has already been added')", true);

                        }
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Info", "error('Course has already been registered')", true);

                    }

                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Info", "error('Class is full')", true);

                }
            }

            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Info", "error('Course selected is out of your department, please see your course advisor')", true);

            }


        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            if (addCourse.Count > 0)
            {

                //string param= string.Join(",", addCourse.ToArray());
                // gdvselectedCourse.DataBind();
                gdvselectedCourse.DataSource = addCourse;
                gdvselectedCourse.DataBind();
                // Page.ClientScript.RegisterStartupScript(this.GetType(), "Info", "hide('selectedCourse')", true);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Info", "hide('continue')", true);

            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Info", "error('No course Added')", true);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Info", "hide('continue')", true);

            }




        }

        protected void btnEnroll_Click(object sender, EventArgs e)
        {
            ArrayList notsuccessfull = new ArrayList();
            foreach(CIS.model.semestercourse id in addCourse)
            {

                CIS.model.login log = (CIS.model.login)Session["log"];
                CIS.model.user user = CIS.App_Code.User.getUser(log.user_id);
                CIS.model.courseregistration newcourseregistration = new model.courseregistration();
                newcourseregistration.semesterCourse_id = id.id;
                newcourseregistration.student_id = user.students.First().student_id;
                newcourseregistration.Status = "in-process";
                newcourseregistration.Grade = "";
                string message=CIS.App_Code.CourseEnrollment.addRegistered(newcourseregistration);

                if (message.Equals("success"))
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Info", "success('Record Add Successfully')", true);
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Info", "hide('continue')", true);

                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Info", "error('"+message+"')", true);
                    // Page.ClientScript.RegisterStartupScript(this.GetType(), "Info", "hide('selectedCourse')", true);
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Info", "hide('continue')", true);

                    notsuccessfull.Add(id);
                }

                addCourse = notsuccessfull;
                gdvselectedCourse.DataSource = addCourse;
                gdvselectedCourse.DataBind();
            }
            
        }

        protected void gdvselectedCourse_SelectedIndexChanged(object sender, EventArgs e)
        {
            ArrayList clone = addCourse;
            foreach(CIS.model.semestercourse sc in clone)
            {
                if (sc.id == int.Parse(gdvSemesterCourse.SelectedDataKey.Value.ToString())){
                    addCourse.Remove(sc);
                    break;
                }
            }


           // CIS.App_Code.SemesterCourse.getSemesterCourse(int.Parse(gdvSemesterCourse.SelectedDataKey.Value.ToString())));
            gdvselectedCourse.DataSource = addCourse;
            // edsSelectedCourses.WhereParameters["ids"].DefaultValue = string.Join(",", addCourse.ToArray());
            gdvselectedCourse.DataBind();

            if (addCourse.Count > 0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Info", "hide('continue')", true);

            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Info", "hide('selectedCourse')", true);

            }
        }
    }
}