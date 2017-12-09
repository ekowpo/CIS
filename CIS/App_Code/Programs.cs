using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CIS.model;

namespace CIS.App_Code
{
    /// <summary>
    /// Crud operation for Department Prograns
    /// </summary>
    public class Programs
    {

        /// <summary>
        /// Create a program
        /// </summary>
        /// <param name="newProgram"></param>
        /// <returns></returns>
        public static CIS.model.program saveProgram(CIS.model.program newProgram)
        {
            using (var context = new csisEntities())
            {
                context.programs.Add(newProgram);
                context.SaveChanges();
            }
            return newProgram;
        }


        /// <summary>
        /// Get  a program 
        /// </summary>
        /// <param name="programId"> program id (pk)</param>
        /// <returns> A given program </returns>
        public static CIS.model.program getProgram(int programId)
        {
            CIS.model.program program = null;
            using (var context = new csisEntities())
            {
                program = context.programs.Include("department1").Where(p => p.id == programId).FirstOrDefault();
            }
            return program;
        }


        /// <summary>
        /// Update a given program
        /// </summary>
        /// <param name="programDetails"> program object </param>
        /// <returns>a status true for success and false for failure</returns>
        public static Boolean updateProgram(CIS.model.program programDetails)
        {
            try
            {
                using (var context = new csisEntities())
                {
                    CIS.model.program oldProgramDetails = context.programs.Where(p => p.id == programDetails.id).FirstOrDefault();
                    oldProgramDetails.Name = programDetails.Name;
                    oldProgramDetails.Department = programDetails.Department;
                    oldProgramDetails.requiredCredit = programDetails.requiredCredit;
                   
                    context.Entry(oldProgramDetails).State = System.Data.Entity.EntityState.Modified;
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