using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace EmployeeManagement.Models
{
    [MetadataType(typeof(BatchMetadata))]
    public partial class Batch
    {
    }

    public class BatchMetadata
    {
        public int BatchId { get; set; }
        public string BatchName { get; set; }
    }
}