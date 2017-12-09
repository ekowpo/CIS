using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CIS.model;

namespace CIS.portals.admin
{
    public partial class ModifyLectureHall : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack == true)
            {
                Uri myUri = new Uri(Request.Url.AbsoluteUri.ToString());
                string hall_id = HttpUtility.ParseQueryString(myUri.Query).Get("lectureHall");
                if (hall_id != null)
                {
                    int hallId = int.Parse(HttpUtility.ParseQueryString(myUri.Query).Get("lectureHall"));
                    if (hallId > 0)
                    {
                        CIS.model.lecturehall hall = CIS.App_Code.LectureHall.getLectureHall(hallId);
                        txtBuilding.Text = hall.building;
                        txtRoom.Text = hall.room_number;

                    }


                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Uri myUri = new Uri(Request.Url.AbsoluteUri.ToString());
            string lectureHall_id = HttpUtility.ParseQueryString(myUri.Query).Get("lectureHall");
            if (lectureHall_id != null)
            {
                int lectureHallId = int.Parse(HttpUtility.ParseQueryString(myUri.Query).Get("lectureHall"));

                lecturehall lectureHall = new lecturehall();
                lectureHall.building = txtBuilding.Text;
                lectureHall.room_number = txtRoom.Text;
                lectureHall.space = int.Parse(txtSeats.Text);


                if (lectureHallId == -1)
                {

                    CIS.App_Code.LectureHall.saveLecture(lectureHall);
                    if (lectureHall.id > 0)
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
                    lectureHall.id = lectureHallId;

                    if (CIS.App_Code.LectureHall.updateLectureHall(lectureHall))
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
            txtBuilding.Text = string.Empty;
            txtRoom.Text = string.Empty;
            txtSeats.Text = "0";
        }
    }
}