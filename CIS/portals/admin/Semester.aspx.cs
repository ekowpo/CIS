﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace concordia_sis.admin
{
    public partial class Semester : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("modifySemester.aspx?semesterId=-1");
        }

        protected void gvSemester_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("modifySemester.aspx?semesterId=" + gvSemester.SelectedDataKey.Value.ToString());
        }
    }
}