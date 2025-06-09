using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace LineUp.Migrations
{
    /// <inheritdoc />
    public partial class FixingAnottations : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Transference_Club_Destination_club",
                schema: "ConfManagement",
                table: "Transference");

            migrationBuilder.DropForeignKey(
                name: "FK_Transference_Club_Previus_club",
                schema: "ConfManagement",
                table: "Transference");

            migrationBuilder.AlterColumn<TimeSpan>(
                name: "LeaveAt",
                schema: "ConfManagement",
                table: "PlayerGameStats",
                type: "time",
                nullable: false,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<TimeSpan>(
                name: "EnterAt",
                schema: "ConfManagement",
                table: "PlayerGameStats",
                type: "time",
                nullable: false,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<int>(
                name: "Rating",
                schema: "ConfManagement",
                table: "Player",
                type: "int",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)");

            migrationBuilder.AlterColumn<string>(
                name: "Position",
                schema: "ConfManagement",
                table: "Player",
                type: "nvarchar(100)",
                maxLength: 100,
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)");

            migrationBuilder.AlterColumn<string>(
                name: "Person_name",
                schema: "ConfManagement",
                table: "Person",
                type: "nvarchar(100)",
                maxLength: 100,
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)");

            migrationBuilder.AlterColumn<string>(
                name: "Game_location",
                schema: "ConfManagement",
                table: "Games",
                type: "nvarchar(100)",
                maxLength: 100,
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)");

            migrationBuilder.AlterColumn<string>(
                name: "Emp_function",
                schema: "ConfManagement",
                table: "Emplyee",
                type: "nvarchar(100)",
                maxLength: 100,
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)");

            migrationBuilder.AlterColumn<string>(
                name: "DepName",
                schema: "ConfManagement",
                table: "Department",
                type: "nvarchar(100)",
                maxLength: 100,
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)");

            migrationBuilder.AlterColumn<string>(
                name: "Club_name",
                schema: "ConfManagement",
                table: "Club",
                type: "nvarchar(255)",
                maxLength: 255,
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)");

            migrationBuilder.AddForeignKey(
                name: "FK_Transference_Club_Destination_club",
                schema: "ConfManagement",
                table: "Transference",
                column: "Destination_club",
                principalSchema: "ConfManagement",
                principalTable: "Club",
                principalColumn: "Club_id");

            migrationBuilder.AddForeignKey(
                name: "FK_Transference_Club_Previus_club",
                schema: "ConfManagement",
                table: "Transference",
                column: "Previus_club",
                principalSchema: "ConfManagement",
                principalTable: "Club",
                principalColumn: "Club_id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Transference_Club_Destination_club",
                schema: "ConfManagement",
                table: "Transference");

            migrationBuilder.DropForeignKey(
                name: "FK_Transference_Club_Previus_club",
                schema: "ConfManagement",
                table: "Transference");

            migrationBuilder.AlterColumn<int>(
                name: "LeaveAt",
                schema: "ConfManagement",
                table: "PlayerGameStats",
                type: "int",
                nullable: false,
                oldClrType: typeof(TimeSpan),
                oldType: "time");

            migrationBuilder.AlterColumn<int>(
                name: "EnterAt",
                schema: "ConfManagement",
                table: "PlayerGameStats",
                type: "int",
                nullable: false,
                oldClrType: typeof(TimeSpan),
                oldType: "time");

            migrationBuilder.AlterColumn<string>(
                name: "Rating",
                schema: "ConfManagement",
                table: "Player",
                type: "nvarchar(max)",
                nullable: false,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<string>(
                name: "Position",
                schema: "ConfManagement",
                table: "Player",
                type: "nvarchar(max)",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(100)",
                oldMaxLength: 100);

            migrationBuilder.AlterColumn<string>(
                name: "Person_name",
                schema: "ConfManagement",
                table: "Person",
                type: "nvarchar(max)",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(100)",
                oldMaxLength: 100);

            migrationBuilder.AlterColumn<string>(
                name: "Game_location",
                schema: "ConfManagement",
                table: "Games",
                type: "nvarchar(max)",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(100)",
                oldMaxLength: 100);

            migrationBuilder.AlterColumn<string>(
                name: "Emp_function",
                schema: "ConfManagement",
                table: "Emplyee",
                type: "nvarchar(max)",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(100)",
                oldMaxLength: 100);

            migrationBuilder.AlterColumn<string>(
                name: "DepName",
                schema: "ConfManagement",
                table: "Department",
                type: "nvarchar(max)",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(100)",
                oldMaxLength: 100);

            migrationBuilder.AlterColumn<string>(
                name: "Club_name",
                schema: "ConfManagement",
                table: "Club",
                type: "nvarchar(max)",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(255)",
                oldMaxLength: 255);

            migrationBuilder.AddForeignKey(
                name: "FK_Transference_Club_Destination_club",
                schema: "ConfManagement",
                table: "Transference",
                column: "Destination_club",
                principalSchema: "ConfManagement",
                principalTable: "Club",
                principalColumn: "Club_id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Transference_Club_Previus_club",
                schema: "ConfManagement",
                table: "Transference",
                column: "Previus_club",
                principalSchema: "ConfManagement",
                principalTable: "Club",
                principalColumn: "Club_id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
