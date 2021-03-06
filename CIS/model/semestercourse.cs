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
    
    public partial class semestercourse
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public semestercourse()
        {
            this.courseregistrations = new HashSet<courseregistration>();
        }
    
        public int id { get; set; }
        public int course_id { get; set; }
        public int semester_id { get; set; }
        public string day { get; set; }
        public System.TimeSpan start_time { get; set; }
        public System.TimeSpan end_time { get; set; }
        public int lecture_hall { get; set; }
        public int lecturer { get; set; }
    
        public virtual course course { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<courseregistration> courseregistrations { get; set; }
        public virtual lecturehall lecturehall { get; set; }
        public virtual lecturer lecturer1 { get; set; }
        public virtual semester semester { get; set; }
    }
}
