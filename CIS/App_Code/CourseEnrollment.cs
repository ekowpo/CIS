using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CIS.model;
using System.Collections;

namespace CIS.App_Code
{
    public class CourseEnrollment
    {

        public static string dropRegisteredCourse(int semesterCourse_id, int student_id)
        {
            using (var context = new csisEntities())
            {

                
                courseregistration coursereg = context.courseregistrations.Where(c=> c.semesterCourse_id ==semesterCourse_id && c.student_id==student_id ).FirstOrDefault();
                context.courseregistrations.Attach(coursereg);
                CIS.model.semester semester = CIS.App_Code.Semester.getSemester(coursereg.semestercourse.semester_id);
                if (semester.DNE >= DateTime.Now)
                {
                    context.Entry(coursereg).State = System.Data.Entity.EntityState.Deleted;

                    context.SaveChanges();
                    return "success";
                }
                else
                {
                    return "Passed DNE, can not drop the course.  Please see your course advisor";   
                }

               
            }
        }

        public static string addRegistered(courseregistration newcourseregistration)
        {
            using (var context = new csisEntities())
            {
               var sc= context.semestercourses.Where(c => c.id == newcourseregistration.semesterCourse_id).FirstOrDefault();
                CIS.model.courseregistration semCourse = context.courseregistrations.Where(c => ((c.semestercourse.start_time >= sc.start_time) && (c.semestercourse.end_time <= sc.end_time) && (c.semestercourse.day.Equals(sc.day) && (c.student_id == newcourseregistration.student_id)))).FirstOrDefault<CIS.model.courseregistration>();
                if (semCourse == null)
                {
                    context.courseregistrations.Add(newcourseregistration);
                    context.SaveChanges();
                    return "success";
                }
                else
                {
                    return "Course schedule conflict";
                }
            }
        }

        public static ArrayList getALLsemesterRegistedCourse(int semesterId, int studentId)
        {
            using(var context = new csisEntities())
            {
                ArrayList ids = new ArrayList();
               List<CIS.model.courseregistration> coursereg= context.courseregistrations.Where<CIS.model.courseregistration>(cr => cr.student_id == studentId && cr.semestercourse.semester_id == semesterId).ToList();
                foreach(courseregistration cr in coursereg)
                {
                    ids.Add(cr.semesterCourse_id);
                   
                }
                return ids;
            }
        }
    }
}