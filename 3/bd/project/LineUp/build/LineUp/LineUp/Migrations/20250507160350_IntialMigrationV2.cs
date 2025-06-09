using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace LineUp.Migrations
{
    /// <inheritdoc />
    public partial class IntialMigrationV2 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.EnsureSchema(
                name: "ConfManagement");

            migrationBuilder.CreateTable(
                name: "AspNetRoles",
                columns: table => new
                {
                    Id = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    Name = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    NormalizedName = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    ConcurrencyStamp = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetRoles", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Club",
                schema: "ConfManagement",
                columns: table => new
                {
                    Club_id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Club_name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    TransferBudget = table.Column<int>(type: "int", nullable: false),
                    FoundationDate = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Club", x => x.Club_id);
                });

            migrationBuilder.CreateTable(
                name: "Person",
                schema: "ConfManagement",
                columns: table => new
                {
                    Person_id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Person_name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    BirthDate = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Person", x => x.Person_id);
                });

            migrationBuilder.CreateTable(
                name: "AspNetRoleClaims",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    RoleId = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    ClaimType = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ClaimValue = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetRoleClaims", x => x.Id);
                    table.ForeignKey(
                        name: "FK_AspNetRoleClaims_AspNetRoles_RoleId",
                        column: x => x.RoleId,
                        principalTable: "AspNetRoles",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUsers",
                columns: table => new
                {
                    Id = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    UserName = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: false),
                    Email = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: false),
                    PasswordHash = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    ClubId = table.Column<int>(type: "int", nullable: false),
                    NormalizedUserName = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    NormalizedEmail = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    SecurityStamp = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ConcurrencyStamp = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    LockoutEnabled = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUsers", x => x.Id);
                    table.ForeignKey(
                        name: "FK_AspNetUsers_Club_ClubId",
                        column: x => x.ClubId,
                        principalSchema: "ConfManagement",
                        principalTable: "Club",
                        principalColumn: "Club_id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Department",
                schema: "ConfManagement",
                columns: table => new
                {
                    Dep_id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    DepName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Club_id = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Department", x => x.Dep_id);
                    table.ForeignKey(
                        name: "FK_Department_Club_Club_id",
                        column: x => x.Club_id,
                        principalSchema: "ConfManagement",
                        principalTable: "Club",
                        principalColumn: "Club_id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Games",
                schema: "ConfManagement",
                columns: table => new
                {
                    Game_id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Game_location = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    team1_id = table.Column<int>(type: "int", nullable: false),
                    team2_id = table.Column<int>(type: "int", nullable: false),
                    Game_statics = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Games", x => x.Game_id);
                    table.ForeignKey(
                        name: "FK_Games_Club_team1_id",
                        column: x => x.team1_id,
                        principalSchema: "ConfManagement",
                        principalTable: "Club",
                        principalColumn: "Club_id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Games_Club_team2_id",
                        column: x => x.team2_id,
                        principalSchema: "ConfManagement",
                        principalTable: "Club",
                        principalColumn: "Club_id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Contracts",
                schema: "ConfManagement",
                columns: table => new
                {
                    Cont_id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Salary = table.Column<int>(type: "int", nullable: false),
                    StartDate = table.Column<DateOnly>(type: "date", nullable: false),
                    EndDate = table.Column<DateOnly>(type: "date", nullable: false),
                    Person_id = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Contracts", x => x.Cont_id);
                    table.ForeignKey(
                        name: "FK_Contracts_Person_Person_id",
                        column: x => x.Person_id,
                        principalSchema: "ConfManagement",
                        principalTable: "Person",
                        principalColumn: "Person_id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Player",
                schema: "ConfManagement",
                columns: table => new
                {
                    Player_id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Position = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Rating = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    MarketValue = table.Column<int>(type: "int", nullable: false),
                    Person_id = table.Column<int>(type: "int", nullable: false),
                    Club_id = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Player", x => x.Player_id);
                    table.ForeignKey(
                        name: "FK_Player_Club_Club_id",
                        column: x => x.Club_id,
                        principalSchema: "ConfManagement",
                        principalTable: "Club",
                        principalColumn: "Club_id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Player_Person_Person_id",
                        column: x => x.Person_id,
                        principalSchema: "ConfManagement",
                        principalTable: "Person",
                        principalColumn: "Person_id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserClaims",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserId = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    ClaimType = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ClaimValue = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserClaims", x => x.Id);
                    table.ForeignKey(
                        name: "FK_AspNetUserClaims_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserLogins",
                columns: table => new
                {
                    LoginProvider = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    ProviderKey = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    ProviderDisplayName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    UserId = table.Column<string>(type: "nvarchar(450)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserLogins", x => new { x.LoginProvider, x.ProviderKey });
                    table.ForeignKey(
                        name: "FK_AspNetUserLogins_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserRoles",
                columns: table => new
                {
                    UserId = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    RoleId = table.Column<string>(type: "nvarchar(450)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserRoles", x => new { x.UserId, x.RoleId });
                    table.ForeignKey(
                        name: "FK_AspNetUserRoles_AspNetRoles_RoleId",
                        column: x => x.RoleId,
                        principalTable: "AspNetRoles",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_AspNetUserRoles_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserTokens",
                columns: table => new
                {
                    UserId = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    LoginProvider = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    Name = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    Value = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserTokens", x => new { x.UserId, x.LoginProvider, x.Name });
                    table.ForeignKey(
                        name: "FK_AspNetUserTokens_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Emplyee",
                schema: "ConfManagement",
                columns: table => new
                {
                    Emp_id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Emp_function = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Dep_id = table.Column<int>(type: "int", nullable: false),
                    Person_id = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Emplyee", x => x.Emp_id);
                    table.ForeignKey(
                        name: "FK_Emplyee_Department_Dep_id",
                        column: x => x.Dep_id,
                        principalSchema: "ConfManagement",
                        principalTable: "Department",
                        principalColumn: "Dep_id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Emplyee_Person_Person_id",
                        column: x => x.Person_id,
                        principalSchema: "ConfManagement",
                        principalTable: "Person",
                        principalColumn: "Person_id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "GameStats",
                schema: "ConfManagement",
                columns: table => new
                {
                    Game_id = table.Column<int>(type: "int", nullable: false),
                    Goal_team1 = table.Column<int>(type: "int", nullable: false),
                    Goal_team2 = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_GameStats", x => x.Game_id);
                    table.ForeignKey(
                        name: "FK_GameStats_Games_Game_id",
                        column: x => x.Game_id,
                        principalSchema: "ConfManagement",
                        principalTable: "Games",
                        principalColumn: "Game_id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "PlayerGameStats",
                schema: "ConfManagement",
                columns: table => new
                {
                    Stat_id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Goals = table.Column<int>(type: "int", nullable: false),
                    Assists = table.Column<int>(type: "int", nullable: false),
                    EnterAt = table.Column<int>(type: "int", nullable: false),
                    LeaveAt = table.Column<int>(type: "int", nullable: false),
                    YellowCards = table.Column<int>(type: "int", nullable: false),
                    RedCards = table.Column<int>(type: "int", nullable: false),
                    Game_id = table.Column<int>(type: "int", nullable: false),
                    Player_id = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PlayerGameStats", x => x.Stat_id);
                    table.ForeignKey(
                        name: "FK_PlayerGameStats_Games_Game_id",
                        column: x => x.Game_id,
                        principalSchema: "ConfManagement",
                        principalTable: "Games",
                        principalColumn: "Game_id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_PlayerGameStats_Player_Player_id",
                        column: x => x.Player_id,
                        principalSchema: "ConfManagement",
                        principalTable: "Player",
                        principalColumn: "Player_id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Transference",
                schema: "ConfManagement",
                columns: table => new
                {
                    Transf_id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Trans_value = table.Column<int>(type: "int", nullable: false),
                    Trans_player = table.Column<int>(type: "int", nullable: false),
                    Previus_club = table.Column<int>(type: "int", nullable: false),
                    Destination_club = table.Column<int>(type: "int", nullable: false),
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Transference", x => x.Transf_id);
                    table.ForeignKey(
                        name: "FK_Transference_Club_Destination_club",
                        column: x => x.Destination_club,
                        principalSchema: "ConfManagement",
                        principalTable: "Club",
                        principalColumn: "Club_id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Transference_Club_Previus_club",
                        column: x => x.Previus_club,
                        principalSchema: "ConfManagement",
                        principalTable: "Club",
                        principalColumn: "Club_id",
                        onDelete: ReferentialAction.NoAction);
                    table.ForeignKey(
                        name: "FK_Transference_Player_Trans_player",
                        column: x => x.Trans_player,
                        principalSchema: "ConfManagement",
                        principalTable: "Player",
                        principalColumn: "Player_id",
                        onDelete: ReferentialAction.NoAction);
                });

            migrationBuilder.CreateIndex(
                name: "IX_AspNetRoleClaims_RoleId",
                table: "AspNetRoleClaims",
                column: "RoleId");

            migrationBuilder.CreateIndex(
                name: "RoleNameIndex",
                table: "AspNetRoles",
                column: "NormalizedName",
                unique: true,
                filter: "[NormalizedName] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUserClaims_UserId",
                table: "AspNetUserClaims",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUserLogins_UserId",
                table: "AspNetUserLogins",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUserRoles_RoleId",
                table: "AspNetUserRoles",
                column: "RoleId");

            migrationBuilder.CreateIndex(
                name: "EmailIndex",
                table: "AspNetUsers",
                column: "NormalizedEmail");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUsers_ClubId",
                table: "AspNetUsers",
                column: "ClubId",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "UserNameIndex",
                table: "AspNetUsers",
                column: "NormalizedUserName",
                unique: true,
                filter: "[NormalizedUserName] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_Contracts_Person_id",
                schema: "ConfManagement",
                table: "Contracts",
                column: "Person_id",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Department_Club_id",
                schema: "ConfManagement",
                table: "Department",
                column: "Club_id");

            migrationBuilder.CreateIndex(
                name: "IX_Emplyee_Dep_id",
                schema: "ConfManagement",
                table: "Emplyee",
                column: "Dep_id");

            migrationBuilder.CreateIndex(
                name: "IX_Emplyee_Person_id",
                schema: "ConfManagement",
                table: "Emplyee",
                column: "Person_id",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Games_team1_id",
                schema: "ConfManagement",
                table: "Games",
                column: "team1_id");

            migrationBuilder.CreateIndex(
                name: "IX_Games_team2_id",
                schema: "ConfManagement",
                table: "Games",
                column: "team2_id");

            migrationBuilder.CreateIndex(
                name: "IX_Player_Club_id",
                schema: "ConfManagement",
                table: "Player",
                column: "Club_id");

            migrationBuilder.CreateIndex(
                name: "IX_Player_Person_id",
                schema: "ConfManagement",
                table: "Player",
                column: "Person_id",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_PlayerGameStats_Game_id",
                schema: "ConfManagement",
                table: "PlayerGameStats",
                column: "Game_id");

            migrationBuilder.CreateIndex(
                name: "IX_PlayerGameStats_Player_id",
                schema: "ConfManagement",
                table: "PlayerGameStats",
                column: "Player_id");

            migrationBuilder.CreateIndex(
                name: "IX_Transference_Destination_club",
                schema: "ConfManagement",
                table: "Transference",
                column: "Destination_club");

            migrationBuilder.CreateIndex(
                name: "IX_Transference_Previus_club",
                schema: "ConfManagement",
                table: "Transference",
                column: "Previus_club");

            migrationBuilder.CreateIndex(
                name: "IX_Transference_Trans_player",
                schema: "ConfManagement",
                table: "Transference",
                column: "Trans_player");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "AspNetRoleClaims");

            migrationBuilder.DropTable(
                name: "AspNetUserClaims");

            migrationBuilder.DropTable(
                name: "AspNetUserLogins");

            migrationBuilder.DropTable(
                name: "AspNetUserRoles");

            migrationBuilder.DropTable(
                name: "AspNetUserTokens");

            migrationBuilder.DropTable(
                name: "Contracts",
                schema: "ConfManagement");

            migrationBuilder.DropTable(
                name: "Emplyee",
                schema: "ConfManagement");

            migrationBuilder.DropTable(
                name: "GameStats",
                schema: "ConfManagement");

            migrationBuilder.DropTable(
                name: "PlayerGameStats",
                schema: "ConfManagement");

            migrationBuilder.DropTable(
                name: "Transference",
                schema: "ConfManagement");

            migrationBuilder.DropTable(
                name: "AspNetRoles");

            migrationBuilder.DropTable(
                name: "AspNetUsers");

            migrationBuilder.DropTable(
                name: "Department",
                schema: "ConfManagement");

            migrationBuilder.DropTable(
                name: "Games",
                schema: "ConfManagement");

            migrationBuilder.DropTable(
                name: "Player",
                schema: "ConfManagement");

            migrationBuilder.DropTable(
                name: "Club",
                schema: "ConfManagement");

            migrationBuilder.DropTable(
                name: "Person",
                schema: "ConfManagement");
        }
    }
}
