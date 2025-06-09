
using LineUp.Models;
using LineUp.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using Microsoft.CodeAnalysis.Scripting.Hosting;
using Microsoft.EntityFrameworkCore;
using NuGet.Packaging;

namespace LineUp.Controllers
{
    [Authorize]
    public class FeaturesController : BaseController
    {

        private readonly IUserRepository _userRepository;

        public FeaturesController(IUserRepository userRepository)
        {
            this._userRepository = userRepository;
        }
        [HttpGet]
        public async Task<IActionResult> Index() { 
            var club = HttpContext.Session.GetInt32("user_club");
            if (club == null) return Content("Club ID not found in session");

            var features = await _userRepository.GetFeaturesInfo(club);

            ViewBag.TransferBudget = features.TB;
            ViewBag.UserName = features.UserName;
            ViewBag.ShowLogout = true;
            return View();
        }
        [HttpGet]
        public async Task<IActionResult> BuyPlayer(int page, string? position=null, string filterType="MarketValue", string filterOption="Ascending")
        {
            int pageSize = 7;
            var clubId = HttpContext.Session.GetInt32("user_club");
            if (clubId == null)
            {
                return Content("Club ID not found in session");
            }

            int offset = page * pageSize;
            var players = await _userRepository.GetPlayersToBuy(clubId, offset, pageSize, position, filterType, filterOption);
            var totalPlayers = await _userRepository.GetTotalAvaliablePlayers(clubId, position);

            ViewBag.CurrentPage = page;
            ViewBag.TotalPages = (int)Math.Ceiling(totalPlayers.TotalCount / (double)pageSize);

            var features = await _userRepository.GetFeaturesInfo(clubId);
            ViewBag.TransferBudget = features.TB;

            return PartialView("_BuyPlayerModal", players);
        }
        [HttpGet]
        public async Task<IActionResult> ChangePlayer(string position)
        {
            var clubId = HttpContext.Session.GetInt32("user_club");
            if (clubId == null)
            {
                return Content("Club ID not found in session");
            }
            var players = await _userRepository.ChangePlayers(clubId, position);
            return Json(players);
        }


        [HttpPost]
        public async Task<IActionResult> TransferPlayer([FromBody] Dictionary<int, int> playerId) {
            var clubId = HttpContext.Session.GetInt32("user_club");
            if (clubId == null)
            {
                return Content("Club ID not found in session");
            }
            foreach (int key in playerId.Keys) {
                await _userRepository.TransferPlayer(clubId, key, playerId[key]);
            }

            return Ok();
        }

        [HttpGet]
        public async Task<IActionResult> ListPlayers(int page, string? searchTerm=null)
        {

            int pageSize = 7;
            var clubId = HttpContext.Session.GetInt32("user_club");
            if (clubId == null)
            {
                return Content("Club ID not found in session");
            }
            int offset = page * pageSize;
            var players = await _userRepository.GetListPlayers(clubId, offset, pageSize, searchTerm);
            var totalPlayers = await _userRepository.GetTotalPlayers(clubId);

            ViewBag.CurrentPage = page;
            ViewBag.TotalPages = (int)Math.Ceiling(totalPlayers.TotalCount / (double)pageSize);

            var features = await _userRepository.GetFeaturesInfo(clubId);
            return PartialView("_ListPlayers",players);
        }

        [HttpGet]
        public async Task<IActionResult> ListTransferences(int page) 
        {
            int pageSize = 7;
            var clubId = HttpContext.Session.GetInt32("user_club");
            if (clubId == null)
            {
                return Content("Club ID not found in session");
            }

            int offset = page * pageSize;
            var transferences = await _userRepository.GetTransferences(clubId, offset, pageSize);
            var totalTransferences = await _userRepository.GetTotalTransferences(clubId);
           
            ViewBag.CurrentPage = page;
            ViewBag.TotalPages = (int)Math.Ceiling(totalTransferences.TotalCount / (double)pageSize);
        
            return PartialView("_ListTransference", transferences);
        }


        public async Task<IActionResult> ListEmployees(int page)
        {
            int pageSize = 7;
            var clubId = HttpContext.Session.GetInt32("user_club");
            if (clubId == null)
            {
                return Content("Club ID not found in session");
            }

            int offset = page * pageSize;
            var employees = await _userRepository.GetEmployees(clubId, offset, pageSize);
            var totalEmployees = await _userRepository.GetTotalEmployees(clubId);

            ViewBag.CurrentPage = page;
            ViewBag.TotalPages = (int)Math.Ceiling(totalEmployees.TotalCount / (double)pageSize);
            

            return PartialView("_ListEmployees", employees);
        }

        [HttpGet]
        public IActionResult AddPlayer()
        {
            var vm = new AddPlayerVM(); 
            return PartialView("_AddPlayer", vm); 
        }

        [HttpDelete]
        public async Task<IActionResult> DeletePlayer(int playerId)
        {
            await _userRepository.DeletePlayer(playerId);

            return Ok();

        } 
        [HttpPost]
        public async Task<IActionResult> AddPlayer(AddPlayerVM vm)
        {
            if (!ModelState.IsValid)
                return PartialView("_AddPlayerPartial", vm);

            var clubId = HttpContext.Session.GetInt32("user_club");
            if (clubId == null)
            {
                return Content("Club ID not found in session");
            }

            await _userRepository.AddPlayer(clubId, vm.Name, vm.BirthDate, vm.Position, vm.Rating, vm.MarketValue);

           return Ok();
        }

        [HttpGet]
        public IActionResult EditPlayer(int playerId) {
            var vm = new EditPlayerVM();
            vm.PlayerId = playerId;
            return PartialView("_EditPlayer", vm);
        }

        [HttpPut]
        public async Task<IActionResult> EditPlayer(EditPlayerVM vm) {

            if (!ModelState.IsValid)
                return PartialView("_EditPlayer", vm);

            Console.WriteLine("\n" + vm.PlayerId);
            Console.WriteLine("\n" + vm.Position);
            Console.WriteLine("\n" + vm.Rating);
            Console.WriteLine("\n" + vm.MarketValue);

            await _userRepository.EditPlayer(vm.PlayerId, vm.Name, vm.Position, vm.Rating, vm.MarketValue);

            return Ok();
        }
    }
}
