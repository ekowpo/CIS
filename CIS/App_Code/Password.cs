using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security;
using System.Text;
using concordia_sis;
using CIS.model;


namespace CIS.App_Code
{
    /// <summary>
    /// This class contains password hashing, change password
    /// </summary>
    public class Password
    {

        /// <summary>
        ///     Change Password
        /// </summary>
        /// <param name="oldpassword">New password</param>
        /// <param name="newpassword">Old password</param>
        /// <param name="userId">User Id</param>
        /// <returns> status</returns>
        public static bool changePassword(string userId,string oldpassword, string newpassword)
        {
          System.Console.WriteLine(md5PassordHashing(oldpassword));
            using (var context = new csisEntities())
            {
                CIS.model.user userdetail =context.users.Find(userId);
                if (userdetail != null)
                {
                    if (userdetail.login.password.Equals(md5PassordHashing(oldpassword)))
                    {
                        userdetail.login.password = (md5PassordHashing(newpassword));
                        context.Entry(userdetail).State = System.Data.Entity.EntityState.Modified;
                        context.SaveChanges();
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
                else
                    return false;
            }
        }

        ///<summary> MD5 hasing of password</summary>
        /// <param name="rawPassword"> plain password </param>
        /// <returns>MD5 hashed String</returns>
        public static string md5PassordHashing(string rawPassword)
        {
            System.Security.Cryptography.MD5CryptoServiceProvider x = new System.Security.Cryptography.MD5CryptoServiceProvider();
            byte[] bs = Encoding.UTF8.GetBytes(rawPassword);
            bs = x.ComputeHash(bs);
            StringBuilder s = new StringBuilder();
            foreach(byte b in bs)
            {
                s.Append(b.ToString("x2").ToLower());

            }
            return s.ToString();

        }

  
    }
}