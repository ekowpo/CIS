using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CIS.model;

namespace CIS.App_Code
{
    /// <summary>
    /// Get Role
    /// </summary>
    public class Role
    {

        /// <summary>
        /// Get  a role 
        /// </summary>
        /// <param name="roleId"> role id (pk)</param>
        /// <returns> A given role </returns>
        public static CIS.model.role getRole(int roleId)
        {
            CIS.model.role role = null;
            using (var context = new csisEntities())
            {
                role = context.roles.Where(r => r.role_id== roleId).FirstOrDefault<CIS.model.role>();
            }
            return role;
        }
    }
}