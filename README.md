# 🏎️ F1 Racing Database  

This project contains a **relational database schema** for managing **Formula 1 racing data**. The database includes key entities such as **Drivers, Teams, Circuits, Races, Results, and Pit Stops**, along with sample data and **SQL queries** for retrieving insights.  

## 📌 Features  

- **📂 Structured Database**: Tables for **Drivers, Teams, Circuits, Races, Results, and Pit Stops** with appropriate relationships.  
- **📊 Preloaded Data**: Includes real-world **F1 teams, drivers, and circuits**.  
- **🔎 Query Examples**: SQL queries for **race statistics, driver performance, fastest laps, team standings, and pit stop analysis**.  

## 📁 Tables Overview  

| Table      | Description |
|------------|------------|
| **Driver** | Stores driver details like name, nationality, car number, and achievements. |
| **Team** | Represents F1 teams with headquarters and sponsors. |
| **Circuits** | Information on racing circuits, including length, lap records, and amenities. |
| **Race** | Details of individual races, including date, weather, and circuit. |
| **Result** | Stores race results, including driver positions, lap times, and points. |
| **PitStops** | Records pit stop details, including duration and tire choices. |

## 🔥 SQL Queries Highlights  

- 🏆 **Top drivers by points**  
- ⚡ **Fastest lap times per race**  
- 🏁 **Circuits with the most races held**  
- ⏱️ **Average lap times per circuit**  
- 🏎️ **Top teams based on total wins**  

## 🚀 How to Use  

1. **Create the Database**:  
   ```sql
   CREATE DATABASE F1_Racing;
   USE F1_Racing;
