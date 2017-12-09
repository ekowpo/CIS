using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CIS.model;
using System.Collections;

namespace CIS.App_Code
{
    public class fees
    {
       public static double getfeesbalance(int studentId)
        {
            using (var context = new csisEntities())
            {
                List<CIS.model.feespayment> feepaid =context.feespayments.Where(f => f.student_id == studentId).ToList();
                List<CIS.model.semesterfee> owned = context.semesterfees.Where(s => s.student_id == studentId).ToList();
                double feespaid = 0;
                double feesowed = 0;
                foreach(CIS.model.feespayment fe in feepaid)
                {
                    feespaid += fe.amount;
                }
                foreach (CIS.model.semesterfee sf in owned)
                {
                    feesowed += sf.amount;
                }

                return feesowed - feespaid;


            }
        }
    
    }
}