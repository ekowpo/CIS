using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CIS.model;

namespace CIS.App_Code
{

    /// <summary>
    /// Contains all the CRUD operations for Department
    /// </summary>
    public class Department
    {
        /// <summary>
        /// create a deparment
        /// </summary>
        /// <param name="newDepartmentDetails"> new depaartment object</param>
        /// <returns>Department</returns>
        public static CIS.model.department saveDept(CIS.model.department newDepartmentDetails)
        {

            using (var context = new csisEntities())
            {
                context.departments.Add(newDepartmentDetails);
                context.SaveChanges();
            }
            return newDepartmentDetails;
        }

        /// <summary>
        /// Get a department using the department id
        /// </summary>
        /// <param name="departmentId"> Department id(pk)</param>
        /// <returns> a given department</returns>
        public static CIS.model.department getDept(int departmentId)
        {
            CIS.model.department dept = null;
            using (var context = new csisEntities())
            {
                dept = context.departments.Where(s => s.departmentId == departmentId).FirstOrDefault<CIS.model.department>();
            }
            return dept;
        }

        /// <summary>
        /// Update a given department
        /// </summary>
        /// <param name="departmentDetails">Department object</param>
        /// <returns> a status true for success and false for failure</returns>
        public static Boolean updateDept(CIS.model.department departmentDetails)
        {
            try
            {
                using (var context = new csisEntities())
                {
                    CIS.model.department oldDeptDetails = context.departments.Where(s => s.departmentId == departmentDetails.departmentId).FirstOrDefault<CIS.model.department>();
                    oldDeptDetails.name = departmentDetails.name;
                    oldDeptDetails.code = departmentDetails.code;


                    context.Entry(oldDeptDetails).State = System.Data.Entity.EntityState.Modified;
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