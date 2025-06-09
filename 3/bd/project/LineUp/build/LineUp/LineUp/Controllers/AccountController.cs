using Microsoft.AspNetCore.Mvc;
using LineUp.ViewModels;
using Microsoft.AspNetCore.Identity;
using LineUp.Models;
using LineUp.Data;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Authentication;

namespace LineUp.Controllers
{
    [AllowAnonymous]
    public class AccountController : Controller
    {
        
        private readonly SignInManager<AppUser> signInManager;
        private readonly UserManager<AppUser> userManager;
        private readonly IUserRepository userRepository;
        private readonly AppDbContext context;
        public AccountController(SignInManager<AppUser> signInManager, UserManager<AppUser> userManager, IUserRepository userRepository, AppDbContext dbContext)
        {
            this.signInManager = signInManager;
            this.userManager = userManager;
            this.userRepository = userRepository;
            this.context = dbContext;
        }
        [HttpGet]
        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]  
        public async Task<IActionResult> Login(LoginVM model)
        {
            if (ModelState.IsValid)
            {
                var user = await this.userRepository.GetUserByEmailAsync(model.Email);

                if(user != null)
                {
                    HttpContext.Session.SetInt32("user_club", user.ClubId);

                    var result = await signInManager.PasswordSignInAsync(user, model.Password!, isPersistent: false, lockoutOnFailure: false);

                    if (result.Succeeded)
                    {
                        return RedirectToAction("Index", "Features");
                    }
                  }
               
                ModelState.AddModelError("", "Invalid login attempt");
                return View(model);
            } 
            return View(model);
        }
        [HttpGet]
        public IActionResult Register()
        {
            return View();
        }
        //TODO still now need to setup the creating of the user on the database but first u need to update the
        // database to remove unwanted rolls
        [HttpPost]
        public async Task<IActionResult> Register(RegisterVM model)
        {
            if (ModelState.IsValid)
            {
                var club = new Club
                {

                    Name = model.Club_name,
                    FoundationDate = model.FoundationDate.GetValueOrDefault(DateTime.Now),
                    TransferBudget = model.TransferBudget,

                };
                //generate the new club entry in the table clubs to link to the user
                this.context.Club.Add(club);
                await context.SaveChangesAsync();  
                
                var user = new AppUser
                {
                    UserName = model.Username, // Your display name
                    Email = model.Email,
                    ClubId = club.Id
                };

                var result = await this.userManager.CreateAsync(user, model.Password); //set the password for the user created but hashed 

                if (result.Succeeded)
                {
                    return RedirectToAction("Login", "Account");
                }

                foreach (var error in result.Errors)
                {
                    ModelState.AddModelError("", error.Description);
                }
            }

            return View(model);

        }
        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync(); // Clears the authentication cookie
            HttpContext.Session.Clear(); // Optional: clears the session data
            return RedirectToAction("Index", "Home");
        }

    }
}
