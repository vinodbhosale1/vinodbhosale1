using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace EmployeeManagement.Models
{
    [MetadataType(typeof(EmployeeIncrementMetadata))]
    public partial class EmployeeIncrement
    {
    }

    public class EmployeeIncrementMetadata
    {
        public int Id { get; set; }
        public string UserId { get; set; }
        public string HikeMonthYear { get; set; }
        public Nullable<int> HikeInPercentage { get; set; }
        public Nullable<decimal> HikeAmount { get; set; }
        public Nullable<decimal> SalaryAfterHike { get; set; }

        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}")]
        public Nullable<System.DateTime> SalaryEffectiveFrom { get; set; }

        public Nullable<System.DateTime> ModifiedDate { get; set; }

        public virtual AspNetUser AspNetUser { get; set; }
    }
}