using System.ComponentModel.DataAnnotations;

namespace LineUp.ViewModels
{
    public class AddPlayerVM
    {
        [Required]
        public string Name { get; set; }
        [Required]
        public DateTime BirthDate { get; set; }
        [Required]
        public string Position { get; set; }

        [Range(0, 100)]
        public int Rating { get; set; }

        [Range(0, int.MaxValue)]
        public int MarketValue { get; set; }

        public int? LastTransferValue { get; set; }
    }

}
