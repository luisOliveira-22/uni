using LineUp.Data;
using LineUp.Models;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using NuGet.Protocol.Plugins;



var builder = WebApplication.CreateBuilder(args);

var connectionString = builder.Configuration.GetConnectionString("default");


// Add Controller service.
builder.Services.AddControllersWithViews();
//Add the DbContext service to container
builder.Services.AddDbContext<AppDbContext>(
    options => options.UseSqlServer(connectionString));

builder.Services.AddIdentity<AppUser, IdentityRole>(
    options =>
    { 
        options.Password.RequiredLength = 8;
        options.Password.RequireNonAlphanumeric = true;
    }
    )
    .AddEntityFrameworkStores<AppDbContext>().AddDefaultTokenProviders();

//for the midllerware of the ASPNET sessions
builder.Services.AddDistributedMemoryCache();

builder.Services.AddSession(options =>
    {
        //options.IdleTimeout = TimeSpan.FromMinutes(10);
        options.Cookie.HttpOnly = true;
        options.Cookie.IsEssential = true;
        

    });

builder.Services.AddAuthentication(options =>
{
    options.DefaultScheme = CookieAuthenticationDefaults.AuthenticationScheme;
})

//this will setup a cookie(Identity.IsAuthenticated) to validate auth
.AddCookie(options =>
{
    options.ExpireTimeSpan = TimeSpan.FromMinutes(10); // Example authentication cookie lifetime
    options.SlidingExpiration = true;
    options.LoginPath = "/Account/Login"; // Redirect for unauthenticated users
});

builder.Services.AddScoped<IUserRepository, UserRepository>();  //Add the DataAccess Interface layer to the builder to be able to inject in the controller

var app = builder.Build();

//populate the data base with dummy data when is empty
using (var scope = app.Services.CreateScope())
{ 
    var services = scope.ServiceProvider;
    await DbSeeder.SeedUserAsync(services);  //each user was already created
    await DbSeeder.SeedPlayersAsync(services);
    await DbSeeder.SeedDepartamentAsync(services);
    await DbSeeder.SeedEmployeesAsync(services);
}

    // Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseSession();
app.UseAuthentication();
app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/");

app.Run();
