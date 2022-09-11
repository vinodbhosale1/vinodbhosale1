using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace EmployeeManagement.Models
{
    [MetadataType(typeof(EmployeeEducationMetadata))]
    public partial class EmployeeEducation
    {
    }

    public class EmployeeEducationMetadata
    {
        public int EducationId { get; set; }
        public string UserId { get; set; }
        public Nullable<int> EducationTypeId { get; set; }
        public string CollegeName { get; set; }
        public Nullable<decimal> Percentage { get; set; }
        public Nullable<int> PassoutYear { get; set; }
        public string Specialization { get; set; }

        public virtual AspNetUser AspNetUser { get; set; }
        public virtual EmployeeEducationType EmployeeEducationType { get; set; }
    }
}