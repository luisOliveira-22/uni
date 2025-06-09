using System.ComponentModel.DataAnnotations;

namespace LineUp.ViewModels
{
    public class EditPlayerVM
    {
        [Required]
        public int PlayerId { get; set; }

        [Required(ErrorMessage = "Player name is required.")]
        [StringLength(100, MinimumLength = 2, ErrorMessage = "Name must be between 2 and 100 characters.")]
        public string Name { get; set; }

        [Required(ErrorMessage = "Position is required.")]
        [StringLength(50, ErrorMessage = "Position must be at most 50 characters.")]
        public string Position { get; set; }

        [Required(ErrorMessage = "Market value is required.")]
        [Range(0, int.MaxValue, ErrorMessage = "Market value must be a non-negative number.")]
        public int MarketValue { get; set; }

        [Required(ErrorMessage = "Rating is required.")]
        [Range(0, 100, ErrorMessage = "Rating must be between 0 and 100.")]
        public int Rating { get; set; }
    }
}