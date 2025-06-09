using LineUp.Models;
using Microsoft.AspNetCore.Routing.Constraints;
using System.ComponentModel.DataAnnotations;
using System.Net.Http.Headers;


namespace LineUp.ViewModels
{
    public class RegisterVM
    {
        [Required(ErrorMessage ="Username must be provided")]
        [MinLength(3,ErrorMessage ="Username must have at least 3 characters")]
        public string Username { get; set; }

        [Required(ErrorMessage ="Email address must be provided")]
        [DataType(DataType.EmailAddress)]
        public string Email { get; set; }

        [Required(ErrorMessage = "Password is required")]
        [RegularExpression(@"^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$",
            ErrorMessage = "Password must be at least 8 characters, and include an uppercase letter, number, and special character.")]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [Required(ErrorMessage = "The club name must be provided")]
        [MinLength(3, ErrorMessage = "The club name must be at least 3 characters long")]
        public string Club_name { get; set; }

        [DataType(DataType.DateTime)]
        public DateTime? FoundationDate { get; set; }
        
        [Required(ErrorMessage = "Initial budget for the club must be provided")]
        public int TransferBudget { get; set; }
    
    }

}
