using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace LineUp.Models
{
    [Table("Transference", Schema = "ConfManagement")]
    public class Transference
    {
        [Key]
        [Column("Transf_id")]
        public int Trans_Id { get; set; }
        public int Trans_value { get; set; }
        public int Trans_player { get; set; }
        public int Previus_club { get; set; }
        public int Destination_club { get; set; }

        [ForeignKey("Trans_player")]
        public Player Player{ get; set; }

        [ForeignKey("Destination_Club")]
        public Club Dest_Club { get; set; }

        [ForeignKey("Previus_club")]
        public Club Prev_Club { get; set; }
    }
}
