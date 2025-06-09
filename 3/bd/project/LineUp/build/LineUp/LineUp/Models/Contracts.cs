using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace LineUp.Models
{
    [Table("Contracts", Schema = "ConfManagement")]
    public class Contracts
    {
        [Key]
        public int Cont_id { get; set; }

        public int Salary { get; set; }

        public DateOnly StartDate { get; set; }

        public DateOnly EndDate { get; set; }  

        public int Person_id { get; set; }

        [ForeignKey("Person_id")]
        public Person Person { get; set; }

    }
}
