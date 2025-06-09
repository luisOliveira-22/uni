using LineUp.DTOs;
using LineUp.Models;
using LineUp.ViewModels;
using Microsoft.EntityFrameworkCore.Metadata.Conventions;
using System.ComponentModel;

public interface IUserRepository
{
    Task<AppUser> GetUserByEmailAsync(string email);

    Task<List<PlayerViewDto>> GetPlayersToBuy(int? c, int page, int pageSize,string? position,string filterType, string filterOption);

    Task<FeaturesViewDto> GetFeaturesInfo(int? clubId);
    Task<List<PlayerPositionDto>> ChangePlayers (int? clubId, string position);

    Task TransferPlayer(int? clubId, int playerIds, int transfValue);

    //List players
    Task<List<PlayerViewDto>> GetListPlayers(int? clubId, int offSet, int pageSize, string? searchTerm);

    Task<ListPlTotalCountDto> GetTotalPlayers(int? clubId);


    Task<PlayerCountDto> GetTotalAvaliablePlayers(int? clubId, string? position);

    Task<List<TransferenceDto>> GetTransferences(int? clubId, int offset, int pageSize);
    Task<TransfCountDto> GetTotalTransferences(int? clubId);


    Task<List<EmployeeViewDto>> GetEmployees(int? c, int page, int pageSize);

    Task<EmployeeCount> GetTotalEmployees(int? clubId);

    Task DeletePlayer(int playerId);

    Task EditPlayer(int palyerId, string name, string position, int rating, int marketValue);

    Task AddPlayer(int? clubId, string playerName, DateTime birthDate, string position, int rating, int marketValue);
}

