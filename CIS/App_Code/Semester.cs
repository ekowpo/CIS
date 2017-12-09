using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CIS.model;

namespace CIS.App_Code
{
    /// <summary>
    /// CRUD operation for Semester
    /// </summary>
    public class Semester
    {
        /// <summary>
        /// Create a new semester
        /// </summary>
        /// <param name="newSemesterDetails">New Semester Object</param>
        /// <returns> a semester</returns>
        public static CIS.model.semester saveSemester(CIS.model.semester newSemesterDetails)
        {

            using (var context = new csisEntities())
            {
                context.semesters.Add(newSemesterDetails);
                context.SaveChanges();
            }
            return newSemesterDetails;
        }

        /// <summary>
        /// Get  a semester 
        /// </summary>
        /// <param name="semesterId"> semester id (pk)</param>
        /// <returns> A given semester </returns>
        public static CIS.model.semester getSemester(int semesterId)
        {
            CIS.model.semester semester = null;
            using (var context = new csisEntities())
            {
                semester = context.semesters.Where(s => s.semester_id == semesterId).FirstOrDefault<CIS.model.semester>();
            }
            return semester;
        }

        /// <summary>
        /// Update a given Semester
        /// </summary>
        /// <param name="semesterDetails"> Semester object </param>
        /// <returns>a status true for success and false for failure</returns>
        public static Boolean updateSemester(CIS.model.semester semesterDetails)
        {
            try
            {
                using (var context = new csisEntities())
                {
                    CIS.model.semester oldSemesterDetails = context.semesters.Where(s => s.semester_id == semesterDetails.semester_id).FirstOrDefault<CIS.model.semester>();
                    oldSemesterDetails.endDate = semesterDetails.endDate;
                    oldSemesterDetails.startDate = semesterDetails.startDate;
                    oldSemesterDetails.DNE = semesterDetails.DNE;
                    oldSemesterDetails.name = semesterDetails.name;
                    context.Entry(oldSemesterDetails).State = System.Data.Entity.EntityState.Modified;
                    context.SaveChanges();
                    return true;
                }
            }
            catch(Exception e)
            {
                return false;
            }
            


            
        }

    }
}