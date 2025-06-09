using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace LineUp.Models
{
    [Table("Person", Schema = "ConfManagement")]
    public class Person
    {
        [Key]
        public int Person_id { get; set; }  
        [MaxLength(100)]
        public string Person_name { get; set; }
        public DateTime BirthDate { get; set; }

        //1:1 relations 
        public Player Player { get; set; }
        public Employee Employee { get; set; }
        public Contracts Contract { get; set; }
    }
}
