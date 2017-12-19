using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CIS.model;
using Microsoft.Reporting.WebForms;
using System.Data;

namespace CIS.portals.student
{
    public partial class Transcript : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] == null || Session["role"].ToString() != "Student")
            {
                Response.Redirect("~/");
            }
             using (var context = new csisEntities())
             {
                 CIS.model.login log = (CIS.model.login)Session["log"];
                 CIS.model.user user = CIS.App_Code.User.getUser(log.user_id);
                 edsTrans.WhereParameters["id"].DefaultValue = user.students.First().student_id.ToString();
                edsGPAS.WhereParameters["id"].DefaultValue = user.students.First().student_id.ToString();
                EntityDataSource2.WhereParameters["id"].DefaultValue = user.students.First().student_id.ToString();
                EntityDataSource1.WhereParameters["id"].DefaultValue = user.students.First().student_id.ToString();
                edsTrans.DataBind();
                EntityDataSource2.DataBind();
                edsGPAS.DataBind();
                EntityDataSource1.DataBind();
                 ReportViewer1.DataBind();
             }
           // getdata();
        }

        private void getdata()
        {

            using (var context = new csisEntities())
            {
                CIS.model.login log = (CIS.model.login)Session["log"];
                CIS.model.user user = CIS.App_Code.User.getUser(log.user_id);
                int id = int.Parse(user.students.First().student_id.ToString());
                ReportViewer1.Reset();
                ReportViewer1.LocalReport.ReportPath = "../CIS/portals/CommonRdlc/transcript.rdlc";
                ReportViewer1.LocalReport.DataSources.Clear();
                ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("rptgrades", context.reportdatas.Where(rd => rd.student_id == id).ToList()));
                ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("rptDetails", context.reportdemogs.Where(rd => rd.student_id == user.students.First().student_id)));
                ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("CGPA", context.gpas.Where(rd => rd.student_id == id)));



                //ReportViewer1.LocalReport.DataSources.Clear();
                ReportViewer1.DataBind();
            }

        }


    }
}