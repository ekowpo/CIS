//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CIS.model
{
    using System;
    using System.Collections.Generic;
    
    public partial class login
    {
        public string user_id { get; set; }
        public int role_id { get; set; }
        public string State { get; set; }
        public string password { get; set; }
    
        public virtual role role { get; set; }
        public virtual user user { get; set; }
    }
}