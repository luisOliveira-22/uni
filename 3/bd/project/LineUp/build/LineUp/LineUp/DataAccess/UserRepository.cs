using LineUp.Data;
using LineUp.DTOs;
using LineUp.Models;
using Microsoft.AspNetCore.Mvc.Formatters;
using Microsoft.CodeAnalysis.Elfie.Diagnostics;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Conventions;
using Microsoft.EntityFrameworkCore.SqlServer.Query.Internal;
using NuGet.Protocol.Core.Types;



public class UserRepository : IUserRepository
{
    private readonly AppDbContext _context;

    public UserRepository(AppDbContext context)
    {
        _context = context;
    }

    public async Task<AppUser> GetUserByEmailAsync(string email)
    {
        var userInfo = _context.Users
            .FromSqlRaw("EXEC dbo.sp_get_name_by_email @p0", email)
            .AsEnumerable()
            .FirstOrDefault();

        return userInfo;
    }

    public async Task<List<PlayerViewDto>> GetPlayersToBuy(int? c, int page, int pageSize, string? position, string filterType, string filterOption)
    {
        var personsFromDb = await _context.PlayerViews
            .FromSqlRaw("EXEC dbo.sp_get_players_avaliable @p0, @p1, @p2, @p3, @p4, @p5", c, page, pageSize, position, filterType, filterOption)
            .ToListAsync();

        return personsFromDb;
    }

    public async Task<FeaturesViewDto> GetFeaturesInfo(int? clubId)
    {
        var result = _context.FeaturesView
            .FromSqlRaw("EXEC dbo.sp_get_features_info @p0", clubId)
            .AsEnumerable()
            .FirstOrDefault();

        return result;
    }

    public async Task<List<PlayerPositionDto>> ChangePlayers(int? clubId, string position)
    {
        var players = await _context.PlayerPosition
                    .FromSqlRaw("EXEC dbo.sp_position_player @p0, @p1", clubId, position)
                    .ToListAsync();

        return players;
    }


    public async Task TransferPlayer(int? clubId, int playerId, int transfValue)
    {
        Console.WriteLine(clubId);
        Console.WriteLine(playerId);
        Console.WriteLine(transfValue);
        await _context.Database.ExecuteSqlRawAsync(
                "EXEC dbo.sp_transfer_player @PlayerId, @ClubId, @TransValue",
                new SqlParameter("@PlayerId", playerId),
                new SqlParameter("@ClubId", clubId),
                new SqlParameter("@TransValue", transfValue)
                );
    }

    public async Task<List<PlayerViewDto>> GetListPlayers(int? clubId, int offSet, int pageSize, string? searchTerm)
    {
        var players = await _context.PlayerViews
            .FromSqlRaw("EXEC dbo.sp_get_players_by_clubId @p0, @p1, @p2, @p3", clubId, offSet, pageSize, searchTerm)
            .ToListAsync();

        return players;

    }

    public async Task<ListPlTotalCountDto> GetTotalPlayers(int? clubId) {

        var totalPlayers = await _context.PlCount
        .FromSqlRaw("SELECT * FROM ConfManagement.udf_GetPlayersCount({0})", clubId)
        .FirstOrDefaultAsync();

        return totalPlayers;
    }


    public async Task<PlayerCountDto> GetTotalAvaliablePlayers(int? clubId, string? position)
    {
        var totalPlayers = await _context.PlayerCount
        .FromSqlRaw("SELECT * FROM ConfManagement.udf_GetAvailablePlayersCount({0}, {1})", clubId, position)
        .FirstOrDefaultAsync();

        return totalPlayers;
    }


    //transferences
    public async Task<List<TransferenceDto>> GetTransferences(int? clubId, int offset, int pageSize)
    {
        var transferences = await _context.Transferences
                .FromSqlRaw("EXEC dbo.sp_get_transferences @p0, @p1, @p2", clubId, offset, pageSize)
                .ToListAsync();

        return transferences;
    }

    public async Task<TransfCountDto> GetTotalTransferences(int? clubId)
    {
        var totalPlayers = await _context.TransfCount
        .FromSqlRaw("SELECT * FROM ConfManagement.udf_GetTransfCount({0})", clubId)
        .FirstOrDefaultAsync();

        return totalPlayers;
    }


    //employees
    public async Task<List<EmployeeViewDto>> GetEmployees(int? c, int page, int pageSize)
    {
        var employeesFromDb = await _context.EmployeeView
            .FromSqlRaw("EXEC dbo.sp_get_employees @p0, @p1, @p2", c, page, pageSize)
            .ToListAsync();

        return employeesFromDb;
    }

    public async Task<EmployeeCount> GetTotalEmployees(int? clubId)
    {
        var totalPlayers = await _context.EmployeeCount
        .FromSqlRaw("SELECT * FROM ConfManagement.udf_GetEmployeesCount({0})", clubId)
        .FirstOrDefaultAsync();

        return totalPlayers;
    }

    public async Task DeletePlayer(int playerId) {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC dbo.sp_soft_delete_player @PlayerId",
            new SqlParameter("PlayerId", playerId)
        );
    }

    public async Task AddPlayer(int? clubId, string playerName, DateTime birthDate, string position, int rating, int marketValue)
    {
        await _context.Database.ExecuteSqlRawAsync(
                "EXEC dbo.sp_add_player @ClubId, @PlayerName, @BirthDate, @Position, @Rating, @MarketValue",
                new SqlParameter("@ClubId", clubId),
                new SqlParameter("@PlayerName", playerName),
                new SqlParameter("@BirthDate", birthDate),
                new SqlParameter("@Position", position),
                new SqlParameter("@Rating", rating),
                new SqlParameter("@MarketValue", marketValue)
                );
    }

    public async Task EditPlayer(int palyerId, string name, string position, int rating, int marketValue) {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC dbo.sp_update_player @PlayerId, @PlayerName, @Position, @Rating, @MarketValue",
            new SqlParameter("@PlayerId", palyerId),
            new SqlParameter("@PlayerName", name),
            new SqlParameter("@Position", position),
            new SqlParameter("@Rating", rating),
            new SqlParameter("@MarketValue", marketValue)
            );
    
    }
}
