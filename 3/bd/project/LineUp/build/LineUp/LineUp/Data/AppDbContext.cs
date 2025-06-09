using LineUp.DTOs;
using LineUp.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace LineUp.Data
{
    public class AppDbContext : IdentityDbContext<AppUser>
    {
        //set the data bases 
        public DbSet<Club> Club { get; set; }
        public DbSet<Contracts> Contracts { get; set; }
        public DbSet<Department> Department { get; set; }
        public DbSet<Employee> Employee { get; set; }
        public DbSet<Games> Games { get; set; }
        public DbSet<GameStats> GamesStats { get; set; }
        public DbSet<Person> Person { get; set; }
        public DbSet<Player> Player { get; set; }
        public DbSet<Transference> Transference { get; set; }
        public DbSet<PlayerGameStats> PlayerGameStats { get; set; }

        

        //Unmapped DTOs
        public DbSet<PlayerViewDto> PlayerViews { get; set; }
        public DbSet<PlayerCountDto> PlayerCount { get; set; }
        public DbSet<TransferenceDto> Transferences { get; set; }
        public DbSet<EmployeeViewDto> EmployeeView { get; set; }
        public DbSet<EmployeeCount> EmployeeCount { get; set; }
        public DbSet<FeaturesViewDto> FeaturesView { get; set; }
        public DbSet<PlayerPositionDto> PlayerPosition { get; set; }
        public DbSet<TransfCountDto> TransfCount { get; set; }
        public DbSet<ListPlTotalCountDto> PlCount { get; set; }
        

        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<PlayerViewDto>().HasNoKey().ToView(null);
            modelBuilder.Entity<PlayerCountDto>().HasNoKey().ToView(null);
            modelBuilder.Entity<TransferenceDto>().HasNoKey().ToView(null);
            modelBuilder.Entity<EmployeeViewDto>().HasNoKey().ToView(null);
            modelBuilder.Entity<EmployeeCount>().HasNoKey().ToView(null);
            modelBuilder.Entity<FeaturesViewDto>().HasNoKey().ToView(null);
            modelBuilder.Entity<PlayerPositionDto>().HasNoKey().ToView(null);
            modelBuilder.Entity<TransfCountDto>().HasNoKey().ToView(null);
            modelBuilder.Entity<ListPlTotalCountDto>().HasNoKey().ToView(null);

            modelBuilder.Entity<IdentityUserLogin<string>>(entity =>
            {
                entity.HasKey(l => new { l.LoginProvider, l.ProviderKey }).IsClustered(false);
                entity.Property(l => l.LoginProvider).HasMaxLength(128);
                entity.Property(l => l.ProviderKey).HasMaxLength(128);
            });

            modelBuilder.Entity<IdentityUserToken<string>>(entity =>
            {
                entity.HasKey(t => new { t.UserId, t.LoginProvider, t.Name }).IsClustered(false );
                entity.Property(t => t.UserId).HasMaxLength(128);
                entity.Property(t => t.LoginProvider).HasMaxLength(128);
                entity.Property(t => t.Name).HasMaxLength(128);
            });

            modelBuilder.Entity<IdentityUserRole<string>>(entity =>
            {
                entity.HasKey(r => new { r.UserId, r.RoleId }).IsClustered(false);
                entity.Property(r => r.UserId).HasMaxLength(128);
                entity.Property(r => r.RoleId).HasMaxLength(128);
            });

            modelBuilder.Entity<IdentityUserRole<string>>(entity =>
            {
                entity.HasKey(r => new { r.UserId, r.RoleId });
            });
        

        modelBuilder.Entity<Club>(entity =>
            {
                entity.ToTable("Club", "ConfManagement");

                entity.HasKey(c => c.Id);
                entity.Property(c => c.Id).HasColumnName("Club_id");
                entity.Property(c => c.Name).HasColumnName("Club_name");
            });

            //Club -> Players(1:n)
            modelBuilder.Entity<Club>()
                .HasMany(c => c.Players)
                .WithOne(p => p.Club)
                .HasForeignKey(p => p.Club_id);


            modelBuilder.Entity<AppUser>(entity =>
            {
                entity.HasOne(u => u.Club)
                    .WithOne(c => c.User)
                    .HasForeignKey<AppUser>(u => u.ClubId)
                    .OnDelete(DeleteBehavior.Cascade);
            });

            //Player is a Person
            modelBuilder.Entity<Person>()
                .HasOne(p => p.Player)
                .WithOne(p => p.Person)
                .HasForeignKey<Player>(p => p.Person_id);

            //Employee is a Person
            modelBuilder.Entity<Person>()
                .HasOne(p => p.Employee)
                .WithOne(e => e.Person)
                .HasForeignKey<Employee>(e => e.Person_id);

            //Departament -> Employee(1:n)
            modelBuilder.Entity<Employee>()
                .HasOne(e => e.Department)
                .WithMany(d => d.Employees)
                .HasForeignKey(e => e.Dep_id);

            //Club -> Department(1:n)
            modelBuilder.Entity<Department>()
                .HasOne(d => d.Club)
                .WithMany(c => c.Departments)
                .HasForeignKey(d => d.Club_id);

            //Each club has many games(1:n)
            modelBuilder.Entity<Games>()
                .HasOne(g => g.Team1)
                .WithMany(c => c.HomeGames)
                .HasForeignKey(g => g.team1_id)
                .OnDelete(DeleteBehavior.Restrict); // Prevent cascade cycles

            modelBuilder.Entity<Games>()
                .HasOne(g => g.Team2)
                .WithMany(c => c.AwayGames)
                .HasForeignKey(g => g.team2_id)
                .OnDelete(DeleteBehavior.Restrict); // Prevent cascade cycles

            //1 player has many statics 
            modelBuilder.Entity<PlayerGameStats>()
                 .HasOne(pgs => pgs.Player)
                 .WithMany(p => p.PlayerGameStats)
                 .HasForeignKey(pgs => pgs.Player_id);

            modelBuilder.Entity<PlayerGameStats>()
                .HasOne(pgs => pgs.Game)
                .WithMany(g => g.PlayerGameStats)
                .HasForeignKey(pgs => pgs.Game_id);

            modelBuilder.Entity<Contracts>()
                .HasOne(c => c.Person)
                .WithOne(p => p.Contract)
                .HasForeignKey<Contracts>(c => c.Person_id);

            modelBuilder.Entity<Transference>()
                .HasOne(t => t.Player)
                .WithMany(p => p.Transferences)
                .HasForeignKey(t => t.Trans_player);

            //need to configure a logic for the fact that when a club is deleted the transference that 
            //is linked to it is not deleted
            modelBuilder.Entity<Transference>()
                .HasOne(t => t.Prev_Club)
                .WithMany(c => c.PrevClub)
                .HasForeignKey(t => t.Previus_club)
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<Transference>()
                .HasOne(t => t.Dest_Club)
                .WithMany(p => p.DestClub)
                .HasForeignKey(t => t.Destination_club)
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<PlayerGameStats>()
                .Property(p => p.LeaveAt)
                .HasColumnType("time");

            modelBuilder.Entity<PlayerGameStats>()
                .Property(p => p.EnterAt)
                .HasColumnType("time");

            //this is only to know that is ignored it dosent affect the migration
            modelBuilder.Entity<AppUser>().Ignore(u => u.LockoutEnd);
            modelBuilder.Entity<AppUser>().Ignore(u => u.AccessFailedCount);
            //modelBuilder.Entity<ApplicationUser>().Ignore(u => u.ConcurrencyStamp);
            modelBuilder.Entity<AppUser>().Ignore(u => u.TwoFactorEnabled);
            modelBuilder.Entity<AppUser>().Ignore(u => u.PhoneNumberConfirmed);
            modelBuilder.Entity<AppUser>().Ignore(u => u.EmailConfirmed);
            //phone number in this app is useless
            modelBuilder.Entity<AppUser>().Ignore(u => u.PhoneNumber);
        }
    }
}
