using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace LineUp.Models
{
    [Table("Player", Schema = "ConfManagement")]
    public class Player
    {
        [Key]
        public int Player_id { get; set; }
        [MaxLength(100)]
        public string Position { get; set; }
        [Range(0, 100)]
        public int Rating { get; set; }
        public int MarketValue { get; set; }

        public bool IsDeleted { get; set; }

        public int? LastTransferValue { get; set; }

        //Foreign Keys
        public int Person_id { get; set; }

        [ForeignKey("Person_id")]
        public Person Person { get; set; }  

        public int Club_id { get; set; }

        [ForeignKey("Club_id")]
        public Club Club { get; set; }

        public ICollection<PlayerGameStats> PlayerGameStats { get; set; }

        public ICollection<Transference> Transferences { get; set; }
    }
}