using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CIS.model;

namespace CIS.App_Code
{
    /// <summary>
    /// CRUD operation  for student user
    /// </summary>
    public class StudentUser
    {
        /// <summary>
        /// Update student user
        /// </summary>
        /// <param name="studentDetails">Student Object </param>
        /// <returns>Student</returns>
        public static student updateStuedentDetails(student studentDetails )
        {
            using(var context = new csisEntities())
            {
                context.Entry(studentDetails).State = System.Data.Entity.EntityState.Modified;
                context.SaveChanges();
                return studentDetails;
            }
        }
    }
}