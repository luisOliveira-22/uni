using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace LineUp.Models
{
    [Table("Emplyee", Schema = "ConfManagement")]
    public class Employee
    {
        [Key]
        public int Emp_id { get; set; }

        [MaxLength(100)]
        public string Emp_function { get; set; }

        //FK to departament
        public int Dep_id { get; set; }

        [ForeignKey("Dep_id")]
        public Department Department { get; set; }

        // FK to Person
        public int Person_id { get; set; }

        [ForeignKey("Person_id")]
        public Person Person { get; set; }
    }
}
