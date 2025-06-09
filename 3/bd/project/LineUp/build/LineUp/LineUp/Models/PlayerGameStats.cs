using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace LineUp.Models
{
    [Table("PlayerGameStats", Schema = "ConfManagement")]
    public class PlayerGameStats
    {
        [Key]
        public int Stat_id { get; set; }

        [Range(0,36)]
        public int Goals { get; set; }
        [Range(0, 36)]
        public int Assists { get; set; }
        public TimeSpan EnterAt { get; set; }
        public TimeSpan LeaveAt { get; set; }
        [Range(0,1)]
        public int YellowCards { get; set; } 
        [Range(0,1)]
        public int RedCards { get; set; }

        public int Game_id { get; set; }
        
        [ForeignKey("Game_id")]
        public Games Game { get; set; }

        public int Player_id { get; set; }

        [ForeignKey("Player_id")]
        public Player Player { get; set; }
    }
}
