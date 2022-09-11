using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace EmployeeManagement.Models
{
    [MetadataType(typeof(TeamMetadata))]
    public partial class Team
    {
    }

    public partial class TeamMetadata
    {
        public int TeamId { get; set; }
        public string TeamName { get; set; }
    }
}