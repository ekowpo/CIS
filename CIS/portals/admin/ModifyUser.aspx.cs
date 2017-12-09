using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CIS.model;

namespace CIS.portals.admin
{
    public partial class ModifyUser : System.Web.UI.Page
    {
        protected void Page_LoadComplete(object sender, EventArgs e)
        {
            if (!Page.IsPostBack == true)
            {
                Uri myUri = new Uri(Request.Url.AbsoluteUri.ToString());
                string user_Id = HttpUtility.ParseQueryString(myUri.Query).Get("userId");
                if (user_Id != null)
                {

                    CIS.model.user user = CIS.App_Code.User.getUser(user_Id);
                    txtAddress.Text = user.Address;
                    txtFirstName.Text = user.first_name;
                    txtLastName.Text = user.last_name;
                    txtDOB.Text = user.DOB.ToShortDateString();
                    txtEmail.Text = user.email;
                    txtPhone.Text = user.phone;
                    txtUsername.Text = user.user_id;
                    txtUsername.Enabled = false;
                    ddlStatus.SelectedValue = user.login.State;
                    
                    ddlRole.SelectedValue = user.login.role_id.ToString();
                    if (user.login.role_id==1)
                    {
                        // ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Info", "hide('student')", true);
                        //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Info", "hide('dept')", true);
                    }
                    else if (user.login.role_id==2)
                    {
                        //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Info", "show('student')", true);
                        //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Info", "show('dept')", true);
                        ddlDept.SelectedValue = user.students.First().program1.department1.departmentId.ToString();
                        ddlProgram.SelectedValue = user.students.First().program.ToString();
                        ddlStudentStatus.SelectedValue = user.students.First().status;
                        txtStartDate.Text = user.students.First().admission_date.ToShortDateString();
                        txtCompletionDate.Text = user.students.First().completion_date.ToShortDateString();
                    }
                    else if (user.login.role_id==3)
                    {
                        //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Info", "hide('student')", true);
                        ddlDept.SelectedValue = user.lecturers.FirstOrDefault<CIS.model.lecturer>().department.ToString();
                    }
                    else if (user.login.role_id==4)
                    {
                        //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Info", "hide('student')", true);
                        ddlDept.SelectedValue = user.courseadvisors.FirstOrDefault<CIS.model.courseadvisor>().department.ToString();

                    }

                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }


        protected void btnCancel_Click(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Uri myUri = new Uri(Request.Url.AbsoluteUri.ToString());
            string user_Id = HttpUtility.ParseQueryString(myUri.Query).Get("userId");
            if (user_Id == null)
            {
                user newUser = new user();
                newUser.user_id = txtUsername.Text;
                newUser.first_name = txtFirstName.Text;
                newUser.last_name = txtLastName.Text;
                newUser.DOB = DateTime.Parse(txtDOB.Text);
                newUser.email = txtEmail.Text;
                newUser.Address = txtAddress.Text;
                newUser.phone = txtPhone.Text;


                newUser.login = new login() {
                    role_id = int.Parse(ddlRole.SelectedValue),
                    user_id= txtUsername.Text,
                password = CIS.App_Code.Password.md5PassordHashing(txtPassword.Text),
                State = ddlStatus.Text};
                

                if (ddlRole.SelectedValue == "3")
                {
                    newUser.lecturers.Add(new lecturer()
                    {
                        user_id = txtUsername.Text,
                        department = int.Parse(ddlDept.SelectedValue)
                    });

                }

                if (ddlRole.SelectedValue == "4")
                {
                    newUser.courseadvisors.Add(new courseadvisor() {
                          department = int.Parse(ddlDept.SelectedValue)
                          
                         });
                    
                }

                if (ddlRole.SelectedValue == "2")
                {
                    newUser.students.Add(new model.student()
                    {
                        user_id = txtUsername.Text,
                        admission_date = DateTime.Parse(txtStartDate.Text),
                        completion_date = DateTime.Parse(txtCompletionDate.Text),
                        program = int.Parse(ddlProgram.SelectedValue),
                        program1=CIS.App_Code.Programs.getProgram(int.Parse(ddlProgram.SelectedValue)),
                        status = ddlStudentStatus.Text

                    });

                }

                CIS.App_Code.User.saveUser(newUser);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "success('Record Inserted Successfully')", true);


            }
            else
            {
                user newUser = CIS.App_Code.User.getUser(user_Id);
                if(newUser!= null) {
                    txtUsername.Text = newUser.user_id;
                    txtUsername.Enabled = false;
                    newUser.first_name = txtFirstName.Text;
                    newUser.last_name = txtLastName.Text;
                    newUser.DOB = DateTime.Parse(txtDOB.Text);
                    newUser.email = txtEmail.Text;
                    newUser.Address = txtAddress.Text;
                    newUser.login.State = ddlStatus.Text;

                    newUser.login.role_id = int.Parse(ddlRole.SelectedValue);
                    if(!String.IsNullOrWhiteSpace(txtPassword.Text) && !String.IsNullOrEmpty(txtPassword.Text))
                    {
                        newUser.login.password = CIS.App_Code.Password.md5PassordHashing(txtPassword.Text);
                        newUser.login.State= "FirstTime";
                    }
                    
                    

                    if (ddlRole.SelectedValue == "Lecturer")
                    {
                        lecturer lec = new lecturer();
                        lec.department = int.Parse(ddlDept.SelectedValue);
                        newUser.lecturers.Add(lec);
                    }

                    if (ddlRole.SelectedValue == "CourseAdvisor")
                    {
                        courseadvisor newCourseAdvisor = new courseadvisor();
                        newCourseAdvisor.department = int.Parse(ddlDept.SelectedValue);
                        newUser.courseadvisors.Add(newCourseAdvisor);
                    }

                    if (ddlRole.SelectedValue == "Student")
                    {
                        model.student newStudent = new model.student();
                        newStudent.admission_date = DateTime.Parse(txtStartDate.Text);
                        newStudent.completion_date = DateTime.Parse(txtCompletionDate.Text);
                        newStudent.program = int.Parse(ddlProgram.SelectedValue);
                        newStudent.status = ddlStudentStatus.Text;
                        newUser.students.Add(newStudent);

                    }

                  if(CIS.App_Code.User.updateUserByAdmin(newUser))
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "success('Record updated Successfully')", true);

                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "error('Record Was Not updated Successfully')", true);

                    }
                }
                
            }
        }
    }
}