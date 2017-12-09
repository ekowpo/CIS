using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CIS.model;


namespace CIS.App_Code
{
    /// <summary>
    /// CRUD operation for semester semesterCourse
    /// </summary>
    public class SemesterCourse
    {

        /// <summary>
        /// Create a semester Course
        /// </summary>
        /// <param name="newSemesterCourse"></param>
        /// <returns></returns>
        public static string saveSemesterCourse(CIS.model.semestercourse newSemesterCourse)
        {
            using (var context = new csisEntities())
            {
                CIS.model.semestercourse courseExist = context.semestercourses.Where(sc => (sc.semester_id == newSemesterCourse.semester_id && sc.lecturer == newSemesterCourse.lecturer && sc.course_id == newSemesterCourse.course_id)).FirstOrDefault<CIS.model.semestercourse>();
                CIS.model.semestercourse courseLectureHallAvalibility = context.semestercourses.Where(sc => ((sc.semester_id == newSemesterCourse.semester_id) && sc.lecture_hall == newSemesterCourse.lecture_hall && sc.start_time >= newSemesterCourse.start_time && sc.end_time <= newSemesterCourse.end_time && sc.day.Equals(newSemesterCourse.day))).FirstOrDefault<CIS.model.semestercourse>();
                CIS.model.semestercourse lectuerAsignedToTime = context.semestercourses.Where(sc => (sc.lecture_hall == newSemesterCourse.lecture_hall && sc.start_time >= newSemesterCourse.start_time && sc.end_time <= newSemesterCourse.end_time && sc.day.Equals(newSemesterCourse.day) && sc.lecturer == newSemesterCourse.lecturer) && (sc.semester_id == newSemesterCourse.semester_id)).FirstOrDefault<CIS.model.semestercourse>();

                if (courseExist != null)
                {
                    return "Course has already been add";
                }
                else if (courseLectureHallAvalibility != null)
                {
                    return "Lecture hall already asigned";
                }
                else if (lectuerAsignedToTime != null)
                {
                    return "Lecturer already asigned to a course at this time";
                }
                else
                {
                    context.semestercourses.Add(newSemesterCourse);
                    context.SaveChanges();
                    return "successful";
                }
            }
            
        }

        public static int getCurrentClassSize(int SemesterCourseId)
        {
            using (var context = new csisEntities())
            {
               return  context.semestercourses.Where(sc => sc.id == SemesterCourseId).ToList<CIS.model.semestercourse>().Count();
            }

       }

        /// <summary>
        /// Get  a semesterCourse 
        /// </summary>
        /// <param name="semesterCourseId"> semesterCourse id (pk)</param>
        /// <returns> A given semesterCourse </returns>
        public static CIS.model.semestercourse getSemesterCourse(int semesterCourseId)
        {
            CIS.model.semestercourse semesterCourse = null;
            using (var context = new csisEntities())
            {

                semesterCourse = context.semestercourses.Where(sc => sc.id == semesterCourseId).FirstOrDefault<CIS.model.semestercourse>();
                context.Entry(semesterCourse).Reference(sc => sc.lecturer1).Load();
                context.Entry(semesterCourse).Reference(sc => sc.lecturehall).Load();
                context.Entry(semesterCourse).Reference(sc => sc.semester).Load();
                context.Entry(semesterCourse).Reference(sc => sc.course).Load();
            }
            return semesterCourse;
        }


        /// <summary>
        /// Update a given semesterCourse
        /// </summary>
        /// <param name="semesterCourseDetails"> semesterCourse object </param>
        /// <returns>a status true for success and false for failure</returns>
        public static string updateSemesterCourse(CIS.model.semestercourse semesterCourseDetails)
        {
            try
            {
                using (var context = new csisEntities())
                {
                    CIS.model.semestercourse oldSemesterCourseDetails = context.semestercourses.Where(sc => sc.id == semesterCourseDetails.id).FirstOrDefault<CIS.model.semestercourse>();
                    CIS.model.semestercourse courseLectureHallAvalibility = context.semestercourses.Where(sc => (sc.lecture_hall == semesterCourseDetails.lecture_hall && sc.start_time >= semesterCourseDetails.start_time && sc.end_time <= semesterCourseDetails.end_time && sc.day.Equals(semesterCourseDetails.day))).FirstOrDefault<CIS.model.semestercourse>();
                    CIS.model.semestercourse lectuerAsignedToTime = context.semestercourses.Where(sc => (sc.lecture_hall == semesterCourseDetails.lecture_hall && sc.start_time >= semesterCourseDetails.start_time && sc.end_time <= semesterCourseDetails.end_time && sc.day.Equals(semesterCourseDetails.day) && sc.lecturer == semesterCourseDetails.lecturer)).FirstOrDefault<CIS.model.semestercourse>();
              
                    if (courseLectureHallAvalibility != null && oldSemesterCourseDetails.lecture_hall != semesterCourseDetails.lecture_hall)
                    {
                        return "Lecture hall already asigned";
                    }
                    else if (lectuerAsignedToTime != null && oldSemesterCourseDetails.lecturer != semesterCourseDetails.lecturer)
                    {
                        return "Lecturer already asigned to a course at this time";
                    }
                    else
                    {
                        oldSemesterCourseDetails.lecturer = semesterCourseDetails.lecturer;
                        oldSemesterCourseDetails.semester_id = semesterCourseDetails.semester_id;
                        oldSemesterCourseDetails.start_time = semesterCourseDetails.start_time;
                        oldSemesterCourseDetails.end_time = semesterCourseDetails.end_time;
                        oldSemesterCourseDetails.lecture_hall = semesterCourseDetails.lecture_hall;
                        oldSemesterCourseDetails.course_id = semesterCourseDetails.course_id;
                        oldSemesterCourseDetails.day = semesterCourseDetails.day;
                        context.Entry(oldSemesterCourseDetails).State = System.Data.Entity.EntityState.Modified;
                        context.SaveChanges();
                        return "success";
                    }


                }
            }
            catch (Exception e)
            {
                return "Not successfull";
            }


        }

        }
    
}
