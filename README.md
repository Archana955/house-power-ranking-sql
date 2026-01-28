# house-power-ranking-sql
SQL project to rank houses using aggregated character-level data

# House Power Ranking using SQL

## 📌 Project Overview
This project analyzes character-level data and aggregates it to the house level to determine the most powerful house. A weighted scoring formula is applied, and houses are ranked based on their overall strength.

## 🗂️ Dataset
- characters.csv: Character-level attributes such as influence, military strength, wealth, alliances, and alive status
- houses.csv: House lookup table with house names and regions

## 🛠️ SQL Concepts Used
- JOIN
- GROUP BY
- Aggregate functions (SUM)
- Conditional aggregation (CASE WHEN)
- Window functions (RANK)
- Data cleaning and CSV import handling

## 🧮 Power Score Formula
The projected power score is calculated as:
- 50% Influence
- 30% Military Strength
- 20% Wealth
- Bonus for alive characters
- Bonus for alliances

## 📊 Output
The final output is a ranked leaderboard showing:
- House-level aggregated metrics
- Projected power score
- Rank of each house

## 📁 Files
- final_query.sql – SQL query used for analysis
- house_power_leaderboard.csv – Final ranked output
- characters.csv – Input character data
- houses.csv – Input house data

