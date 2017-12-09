using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CIS.model;

namespace CIS
{
    public partial class Default1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            using (var context = new csisEntities())
            {
                // login log = context.logins.ToList<login>().Where(detail => (detail.user_id == "Admin" && detail.password == "admin")).FirstOrDefault<login>();
                if (txtUserName.Text != string.Empty)
                {
                    if (txtPassword.Text != string.Empty)
                    {
                        CIS.model.login log = context.logins.ToList<CIS.model.login>().Where(logd => logd.user_id == txtUserName.Text && logd.password == App_Code.Password.md5PassordHashing(txtPassword.Text)).FirstOrDefault();
                        if (log != null)
                        {
                            Session["role"] = log.role.name;
                            Session["user"] = log.user.first_name + " " + log.user.last_name;
                            Session["log"] = log;
                            if (log.role.name.Equals("Admin"))
                                Response.Redirect("~/portals/admin/");
                            else if (log.role.name.Equals("Student"))
                                Response.Redirect("~/portals/student/");
                        }
                        else
                            lblError.Text = "Invalid Username or Password";
                    }
                    else
                    {
                        lblError.Text = "Please Enter A Password";
                    }

                }

                else
                {
                    lblError.Text = "Please Enter A Username";
                }
            }
        }

    }
}