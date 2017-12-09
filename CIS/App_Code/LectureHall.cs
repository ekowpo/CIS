using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CIS.model;


namespace CIS.App_Code
{
    /// <summary>
    /// CRUD operation for Lecture hall
    /// </summary>
    public class LectureHall
    {

        /// <summary>
        /// Create a lecture hall
        /// </summary>
        /// <param name="newLectureHall"></param>
        /// <returns></returns>
        public static CIS.model.lecturehall saveLecture(CIS.model.lecturehall newLectureHall)
        {
            using (var context = new csisEntities())
            {
                context.lecturehalls.Add(newLectureHall);
                context.SaveChanges();
            }
            return newLectureHall;
        }


        /// <summary>
        /// Get  a lecture hall 
        /// </summary>
        /// <param name="lecturehallId"> lecturehall id (pk)</param>
        /// <returns> A given lecturehall </returns>
        public static CIS.model.lecturehall getLectureHall(int lecturehallId)
        {
            CIS.model.lecturehall lecturehall = null;
            using (var context = new csisEntities())
            {
                lecturehall = context.lecturehalls.Where(l => l.id == lecturehallId).FirstOrDefault<CIS.model.lecturehall>();
            }
            return lecturehall;
        }


        /// <summary>
        /// Update a given lecture hall
        /// </summary>
        /// <param name="lecturehallDetails"> lecturehall object </param>
        /// <returns>a status true for success and false for failure</returns>
        public static Boolean updateLectureHall(CIS.model.lecturehall lecturehallDetails)
        {
            try
            {
                using (var context = new csisEntities())
                {
                    CIS.model.lecturehall oldLectureHallDetails = context.lecturehalls.Where(l => l.id == lecturehallDetails.id).FirstOrDefault<CIS.model.lecturehall>();
                    oldLectureHallDetails.building = lecturehallDetails.building;
                    oldLectureHallDetails.room_number = lecturehallDetails.room_number;
                    context.Entry(oldLectureHallDetails).State = System.Data.Entity.EntityState.Modified;
                    context.SaveChanges();
                    return true;
                }
            }
            catch (Exception e)
            {
                return false;
            }




        }
    }
}