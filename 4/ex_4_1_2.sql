DROP TABLE IF EXISTS ReservasDeVoos_Seat;
DROP TABLE IF EXISTS ReservasDeVoos_LegInstance;
DROP TABLE IF EXISTS ReservasDeVoos_FlightLeg;
DROP TABLE IF EXISTS ReservasDeVoos_Fare;
DROP TABLE IF EXISTS ReservasDeVoos_Flight;
DROP TABLE IF EXISTS ReservasDeVoos_Airplane;
DROP TABLE IF EXISTS ReservasDeVoos_AirplaneType;
DROP TABLE IF EXISTS ReservasDeVoos_Airport;

CREATE TABLE [ReservasDeVoos_AirplaneType](
	[TypeName] [varchar](512) NOT NULL PRIMARY KEY,
	[company] [varchar](512) NOT NULL,
	[MaxSeats] [int] NOT NULL,
)
GO

CREATE TABLE [ReservasDeVoos_Airplane](
	[AirplaneId] [varchar](512) NOT NULL PRIMARY KEY,
	[TotalNoOfSeats] [int] NOT NULL,
	[AirplaneTypeName] [varchar](512) NOT NULL REFERENCES [ReservasDeVoos_AirplaneType] ([TypeName]),
)
GO

CREATE TABLE [ReservasDeVoos_Airport](
	[AirportCode] [varchar](512) NOT NULL PRIMARY KEY,
	[City] [varchar](512) NOT NULL,
	[State] [varchar](512) NOT NULL,
	[Name] [varchar](512) NOT NULL,
)
GO

CREATE TABLE [ReservasDeVoos_FlightLeg](
	[LegNo] [int] NOT NULL PRIMARY KEY,
	[FlightNumber] [int] NOT NULL,
	[ScheduledDepTime] [time] NOT NULL,
	[ScheduledArrTime] [time] NOT NULL,
	[ArrivalAirportCode] [varchar](512) NOT NULL REFERENCES [ReservasDeVoos_Airport] ([AirportCode]),
	[DepartureAirportCode] [varchar](512) NOT NULL REFERENCES [ReservasDeVoos_Airport] ([AirportCode]),
)
GO

CREATE TABLE [ReservasDeVoos_LegInstance](
	[FlightLegNo] [int] NOT NULL REFERENCES [ReservasDeVoos_FlightLeg] ([LegNo]),
	[Date] [date] NOT NULL,
	[NoOfAvailSeats] [int] NOT NULL,
	[DepTime] [time] NOT NULL,
	[ArrTime] [time] NOT NULL,
	[AirplaneId] [varchar](512) NOT NULL REFERENCES [ReservasDeVoos_Airplane] ([AirplaneId]),
	[ArrivalAirportCode] [varchar](512) NOT NULL REFERENCES [ReservasDeVoos_Airport] ([AirportCode]),
	[DepartureAirportCode] [varchar](512) NOT NULL REFERENCES [ReservasDeVoos_Airport] ([AirportCode]),
	PRIMARY KEY ([Date]),
)
GO

CREATE TABLE [ReservasDeVoos_Seat](
	[FlightLegNumber] [int] NOT NULL PRIMARY KEY,
	[SeatNo] [int] NOT NULL,
	[CustomerName] [varchar](512) NOT NULL,
	[Cphone] [int] NOT NULL,
	[LegInstanceDate] [date] NOT NULL REFERENCES [ReservasDeVoos_LegInstance] ([Date]),
)
GO

CREATE TABLE [ReservasDeVoos_Flight](
	[Number] [int] NOT NULL PRIMARY KEY,
	[Airline] [varchar](512) NOT NULL,
	[Weekdays] [varchar](512) NOT NULL,
)
GO

CREATE TABLE [ReservasDeVoos_Fare](
	[Code] [int] NOT NULL PRIMARY KEY,
	[Amount] [money] NOT NULL,
	[Restrictions] [varchar](512) NOT NULL,
	[FlightNumber] [int] NOT NULL REFERENCES [ReservasDeVoos_Flight] ([Number]),
)
GO