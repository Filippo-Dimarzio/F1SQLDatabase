-- Query 1: Find all drivers who drove cars with specific numbers
SELECT * 
FROM Driver 
WHERE NumberOfCar IN (33, 44);

-- Query 2: Find races that occurred in a specific date range
SELECT * 
FROM Race 
WHERE RaceDate BETWEEN '2024-01-01' AND '2024-12-31';

-- Query 3: Search for circuits with names containing "Silver"
SELECT * 
FROM Circuits 
WHERE CircuitName LIKE '%Silver%';

-- Query 4: Use a date function to extract the year of races
SELECT RaceID, YEAR(RaceDate) AS RaceYear 
FROM Race;

-- Query 5: Multi-table JOIN to list drivers and their team names
SELECT d.Name AS DriverName, t.TeamName
FROM Driver d
JOIN Team t ON d.TeamID = t.TeamID;


-- Query 6: Multi-table JOIN to show race results with circuit names
SELECT r.RaceID, c.CircuitName, res.Position, res.Points 
FROM Result res
JOIN Race r ON res.RaceID = r.RaceID
JOIN Circuits c ON r.CircuitID = c.CircuitID;

-- Query 7: Aggregate function to count races held at each circuit
SELECT c.CircuitName, COUNT(r.RaceID) AS TotalRaces 
FROM Circuits c
JOIN Race r ON c.CircuitID = r.CircuitID
GROUP BY c.CircuitName;

-- Query 8: Aggregate function with GROUP BY and HAVING to find circuits with more than 2 races
SELECT c.CircuitName, COUNT(r.RaceID) AS TotalRaces 
FROM Circuits c
JOIN Race r ON c.CircuitID = r.CircuitID
GROUP BY c.CircuitName
HAVING TotalRaces > 2;

-- Query 9: Sort drivers by their achievements alphabetically
SELECT * 
FROM Driver 
ORDER BY DriverAchievement ASC;

-- Query 10: Outer JOIN to find all circuits, even those without races
SELECT c.CircuitName, r.RaceID 
FROM Circuits c
LEFT JOIN Race r ON c.CircuitID = r.CircuitID;

-- 11. Query to Identify Fastest Lap Time for Each Race
-- Find the fastest lap time in each race and the driver who achieved it
SELECT r.RaceID, MIN(res.LapTime) AS FastestLapTime, d.Name AS DriverName
FROM Result res
JOIN Driver d ON res.DriverID = d.DriverID
JOIN Race r ON res.RaceID = r.RaceID
GROUP BY r.RaceID;

-- 12. Query to Find the Most Successful Driver
-- Find the driver with the highest total points
SELECT d.Name AS DriverName, SUM(res.Points) AS TotalPoints
FROM Result res
JOIN Driver d ON res.DriverID = d.DriverID
GROUP BY d.DriverID
ORDER BY TotalPoints DESC
LIMIT 1;

-- 13. Query to Find Races with More than a Specific Number of Pit Stops
-- Identify races with more than 2 pit stops
SELECT r.RaceID, r.RaceDate, COUNT(ps.PitStopID) AS TotalPitStops
FROM PitStops ps
JOIN Race r ON ps.RaceID = r.RaceID
GROUP BY r.RaceID
HAVING COUNT(ps.PitStopID) > 2;

-- 14. Query to Check for Races Conducted in Rainy Weather
-- List races where the weather was rainy
SELECT RaceID, RaceDate, Weather
FROM Race
WHERE Weather = 'Rainy';

-- 15. Query to Find Circuits Longer than a Certain Length
-- List circuits that are longer than 6.0 km
SELECT CircuitName, Length
FROM Circuits
WHERE Length > 6.0;

-- 16. Query to Find All Drivers and Their Teams
-- Display driver names along with the team they belong to
SELECT d.Name AS DriverName, t.TeamName
FROM Driver d
JOIN Team t ON d.DriverID = t.TeamID;

-- 17. Query to List All Drivers with Their Achievements
-- List driver names along with their achievements
SELECT Name, driverAchievement
FROM Driver
WHERE driverAchievement IS NOT NULL;

-- 18. Query to Find Drivers Who Haven't Scored Points Yet
-- Identify drivers with zero total points
SELECT d.Name AS DriverName, COALESCE(SUM(res.Points), 0) AS TotalPoints
FROM Driver d
LEFT JOIN Result res ON d.DriverID = res.DriverID
GROUP BY d.DriverID
HAVING SUM(res.Points) = 0;

-- 19. Query to List Drivers with the Fastest Laps Across All Races
-- Find the fastest lap time overall and the driver who achieved it
SELECT d.Name AS DriverName, MIN(res.LapTime) AS FastestLap
FROM Result res
JOIN Driver d ON res.DriverID = d.DriverID;

-- 20. Outer Join (Right Join Example)
-- Show all circuits and the races conducted on them, even if no race exists
SELECT c.CircuitName, c.Location, r.RaceDate
FROM Race r
LEFT JOIN Circuits c ON r.CircuitID = c.CircuitID;


-- Query 21: Total Points Earned by Each Driver Across All Races
SELECT d.Name, SUM(res.Points) AS TotalPoints
FROM Driver d
JOIN Result res ON d.DriverID = res.DriverID
GROUP BY d.Name;

-- Query 22: Average Lap Time per Circuit
SELECT c.CircuitName, AVG(TIME_TO_SEC(res.LapTime)) AS AvgLapTime
FROM Circuits c
JOIN Race r ON c.CircuitID = r.CircuitID
JOIN Result res ON r.RaceID = res.RaceID
GROUP BY c.CircuitName;


-- Query 23: Drivers with Fastest Lap Time in Each Race
SELECT r.RaceID, d.Name AS DriverName, MIN(res.LapTime) AS FastestLap
FROM Result res
JOIN Driver d ON res.DriverID = d.DriverID
JOIN Race r ON res.RaceID = r.RaceID
GROUP BY r.RaceID;

-- Query 24: Number of Pit Stops by Tire Type
SELECT ps.TyreChoice, COUNT(ps.PitStopID) AS TotalPitStops
FROM PitStops ps
GROUP BY ps.TyreChoice;

-- Query 25: Circuits with the Most Food Vendors
SELECT CircuitName, FoodVendors
FROM Circuits
ORDER BY FoodVendors DESC
LIMIT 3;

-- Query 26: Top 3 Drivers with Most Wins
SELECT d.Name, COUNT(res.Position) AS TotalWins
FROM Driver d
JOIN Result res ON d.DriverID = res.DriverID
WHERE res.Position = 1
GROUP BY d.Name
ORDER BY TotalWins DESC
LIMIT 3;

-- Query 27: Average Duration of Pit Stops by Tire Type
SELECT ps.TyreChoice, AVG(ps.Duration) AS AvgDuration
FROM PitStops ps
GROUP BY ps.TyreChoice;

-- Query 28: Total Races Held by Each Team
SELECT t.TeamName, COUNT(r.RaceID) AS TotalRaces
FROM Team t
JOIN Driver d ON t.TeamID = d.TeamID
JOIN Result res ON d.DriverID = res.DriverID
JOIN Race r ON res.RaceID = r.RaceID
GROUP BY t.TeamName;

-- Query 29: Drivers with the Most Points in a Single Race
SELECT d.Name, MAX(res.Points) AS MaxPoints
FROM Driver d
JOIN Result res ON d.DriverID = res.DriverID
GROUP BY d.Name
ORDER BY MaxPoints DESC;

-- Query 30: Total Lap Records for Circuits
SELECT c.CircuitName, COUNT(res.LapTime) AS LapRecords
FROM Circuits c
JOIN Race r ON c.CircuitID = r.CircuitID
JOIN Result res ON r.RaceID = res.RaceID
WHERE res.LapTime = c.LapRecord
GROUP BY c.CircuitName;

