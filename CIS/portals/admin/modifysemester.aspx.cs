using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace concordia_sis.portals.admin
{
    public partial class modifysemester : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
                if (!Page.IsPostBack == true)
                {
                Uri myUri = new Uri(Request.Url.AbsoluteUri.ToString());
                string semester_id = HttpUtility.ParseQueryString(myUri.Query).Get("semesterId");
                if (semester_id != null)
                {
                    int semesterId = int.Parse(HttpUtility.ParseQueryString(myUri.Query).Get("semesterId"));
                    if (semesterId > 0)
                    {
                        CIS.model.semester semester = CIS.App_Code.Semester.getSemester(semesterId);
                        txtDNE.Text = (semester.DNE as DateTime?).Value.ToShortDateString();
                        txtEndDate.Text = semester.endDate.ToShortDateString();
                        txtStateDate.Text = semester.startDate.ToShortDateString();
                        ddlTypes.SelectedValue = semester.name.ToString();
                    }

                    ddlTypes.SelectedItem.Value = ddlTypes.SelectedItem.Value;
                }
            }

        }

        private void reset()
        {
            txtDNE.Text = string.Empty;
            txtEndDate.Text = string.Empty;
            txtStateDate.Text = string.Empty;
            ddlTypes.SelectedIndex = 0;
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            reset();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Uri myUri = new Uri(Request.Url.AbsoluteUri.ToString());
            string semester_id = HttpUtility.ParseQueryString(myUri.Query).Get("semesterId");
            if (semester_id != null)
            {
                int semesterId = int.Parse(HttpUtility.ParseQueryString(myUri.Query).Get("semesterId"));

                CIS.model.semester semester = new CIS.model.semester();
                semester.DNE = DateTime.Parse(txtDNE.Text);
                semester.name = ddlTypes.SelectedValue.ToString();
                semester.startDate = DateTime.Parse(txtStateDate.Text);
                semester.endDate = DateTime.Parse(txtEndDate.Text);

                if (semesterId == -1)
                {

                    CIS.App_Code.Semester.saveSemester(semester);
                    if (semester.semester_id > 0)
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
                    semester.semester_id = semesterId;
                    
                    if (CIS.App_Code.Semester.updateSemester(semester))
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
    }
}