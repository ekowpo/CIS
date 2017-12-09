using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CIS.model;
namespace CIS.App_Code
{
    /// <summary>
    /// CRUD operation for course
    /// </summary>
    public class Course
    {
        
        /// <summary>
        /// Create a course
        /// </summary>
        /// <param name="newCourse"></param>
        /// <returns></returns>
        public static CIS.model.course saveCourse(CIS.model.course newCourse)
        {
            using (var context = new csisEntities())
            {
                context.courses.Add(newCourse);
                context.SaveChanges();
            }
            return newCourse;
        }


        /// <summary>
        /// Get  a course 
        /// </summary>
        /// <param name="courseId"> course id (pk)</param>
        /// <returns> A given course </returns>
        public static CIS.model.course getCourse(int courseId)
        {
            CIS.model.course course = null;
            using (var context = new csisEntities())
            {
                course = context.courses.Include("department1").Where(c =>c.course_id  == courseId).FirstOrDefault();
              
            }
            return course;
        }


        /// <summary>
        /// Update a given course
        /// </summary>
        /// <param name="courseDetails"> course object </param>
        /// <returns>a status true for success and false for failure</returns>
        public static Boolean updateCourse(CIS.model.course courseDetails)
        {
            try
            {
                using (var context = new csisEntities())
                {
                    CIS.model.course oldCourseDetails = context.courses.Where(c => c.course_id == courseDetails.course_id).FirstOrDefault();
                    oldCourseDetails.code = courseDetails.code;
                    oldCourseDetails.description = courseDetails.description;
                    oldCourseDetails.credit = courseDetails.credit;
                    oldCourseDetails.department = courseDetails.department;
                    context.Entry(oldCourseDetails).State = System.Data.Entity.EntityState.Modified;
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