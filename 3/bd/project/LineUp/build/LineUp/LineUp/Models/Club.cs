using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Runtime.CompilerServices;

namespace LineUp.Models
{
    [Table("Club", Schema = "ConfManagement")]
    public class Club
    {
        [Key]
        [Column("Club_id")]
        public int Id { get; set; }

        [Column("Club_name")]
        [MaxLength(255)]
        public string Name { get; set; }

        public int TransferBudget { get; set; }
        public DateTime FoundationDate { get; set; }
        
        //Navigation Property:

        //one club to one user
        public AppUser User { get; set; }
        //one Club, many Persons
        public ICollection<Department> Departments { get; set; }

        public ICollection<Player> Players { get; set; }

        public ICollection<Games> HomeGames { get; set; }

        public ICollection<Games> AwayGames { get; set; }

        public ICollection<Transference> DestClub { get; set; }

        public ICollection<Transference> PrevClub { get; set; }
    }
}
