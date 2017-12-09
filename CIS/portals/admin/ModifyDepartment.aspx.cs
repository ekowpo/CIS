using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CIS.portals.admin
{
    public partial class ModifyDepartment : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack == true)
            {
                Uri myUri = new Uri(Request.Url.AbsoluteUri.ToString());
                string deptId = HttpUtility.ParseQueryString(myUri.Query).Get("DeptId");
                if (deptId != null)
                {
                    int departmentId = int.Parse(HttpUtility.ParseQueryString(myUri.Query).Get("DeptId"));
                    if (departmentId > 0)
                    {
                        CIS.model.department dept = CIS.App_Code.Department.getDept(departmentId);
                        txtName.Text = dept.name;
                        txtCode.Text = dept.code;
                       
                    }

                   
                }
            }
        }

        private void reset()
        {
            txtName.Text = string.Empty;
            txtCode.Text = string.Empty;
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            reset();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Uri myUri = new Uri(Request.Url.AbsoluteUri.ToString());
            string dept_id = HttpUtility.ParseQueryString(myUri.Query).Get("DeptId");
            if (dept_id != null)
            {
                int departmentId = int.Parse(HttpUtility.ParseQueryString(myUri.Query).Get("DeptId"));

                CIS.model.department dept = new CIS.model.department();
                dept.code = txtCode.Text;
                dept.name = txtName.Text;
               

                if (departmentId == -1)
                {

                    CIS.App_Code.Department.saveDept(dept);
                    if (dept.departmentId > 0)
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
                    dept.departmentId = departmentId;
                    
                    if (CIS.App_Code.Department.updateDept(dept))
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