using LineUp.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Conventions;
using Microsoft.Extensions.Localization;
using Microsoft.IdentityModel.Tokens;
using System.Text.Json;

namespace LineUp.Data
{
    public class DbSeeder
    {
        
        public static async Task SeedUserAsync(IServiceProvider serviceProvider) 
        {
            var userManager = serviceProvider.GetRequiredService<UserManager<AppUser>>();
            var dbContext = serviceProvider.GetRequiredService<AppDbContext>();

            //Create the clubs in case the database is empty 
            if (!dbContext.Club.Any())
            {
                var clubs = new List<Club>()
                {
                    new Club
                    {
                        Name = "Real Madrid",
                        TransferBudget = 10000,
                        FoundationDate = DateTime.Now,
                    },
                    new Club
                    {
                        Name = "Barcelona",
                        TransferBudget = 20000,
                        FoundationDate = DateTime.Now,
                    },
                    new Club
                    {
                        Name = "Roma",
                        TransferBudget = 30000,
                        FoundationDate = DateTime.Now,
                    },
                };
                dbContext.Club.AddRange(clubs);
                await dbContext.SaveChangesAsync();
            }

            //only create the Users entry if there is none already in the Db
            if (!userManager.Users.Any()) 
            {
                //once the clubs are created assign then to users
                var clubsIds = dbContext.Club.Select(c => c.Id).ToList();

                var rnd = new Random();

                var shuffleClubIds = clubsIds.OrderBy(x => rnd.Next()).ToList();


                for (int i = 0; i < 3; i++)
                {
                    var email = $"user{i}@test.pt";

                    if (await userManager.FindByEmailAsync(email) == null)
                    {
                        var user = new AppUser
                        {
                            UserName = $"user{i}",
                            Email = email,
                            ClubId = shuffleClubIds[i],
                        };

                        var result = await userManager.CreateAsync(user, "Test1234!");
                        if (!result.Succeeded)
                        {
                            throw new Exception($"Failed to create user {email}: {string.Join(",", result.Errors.Select(e => e.Description))}");
                        }
                    }
                }
            }
        }

        public static async Task SeedPlayersAsync(IServiceProvider serviceProvider)
        {

            var dbContext = serviceProvider.GetRequiredService<AppDbContext>();

            //if each player is a person u need first to create a person and then create the player\
            //only create a dummy person entry if there is none already in the DB
            if (!dbContext.Person.Any())
            {
                var json = File.ReadAllText("Data/player.json");
                var people = JsonSerializer.Deserialize<List<Person>>(json);

                dbContext.Person.AddRange(people);
                await dbContext.SaveChangesAsync();
            }

            //Only create dummy players if there is none already in DB
            if (!dbContext.Player.Any())
            {
                //get the id of each person to associate with a player
                var persons_id = dbContext.Person.Select(p => p.Person_id).ToList();

                var rand = new Random();

                var positions = new[] { "GR", "DL", "DC", "DR", "MC", "MO", "EE", "EP", "PL"};

                var clubsIds = dbContext.Club.Select(c => c.Id).ToList();

                for (int i = 0; i < persons_id.Count; i++)
                {
                   
                    var player = new Player
                    {
                        Person_id = persons_id[i],
                        Club_id = clubsIds[rand.Next(0, 3)],
                        Position = positions[rand.Next(positions.Length)],
                        Rating = rand.Next(50, 100), // more realistic range
                        MarketValue = rand.Next(500, 10000) // more realistic value
                    };

                    dbContext.Player.Add(player);

                }
                await dbContext.SaveChangesAsync();
            }
        }

        public static async Task SeedDepartamentAsync(IServiceProvider serviceProvider) {

            var dbContext = serviceProvider.GetRequiredService<AppDbContext>();
            if (!dbContext.Department.Any() && dbContext.Club.Any())
            {
                var clubsIds = dbContext.Club.Select(c => c.Id).ToList(); //get the clubs ids

                for (int i = 0; i < clubsIds.Count; i++)
                {

                    var deps = new List<Department>()
                    {
                        new Department {
                            DepName = "Business",
                            Club_id = clubsIds[i],
                        },
                        new Department
                        {
                            DepName = "Marketing",
                            Club_id = clubsIds[i],
                        },
                        new Department
                        {
                            DepName = "Cleaning",
                            Club_id = clubsIds[i],
                        },
                    };
                    dbContext.Department.AddRange(deps);
                    await dbContext.SaveChangesAsync();
                }
            }
        }

        public static async Task SeedEmployeesAsync(IServiceProvider serviceProvider) {

            var dbContext = serviceProvider.GetRequiredService<AppDbContext>();

            if (!dbContext.Employee.Any())
            { 
                var json = File.ReadAllText("Data/employee.json");
                var employee = JsonSerializer.Deserialize<List<Person>>(json);

                dbContext.Person.AddRange(employee);
                await dbContext.SaveChangesAsync();

                var personId = dbContext.Person
                    .Where(p => !dbContext.Player.Any(pl => pl.Person_id == p.Person_id))
                    .Select(p => p.Person_id)
                    .ToList();

                var departmentFunctions = new Dictionary<string, List<string>>
                {
                    { "Business", new List<string> { "Accountant", "Business Analyst", "Operations Coordinator" } },
                    { "Marketing", new List<string> { "Marketing Manager", "Content Strategist", "CEO Specialist" } },
                    { "Cleaning", new List<string> { "Janitor", "Facility Cleaner", "Maintenance Assistant" } },

                };

                var departments = dbContext.Department
                    .Select(d => new { d.Dep_id, d.DepName })
                    .ToList();
                var rand = new Random();


                for (int i = 0; i < personId.Count; i++) {

                    var dep = departments[i % departments.Count];
                    var dep_id = dep.Dep_id;
                    var dep_name = dep.DepName;

                    var emp = new Employee
                    {
                        Emp_function = departmentFunctions[dep_name][rand.Next(0, 3)],
                        Dep_id = dep_id,
                        Person_id = personId[i],
                    };

                    dbContext.Employee.Add(emp);
                }
                await dbContext.SaveChangesAsync();
                
            }
        }
    }
}
