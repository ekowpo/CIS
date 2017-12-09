using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CIS.model;

namespace CIS.portals.student
{
    public partial class feesPayment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CIS.model.login log = (CIS.model.login)Session["log"];
            CIS.model.user user = CIS.App_Code.User.getUser(log.user_id);
            txtfees.Text = CIS.App_Code.fees.getfeesbalance(user.students.First().student_id).ToString();
        }

        protected void btnpay_Click(object sender, EventArgs e)
        {
            CIS.model.login log = (CIS.model.login)Session["log"];
            CIS.model.user user = CIS.App_Code.User.getUser(log.user_id);
            CIS.model.feespayment fs = new CIS.model.feespayment();
            fs.id = 2;
            fs.semester_fee_id = 1;
            fs.student_id = user.students.First().student_id;
            fs.amount = double.Parse(txt_amount.Text);
            fs.date = DateTime.Now;


            using (var context = new csisEntities())
            {
                context.feespayments.Add(fs);
                context.SaveChanges();
            }

        }
    }
}