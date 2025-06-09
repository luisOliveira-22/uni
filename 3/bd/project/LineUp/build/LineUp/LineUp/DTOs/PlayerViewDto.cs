using Microsoft.EntityFrameworkCore;

namespace LineUp.DTOs
{
   
    public class PlayerViewDto
    {
        public int PlayerId { get; set; }
        public string Person_name { get; set; }
        public DateTime BirthDate { get; set; }
        public int MarketValue { get; set; }
        public int Rating { get; set; }
    }
}
