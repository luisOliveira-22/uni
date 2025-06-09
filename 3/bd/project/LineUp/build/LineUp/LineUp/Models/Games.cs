using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Reflection.Metadata;

namespace LineUp.Models
{
    [Table("Games", Schema = "ConfManagement")]
    public class Games
    {
        [Key]
        public int Game_id { get; set; }

        [MaxLength(100)]
        public string Game_location { get; set; }

        //foreign keys
        public int  team1_id  { get; set; }

        [ForeignKey("team1_id")]
        public Club Team1 { get; set; }
        public int team2_id { get; set; }

        [ForeignKey("team2_id")]
        public Club Team2 { get; set; }

        public int Game_statics { get; set; }
        public GameStats GameStats{ get; set; }
        public ICollection<PlayerGameStats> PlayerGameStats { get; set; }
    }
}
