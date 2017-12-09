using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CIS.model;
using System.Data.Entity.Validation;

namespace CIS.App_Code
{
    /// <summary>
    /// CRUD Operation User
    /// </summary>
    public class User
    {
        
        /// <summary>
        /// Create a user
        /// </summary>
        /// <param name="newUserDetails">New User</param>
        /// <returns>User</returns>
      public static CIS.model.user saveUser(CIS.model.user newUserDetails)
        {

            using(var context = new csisEntities())
            {
                context.users.Add(newUserDetails);
                try { context.SaveChanges(); }
                catch (DbEntityValidationException e)
                {
                    foreach (var eve in e.EntityValidationErrors)
                    {
                        Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                            eve.Entry.Entity.GetType().Name, eve.Entry.State);
                        foreach (var ve in eve.ValidationErrors)
                        {
                            Console.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
                                ve.PropertyName, ve.ErrorMessage);
                        }
                    }
                    throw;
                }
                
            }
            return newUserDetails;
        }

        /// <summary>
        /// Get a user using the user id
        /// </summary>
        /// <param name="userId"> </param>
        /// <returns>User</returns>
        public static CIS.model.user getUser(string userId)
        {
            CIS.model.user userd = null;
                using (var context = new csisEntities())
                {
                    userd =context.users.Include("login").Where(s => s.user_id == userId).FirstOrDefault<CIS.model.user>();

                

            if (userd.login.role_id == 2)
                {
                    context.Entry(userd).Collection(u => u.students).Load();
                    context.Entry(userd.students.First<CIS.model.student>()).Reference(u => u.program1).Load();

                }
                else if(userd.login.role_id == 3)
                {
                    context.Entry(userd).Collection(u => u.lecturers).Load();
                }
                else if (userd.login.role_id == 4)
                {
                    context.Entry(userd).Collection(u => u.courseadvisors).Load();
                }


            }
                return userd;
        }

        /// <summary>
        /// Update user details
        /// </summary>
        /// <param name="userDetails"></param>
        /// <returns>User</returns>
        public static CIS.model.user updateUserByUser(CIS.model.user userDetails)
        {
            CIS.model.user oldUserDetails = getUser(userDetails.user_id);
            oldUserDetails.phone = userDetails.phone;
            oldUserDetails.Address = userDetails.Address;
            oldUserDetails.email = userDetails.email;
            using (var context = new csisEntities())
            {
                context.users.Add(oldUserDetails);
                context.SaveChanges();
            }

            return oldUserDetails;
        }

        /// <summary>
        /// Admin update user
        /// </summary>
        /// <param name="userDetails">User Object</param>
        /// <returns>User</returns>
        public static bool updateUserByAdmin(CIS.model.user userDetails)
        {
    
            using (var context = new csisEntities())
            {
                context.Entry(userDetails).State = System.Data.Entity.EntityState.Modified;
                context.SaveChanges();
            }

            return true;

        }

        /// <summary>
        /// Create user by admin
        /// </summary>
        /// <param name="userDetails">A new user</param>
        /// <returns>User</returns>
        public static CIS.model.user createUserByAdmin(CIS.model.user userDetails)
        {

            using (var context = new csisEntities())
            {
                context.users.Add(userDetails);
                context.SaveChanges();
            }

            return userDetails;


        }




    }
}