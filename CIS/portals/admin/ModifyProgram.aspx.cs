using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CIS.model;

namespace CIS.portals.admin
{
    public partial class ModifyProgram : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack == true)
            {
                Uri myUri = new Uri(Request.Url.AbsoluteUri.ToString());
                string program_id = HttpUtility.ParseQueryString(myUri.Query).Get("ProgId");
                if (program_id != null)
                {
                    int ProgramtId = int.Parse(HttpUtility.ParseQueryString(myUri.Query).Get("ProgId"));
                    if (ProgramtId > 0)
                    {
                        CIS.model.program prog = CIS.App_Code.Programs.getProgram(ProgramtId);
                        txtName.Text = prog.Name;
                        txtFees.Text = prog.termFees.ToString();
                        txtCredit.Text = prog.requiredCredit.ToString();
                        ddlDepartment.SelectedValue = prog.Department.ToString();

                    }


                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            Uri myUri = new Uri(Request.Url.AbsoluteUri.ToString());
            string program_id = HttpUtility.ParseQueryString(myUri.Query).Get("ProgId");
            if (program_id != null)
            {
                int programId = int.Parse(HttpUtility.ParseQueryString(myUri.Query).Get("ProgId"));

                program prog = new program();
                prog.Department = int.Parse(ddlDepartment.SelectedValue);
                prog.requiredCredit = int.Parse(txtCredit.Text);
                prog.Name = txtName.Text;
                prog.termFees = double.Parse(txtFees.Text);



                if (programId == -1)
                {

                    CIS.App_Code.Programs.saveProgram(prog);
                    if (prog.id > 0)
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
                    prog.id = programId;

                    if (CIS.App_Code.Programs.updateProgram(prog))
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

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            reset();
        }

        public void reset()
        {
            txtCredit.Text = string.Empty;
            txtName.Text = string.Empty;
            txtFees.Text = string.Empty;
            ddlDepartment.SelectedIndex = 0;
        }
        
    }
}