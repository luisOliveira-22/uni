using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace LineUp.Models
{
    public class AppUser : IdentityUser
    {
        
        [MaxLength(100)]
        [Required]
        public override string? UserName { get; set; }
        [Required]
        public override string? Email { get; set; }
        [Required]
        public override string? PasswordHash { get; set; }
        [Required]
        public int ClubId { get; set; }

        [ForeignKey("ClubId")]
        public Club Club { get; set; }
        
    }
}
