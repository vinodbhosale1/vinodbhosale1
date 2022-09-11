using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace EmployeeManagement.Models
{
    [MetadataType(typeof(EmployeeExperieceMetadata))]
    public partial class EmployeeExperiece
    {
    }

    public class EmployeeExperieceMetadata
    {
        public int ExperienceId { get; set; }
        public string UserId { get; set; }
        public string CompanyName { get; set; }
        public Nullable<System.DateTime> JoiningDate { get; set; }
        public Nullable<decimal> CurrentCTC { get; set; }
        public Nullable<System.DateTime> RelivingDate { get; set; }
        public Nullable<bool> IsPFOpted { get; set; }
        public Nullable<bool> IsAllDocumentsAvailable { get; set; }
        public Nullable<int> AccountId { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public Nullable<System.DateTime> ModifiedDate { get; set; }
        public Nullable<System.DateTime> DeletedDate { get; set; }

        public virtual AspNetUser AspNetUser { get; set; }
        public virtual EmployeeBankAccount EmployeeBankAccount { get; set; }
    }
}