using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace LineUp.Models
{
    [Table("GameStats", Schema = "ConfManagement")]
    public class GameStats
    {
        [Key, ForeignKey("Game")]
        public int Game_id { get; set; }
        
        [Range(0,36)]
        public int Goal_team1 { get; set; }
        [Range(0, 36)]
        public int Goal_team2 { get; set; }

        public Games Game { get; set; }
    }
}
