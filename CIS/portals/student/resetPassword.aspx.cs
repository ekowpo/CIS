using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace concordia_sis.portals.student
{
    public partial class resetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtNew.Text = string.Empty;
            txtOld.Text = string.Empty;
            txtConfirm.Text = string.Empty;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            CIS.model.login log = (CIS.model.login)Session["log"];

            bool status = CIS.App_Code.Password.changePassword(log.user_id, txtOld.Text, txtNew.Text);
            if (status == true)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Info", "success('Password Updated Successfully')", true);
                Session.Abandon();
                txtNew.Text = string.Empty;
                txtOld.Text = string.Empty;
                txtConfirm.Text = string.Empty;
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Error", "error('Password Was Not Updated Successfully', Please Try Again)", true);

            }
        }
    }
}