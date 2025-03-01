-- Create the database
CREATE DATABASE F1_Racing;
USE F1_Racing;

-- Create the Driver table
CREATE TABLE Driver (
    DriverID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Nationality VARCHAR(50),
    DateOfBirth DATE,
    NumberOfCar INT,
    DriverAchievement TEXT
);

-- Create the Team table
CREATE TABLE Team (
    TeamID INT AUTO_INCREMENT PRIMARY KEY,
    TeamName VARCHAR(100) NOT NULL,
    Headquarters VARCHAR(100),
    Sponsor VARCHAR(100)
);

-- Create the Circuits table
CREATE TABLE Circuits (
    CircuitID INT AUTO_INCREMENT PRIMARY KEY,
    CircuitName VARCHAR(100) NOT NULL,
    Location VARCHAR(100),
    Length DECIMAL(5,2),
    LapRecord TIME,
    RestAreas INT,
    FoodVendors INT
);

-- Create the Race table
CREATE TABLE Race (
    RaceID INT AUTO_INCREMENT PRIMARY KEY,
    RaceDate DATE NOT NULL,
    Weather VARCHAR(50),
    CircuitID INT,
    RaceNumber INT,
    FOREIGN KEY (CircuitID) REFERENCES Circuits(CircuitID)
);

-- Create the Result table
CREATE TABLE Result (
    ResultID INT AUTO_INCREMENT PRIMARY KEY,
    Position INT,
    LapTime TIME,
    Points INT,
    DriverID INT,
    RaceID INT,
    FOREIGN KEY (DriverID) REFERENCES Driver(DriverID),
    FOREIGN KEY (RaceID) REFERENCES Race(RaceID)
);

-- Create the PitStops table
CREATE TABLE PitStops (
    PitStopID INT AUTO_INCREMENT PRIMARY KEY,
    LapNumber INT,
    Duration TIME,
    TyreChoice VARCHAR(50),
    RaceID INT,
    DriverID INT,
    FOREIGN KEY (RaceID) REFERENCES Race(RaceID),
    FOREIGN KEY (DriverID) REFERENCES Driver(DriverID)
);

-- Populate the Team table
INSERT INTO Team (TeamName, Headquarters, Sponsor)
VALUES ('Red Bull Racing', 'Milton Keynes, UK', 'Oracle'),
       ('Mercedes-AMG', 'Brackley, UK', 'Petronas'),
       ('Ferrari', 'Maranello, Italy', 'Shell'),
       ('McLaren', 'Woking, UK', 'Google'),
       ('Alpine', 'Enstone, UK', 'Castrol'),
       ('Aston Martin', 'Silverstone, UK', 'Cognizant'),
       ('AlphaTauri', 'Faenza, Italy', 'Honda'),
       ('Williams', 'Grove, UK', 'Duracell'),
       ('Haas', 'Kannapolis, USA', 'MoneyGram'),
       ('Alfa Romeo', 'Hinwil, Switzerland', 'Stake');

-- Populate the Driver table
INSERT INTO Driver (Name, Nationality, DateOfBirth, NumberOfCar, DriverAchievement)
VALUES ('Max Verstappen', 'Netherlands', '1997-09-30', 33, '3-time World Champion (2021-2023)'),
       ('Lewis Hamilton', 'UK', '1985-01-07', 44, '7-time World Champion'),
       ('Charles Leclerc', 'Monaco', '1997-10-16', 16, 'Multiple Grand Prix Winner'),
       ('Fernando Alonso', 'Spain', '1981-07-29', 14, '2-time World Champion'),
       ('Sergio Perez', 'Mexico', '1990-01-26', 11, 'Multiple Grand Prix Winner'),
       ('George Russell', 'UK', '1998-02-15', 63, 'Grand Prix Winner'),
       ('Lando Norris', 'UK', '1999-11-13', 4, 'Podium Finisher'),
       ('Carlos Sainz', 'Spain', '1994-09-01', 55, 'Grand Prix Winner'),
       ('Valtteri Bottas', 'Finland', '1989-08-28', 77, 'Multiple Grand Prix Winner'),
       ('Pierre Gasly', 'France', '1996-02-07', 10, 'Grand Prix Winner'),
       ('Esteban Ocon', 'France', '1996-09-17', 31, 'Grand Prix Winner'),
       ('Alexander Albon', 'Thailand', '1996-03-23', 23, 'Podium Finisher'),
       ('Kevin Magnussen', 'Denmark', '1992-10-05', 20, 'Pole Position Winner'),
       ('Yuki Tsunoda', 'Japan', '2000-05-11', 22, 'Top 10 Finisher'),
       ('Zhou Guanyu', 'China', '1999-05-30', 24, 'Top 10 Finisher'),
       ('Oscar Piastri', 'Australia', '2001-04-06', 81, 'Podium Finisher'),
       ('Nico Hülkenberg', 'Germany', '1987-08-19', 27, 'Consistent Points Scorer');

-- Populate the Circuits table
INSERT INTO Circuits (CircuitName, Location, Length, LapRecord, RestAreas, FoodVendors)
VALUES ('Monza', 'Italy', 5.79, '01:21.046', 5, 10),
       ('Silverstone', 'UK', 5.89, '01:27.097', 8, 15),
       ('Spa', 'Belgium', 7.00, '01:46.286', 6, 12),
       ('Suzuka', 'Japan', 5.81, '01:30.983', 4, 8),
       ('Monaco', 'Monaco', 3.34, '01:10.166', 3, 6),
       ('Yas Marina', 'UAE', 5.28, '01:39.283', 5, 9),
       ('Circuit of the Americas', 'USA', 5.51, '01:36.169', 7, 14),
       ('Interlagos', 'Brazil', 4.31, '01:10.540', 6, 10),
       ('Zandvoort', 'Netherlands', 4.25, '01:11.097', 4, 8),
       ('Jeddah', 'Saudi Arabia', 6.17, '01:27.511', 5, 11);

-- Populate the Race table
INSERT INTO Race (RaceDate, Weather, CircuitID, RaceNumber)
VALUES ('2024-03-15', 'Sunny', 1, 1),
       ('2024-04-10', 'Cloudy', 2, 2),
       ('2024-05-20', 'Rainy', 3, 3);

-- Populate the Result table
-- Populate the Result table with more fast lap times
INSERT INTO Result (Position, LapTime, Points, DriverID, RaceID)
VALUES (1, '01:20.946', 25, 1, 2),
       (2, '01:21.180', 18, 2, 2),
       (3, '01:21.320', 15, 3, 2),
       (4, '01:21.600', 12, 4, 2),
       (5, '01:21.750', 10, 5, 2);

-- Populate the PitStops table with all tire choices and more data
INSERT INTO PitStops (LapNumber, Duration, TyreChoice, RaceID, DriverID)
VALUES (10, '00:25.034', 'Soft', 2, 1),
       (14, '00:26.780', 'Medium', 2, 2),
       (18, '00:29.200', 'Hard', 2, 3),
       (9, '00:25.600', 'Intermediate', 2, 4),
       (13, '00:28.400', 'Wet', 2, 5);


SELECT COUNT(*) FROM Driver WHERE DriverID NOT IN (SELECT DriverID FROM Result);
SELECT COUNT(*) FROM Circuits WHERE CircuitID NOT IN (SELECT CircuitID FROM Race);
