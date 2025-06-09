using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace LineUp.Models
{
    [Table("Department", Schema = "ConfManagement")]
    public class Department
    {
        [Key]
        public int Dep_id { get; set; }
        
        [MaxLength(100)]
        public string DepName { get; set; }

        public int Club_id { get; set; }

        [ForeignKey("Club_id")]
        public Club Club { get; set; }

        public ICollection<Employee> Employees { get; set; }
    }

}
