/*
Case Study - Bike Share

How do annual members and casual riders use Cyclistic bikes differently?

Project 1
*/

-- Twelve tables have been imported for this case study. Preview each table.

SELECT *
FROM `my-project-test-336015.bike_share.Trip_Data_2021_01`;

SELECT *
FROM `my-project-test-336015.bike_share.Trip_Data_2021_02`;

SELECT *
FROM `my-project-test-336015.bike_share.Trip_Data_2021_03`;

SELECT *
FROM `my-project-test-336015.bike_share.Trip_Data_2021_04`;

SELECT *
FROM `my-project-test-336015.bike_share.Trip_Data_2021_05`;

SELECT *
FROM `my-project-test-336015.bike_share.Trip_Data_2021_06`;

SELECT *
FROM `my-project-test-336015.bike_share.Trip_Data_2021_07`;

SELECT *
FROM `my-project-test-336015.bike_share.Trip_Data_2021_08`;

SELECT *
FROM `my-project-test-336015.bike_share.Trip_Data_2021_09`;

SELECT *
FROM `my-project-test-336015.bike_share.Trip_Data_2021_10`;

SELECT *
FROM `my-project-test-336015.bike_share.Trip_Data_2021_11`;

SELECT *
FROM `my-project-test-336015.bike_share.Trip_Data_2021_12`;

-- Ensure that each ride identity is unique

SELECT count(ride_id) AS CountRides, count(distinct ride_id) AS UniqueRides
FROM `my-project-test-336015.bike_share.Trip_Data_2021_01`;

SELECT count(ride_id) AS CountRides, count(distinct ride_id) AS UniqueRides
FROM `my-project-test-336015.bike_share.Trip_Data_2021_02`;

SELECT count(ride_id) AS CountRides, count(distinct ride_id) AS UniqueRides
FROM `my-project-test-336015.bike_share.Trip_Data_2021_03`;

SELECT count(ride_id) AS CountRides, count(distinct ride_id) AS UniqueRides
FROM `my-project-test-336015.bike_share.Trip_Data_2021_04`;

SELECT count(ride_id) AS CountRides, count(distinct ride_id) AS UniqueRides
FROM `my-project-test-336015.bike_share.Trip_Data_2021_05`;

SELECT count(ride_id) AS CountRides, count(distinct ride_id) AS UniqueRides
FROM `my-project-test-336015.bike_share.Trip_Data_2021_06`;

SELECT count(ride_id) AS CountRides, count(distinct ride_id) AS UniqueRides
FROM `my-project-test-336015.bike_share.Trip_Data_2021_07`;

SELECT count(ride_id) AS CountRides, count(distinct ride_id) AS UniqueRides
FROM `my-project-test-336015.bike_share.Trip_Data_2021_08`;

SELECT count(ride_id) AS CountRides, count(distinct ride_id) AS UniqueRides
FROM `my-project-test-336015.bike_share.Trip_Data_2021_09`;

SELECT count(ride_id) AS CountRides, count(distinct ride_id) AS UniqueRides
FROM `my-project-test-336015.bike_share.Trip_Data_2021_10`;

SELECT count(ride_id) AS CountRides, count(distinct ride_id) AS UniqueRides
FROM `my-project-test-336015.bike_share.Trip_Data_2021_11`;

SELECT count(ride_id) AS CountRides, count(distinct ride_id) AS UniqueRides
FROM `my-project-test-336015.bike_share.Trip_Data_2021_12`;

-- Combine the twelve tables into a long table

SELECT *
FROM `my-project-test-336015.bike_share.Trip_Data_2021_01` 
FULL OUTER JOIN `my-project-test-336015.bike_share.Trip_Data_2021_02` 
USING (ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, 
    end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual)
FULL OUTER JOIN `my-project-test-336015.bike_share.Trip_Data_2021_03`
USING (ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, 
    end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual)
FULL OUTER JOIN `my-project-test-336015.bike_share.Trip_Data_2021_04`
USING (ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, 
    end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual)
FULL OUTER JOIN `my-project-test-336015.bike_share.Trip_Data_2021_05`
USING (ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, 
    end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual)
FULL OUTER JOIN `my-project-test-336015.bike_share.Trip_Data_2021_06`
USING (ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, 
    end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual)
FULL OUTER JOIN `my-project-test-336015.bike_share.Trip_Data_2021_07`
USING (ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, 
    end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual)
FULL OUTER JOIN `my-project-test-336015.bike_share.Trip_Data_2021_08`
USING (ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, 
    end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual)
FULL OUTER JOIN `my-project-test-336015.bike_share.Trip_Data_2021_09`
USING (ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, 
    end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual)
FULL OUTER JOIN `my-project-test-336015.bike_share.Trip_Data_2021_10`
USING (ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, 
    end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual)
FULL OUTER JOIN `my-project-test-336015.bike_share.Trip_Data_2021_11`
USING (ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, 
    end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual)
FULL OUTER JOIN `my-project-test-336015.bike_share.Trip_Data_2021_12`
USING (ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, 
    end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual);

-- Save the results as a new table

/*
Case Study - Bike Share

How do annual members and casual riders use Cyclistic bikes differently?

Project 2
*/

-- Preview the table

SELECT *
FROM `my-project-test-336015.bike_share.Trip_Data_Dirty_2021`;

-- Ensure that each ride identity is unique

SELECT count(ride_id) AS CountRiders, count(distinct ride_id) AS CountDistRiders
FROM `my-project-test-336015.bike_share.Trip_Data_Dirty_2021`;

-- Create separate columns for date and time

SELECT started_at, extract(date FROM started_at) AS start_date, extract(time FROM started_at) AS start_time, 
    ended_at, extract(date FROM ended_at) AS end_date, extract(time FROM ended_at) AS end_time
FROM `my-project-test-336015.bike_share.Trip_Data_Dirty_2021`;

-- Identify the time per trip

SELECT ended_at, extract(time FROM ended_at) AS end_time, started_at, extract(time FROM started_at) AS start_time, 
    DATE_DIFF(ended_at, started_at, Second) AS trip_length
FROM `my-project-test-336015.bike_share.Trip_Data_Dirty_2021`;

-- Identify the days for which trips occur

SELECT ended_at, format_datetime("%a", ended_at) AS end_day_string, extract(dayofweek FROM ended_at) AS end_day_int, 
    started_at, format_datetime("%a", started_at) AS start_day_string, extract(dayofweek FROM started_at) AS start_day_int
FROM `my-project-test-336015.bike_share.Trip_Data_Dirty_2021`;

-- Identify the months for which trips occur

SELECT started_at, format_datetime("%b", started_at) AS start_month_string, extract(month FROM started_at) AS start_month_int,
    ended_at, format_datetime("%b", ended_at) AS end_month_string, extract(month FROM ended_at) AS end_month_int
FROM `my-project-test-336015.bike_share.Trip_Data_Dirty_2021`;

-- Combine coordinates

SELECT start_station_name, start_station_id, 
    concat(cast(start_lat AS string), ",", cast(start_lng AS string)) AS start_coord
FROM `my-project-test-336015.bike_share.Trip_Data_Dirty_2021`;

SELECT end_station_name, end_station_id, 
    concat(cast(end_lat AS string), ",", cast(end_lng AS string)) AS end_coord
FROM `my-project-test-336015.bike_share.Trip_Data_Dirty_2021`;

-- Find the distance travelled per trip

SELECT start_lat, start_lng, end_lat, end_lng, 
    (ST_DISTANCE(ST_GEOGPOINT(start_lng, start_lat), ST_GEOGPOINT(end_lng, end_lat))) AS trip_displacement
FROM `my-project-test-336015.bike_share.Trip_Data_Dirty_2021`;

-- Identify null values

With temp_table AS 
(
    SELECT ride_id, rideable_type, 
    
        extract(date FROM started_at) AS start_date, format_datetime("%b", started_at) AS start_month_string, 
        extract(month FROM started_at) AS start_month_int, format_datetime("%a", started_at) AS start_day_string, 
        extract(dayofweek FROM started_at) AS start_day_int, extract(time FROM started_at) AS start_time, 
        
        extract(date FROM ended_at) AS end_date, format_datetime("%b", ended_at) AS end_month_string, 
        extract(month FROM ended_at) AS end_month_int, format_datetime("%a", ended_at) AS end_day_string, 
        extract(dayofweek FROM ended_at) AS end_day_int, extract(time FROM ended_at) AS end_time,

        DATE_DIFF(ended_at, started_at, Second) AS trip_length, 
        (ST_DISTANCE(ST_GEOGPOINT(start_lng, start_lat), ST_GEOGPOINT(end_lng, end_lat))) AS trip_displacement, 
        member_casual
    FROM `my-project-test-336015.bike_share.Trip_Data_Dirty_2021`
)
SELECT *
FROM temp_table 
WHERE ride_id is null OR rideable_type is null OR 
    
    start_date is null OR start_month_string is null OR start_month_int is null OR start_day_string is null OR 	
    start_day_int is null OR start_time is null OR 
    
    end_date is null OR end_month_string is null OR end_month_int is null OR end_day_string is null OR 	
    end_day_int is null OR end_time is null OR 
    
    trip_length is null OR trip_displacement is null OR member_casual is null;

-- Create new table with cleaned data

With temp_table AS 
(
    SELECT ride_id, rideable_type, 
    
        extract(date FROM started_at) AS start_date, format_datetime("%b", started_at) AS start_month_string, 
        extract(month FROM started_at) AS start_month_int, format_datetime("%a", started_at) AS start_day_string, 
        extract(dayofweek FROM started_at) AS start_day_int, extract(time FROM started_at) AS start_time, 
        
        extract(date FROM ended_at) AS end_date, format_datetime("%b", ended_at) AS end_month_string, 
        extract(month FROM ended_at) AS end_month_int, format_datetime("%a", ended_at) AS end_day_string, 
        extract(dayofweek FROM ended_at) AS end_day_int, extract(time FROM ended_at) AS end_time,

        DATE_DIFF(ended_at, started_at, Second) AS trip_length, 
        (ST_DISTANCE(ST_GEOGPOINT(start_lng, start_lat), ST_GEOGPOINT(end_lng, end_lat))) AS trip_displacement, 
        member_casual
    FROM `my-project-test-336015.bike_share.Trip_Data_Dirty_2021`
)
SELECT *
FROM temp_table 
WHERE ride_id is not null AND rideable_type is not null AND  
    
    start_date is not null AND start_month_string is not null AND start_month_int is not null AND start_day_string is not null AND
    start_day_int is not null AND start_time is not null AND  
    
    end_date is not null AND end_month_string is not null AND end_month_int is not null AND end_day_string is not null AND 
    end_day_int is not null AND end_time is not null AND 
    
    trip_length is not null AND trip_displacement is not null AND member_casual is not null;

-- Save the new table

/*
Case Study - Bike Share

How do annual members and casual riders use Cyclistic bikes differently?

Project 3
*/

-- Preview the table

SELECT *
FROM `my-project-test-336015.bike_share.Trip_Data_Clean_2021`;

-- Differences between members

SELECT member_casual, count(ride_id) AS Count_Riders
FROM `my-project-test-336015.bike_share.Trip_Data_Clean_2021`
GROUP BY member_casual
ORDER BY Count_Riders DESC; 

SELECT member_casual, start_day_string, count(ride_id) AS Count_Riders,
FROM `my-project-test-336015.bike_share.Trip_Data_Clean_2021`
GROUP BY member_casual, start_day_string
ORDER BY Count_Riders DESC;

SELECT member_casual, start_day_string, count(ride_id) AS Count_Riders,
FROM `my-project-test-336015.bike_share.Trip_Data_Clean_2021`
WHERE member_casual = "member"
GROUP BY member_casual, start_day_string
ORDER BY Count_Riders DESC; 

SELECT member_casual, start_day_string, count(ride_id) AS Count_Riders,
FROM `my-project-test-336015.bike_share.Trip_Data_Clean_2021`
WHERE member_casual = "casual"
GROUP BY member_casual, start_day_string
ORDER BY Count_Riders DESC; 

SELECT member_casual, end_day_string, count(ride_id) AS Count_Riders,
FROM `my-project-test-336015.bike_share.Trip_Data_Clean_2021`
GROUP BY member_casual, end_day_string
ORDER BY Count_Riders DESC; 

SELECT member_casual, end_day_string, count(ride_id) AS Count_Riders,
FROM `my-project-test-336015.bike_share.Trip_Data_Clean_2021`
WHERE member_casual = "member"
GROUP BY member_casual, end_day_string
ORDER BY Count_Riders DESC; 

SELECT member_casual, end_day_string, count(ride_id) AS Count_Riders,
FROM `my-project-test-336015.bike_share.Trip_Data_Clean_2021`
WHERE member_casual = "casual"
GROUP BY member_casual, end_day_string
ORDER BY Count_Riders DESC; 

SELECT member_casual, start_month_string, count(ride_id) AS Count_Riders,
FROM `my-project-test-336015.bike_share.Trip_Data_Clean_2021`
GROUP BY member_casual, start_month_string
ORDER BY Count_Riders DESC; 

SELECT member_casual, start_month_string, count(ride_id) AS Count_Riders,
FROM `my-project-test-336015.bike_share.Trip_Data_Clean_2021`
WHERE member_casual = "member"
GROUP BY member_casual, start_month_string
ORDER BY Count_Riders DESC; 

SELECT member_casual, start_month_string, count(ride_id) AS Count_Riders,
FROM `my-project-test-336015.bike_share.Trip_Data_Clean_2021`
WHERE member_casual = "casual"
GROUP BY member_casual, start_month_string
ORDER BY Count_Riders DESC; 

SELECT member_casual, end_month_string, count(ride_id) AS Count_Riders,
FROM `my-project-test-336015.bike_share.Trip_Data_Clean_2021`
GROUP BY member_casual, end_month_string
ORDER BY Count_Riders DESC; 

SELECT member_casual, end_month_string, count(ride_id) AS Count_Riders,
FROM `my-project-test-336015.bike_share.Trip_Data_Clean_2021`
WHERE member_casual = "member"
GROUP BY member_casual, end_month_string
ORDER BY Count_Riders DESC; 

SELECT member_casual, end_month_string, count(ride_id) AS Count_Riders,
FROM `my-project-test-336015.bike_share.Trip_Data_Clean_2021`
WHERE member_casual = "casual"
GROUP BY member_casual, end_month_string
ORDER BY Count_Riders DESC; 

SELECT member_casual, start_date, count(ride_id) AS Count_Riders
FROM `my-project-test-336015.bike_share.Trip_Data_Clean_2021`
GROUP BY member_casual, start_date
ORDER BY Count_Riders DESC;

SELECT member_casual, start_date, count(ride_id) AS Count_Riders
FROM `my-project-test-336015.bike_share.Trip_Data_Clean_2021`
WHERE member_casual = "member"
GROUP BY member_casual, start_date
ORDER BY Count_Riders DESC;

SELECT member_casual, start_date, count(ride_id) AS Count_Riders
FROM `my-project-test-336015.bike_share.Trip_Data_Clean_2021`
WHERE member_casual = "casual"
GROUP BY member_casual, start_date
ORDER BY Count_Riders DESC;

SELECT member_casual, end_date, count(ride_id) AS Count_Riders
FROM `my-project-test-336015.bike_share.Trip_Data_Clean_2021`
GROUP BY member_casual, end_date
ORDER BY Count_Riders DESC;

SELECT member_casual, end_date, count(ride_id) AS Count_Riders
FROM `my-project-test-336015.bike_share.Trip_Data_Clean_2021`
WHERE member_casual = "member"
GROUP BY member_casual, end_date
ORDER BY Count_Riders DESC;

SELECT member_casual, end_date, count(ride_id) AS Count_Riders
FROM `my-project-test-336015.bike_share.Trip_Data_Clean_2021`
WHERE member_casual = "casual"
GROUP BY member_casual, end_date
ORDER BY Count_Riders DESC;

SELECT member_casual, extract(hour FROM start_time) AS Start_Hour, count(ride_id) AS Count_Riders
FROM `my-project-test-336015.bike_share.Trip_Data_Clean_2021`
GROUP BY member_casual, Start_Hour
ORDER BY Count_Riders DESC;

SELECT member_casual, extract(hour FROM end_time) AS End_Hour, count(ride_id) AS Count_Riders
FROM `my-project-test-336015.bike_share.Trip_Data_Clean_2021`
GROUP BY member_casual, End_Hour
ORDER BY Count_Riders DESC;

SELECT member_casual, count(ride_id) AS Count_Riders, max(trip_length) AS Max_Trip_Length, 
    avg(trip_length) AS Avg_Trip_Length, min(trip_length) AS Min_Trip_Length, max(trip_displacement) AS Max_Trip_Displacement, 
    avg(trip_displacement) AS Avg_Trip_Displacement, min(trip_displacement) AS Min_Trip_Displacement
From `my-project-test-336015.bike_share.Trip_Data_Clean_2021`
WHERE end_date = start_date AND trip_length > 0
GROUP BY member_casual
ORDER BY Count_Riders DESC;

SELECT member_casual, count(ride_id) AS Count_Riders, max(trip_length) AS Max_Trip_Length, 
    avg(trip_length) AS Avg_Trip_Length, min(trip_length) AS Min_Trip_Length, max(trip_displacement) AS Max_Trip_Displacement, 
    avg(trip_displacement) AS Avg_Trip_Displacement, min(trip_displacement) AS Min_Trip_Displacement
From `my-project-test-336015.bike_share.Trip_Data_Clean_2021`
WHERE end_date != start_date AND trip_length > 0
GROUP BY member_casual
ORDER BY Count_Riders DESC; 

SELECT member_casual, rideable_type, count(ride_id) AS Count_Riders
FROM `my-project-test-336015.bike_share.Trip_Data_Clean_2021`
GROUP BY member_casual, rideable_type
ORDER BY Count_Riders DESC; 

SELECT member_casual, rideable_type, start_day_string, count(ride_id) AS Count_Riders,
FROM `my-project-test-336015.bike_share.Trip_Data_Clean_2021`
GROUP BY member_casual, rideable_type, start_day_string
ORDER BY Count_Riders DESC;

SELECT member_casual, rideable_type, start_day_string, count(ride_id) AS Count_Riders,
FROM `my-project-test-336015.bike_share.Trip_Data_Clean_2021`
WHERE member_casual = "member"
GROUP BY member_casual, rideable_type, start_day_string
ORDER BY Count_Riders DESC; 

SELECT member_casual, rideable_type, start_day_string, count(ride_id) AS Count_Riders,
FROM `my-project-test-336015.bike_share.Trip_Data_Clean_2021`
WHERE member_casual = "casual"
GROUP BY member_casual, rideable_type, start_day_string
ORDER BY Count_Riders DESC; 

SELECT member_casual, rideable_type, end_day_string, count(ride_id) AS Count_Riders,
FROM `my-project-test-336015.bike_share.Trip_Data_Clean_2021`
GROUP BY member_casual, rideable_type, end_day_string
ORDER BY Count_Riders DESC; 

SELECT member_casual, rideable_type, end_day_string, count(ride_id) AS Count_Riders,
FROM `my-project-test-336015.bike_share.Trip_Data_Clean_2021`
WHERE member_casual = "member"
GROUP BY member_casual, rideable_type, end_day_string
ORDER BY Count_Riders DESC; 

SELECT member_casual, rideable_type, end_day_string, count(ride_id) AS Count_Riders,
FROM `my-project-test-336015.bike_share.Trip_Data_Clean_2021`
WHERE member_casual = "casual"
GROUP BY member_casual, rideable_type, end_day_string
ORDER BY Count_Riders DESC; 

SELECT member_casual, rideable_type, start_month_string, count(ride_id) AS Count_Riders,
FROM `my-project-test-336015.bike_share.Trip_Data_Clean_2021`
GROUP BY member_casual, rideable_type, start_month_string
ORDER BY Count_Riders DESC; 

SELECT member_casual, rideable_type, start_month_string, count(ride_id) AS Count_Riders,
FROM `my-project-test-336015.bike_share.Trip_Data_Clean_2021`
WHERE member_casual = "member"
GROUP BY member_casual, rideable_type, start_month_string
ORDER BY Count_Riders DESC; 

SELECT member_casual, rideable_type, start_month_string, count(ride_id) AS Count_Riders,
FROM `my-project-test-336015.bike_share.Trip_Data_Clean_2021`
WHERE member_casual = "casual"
GROUP BY member_casual, rideable_type, start_month_string
ORDER BY Count_Riders DESC; 

SELECT member_casual, rideable_type, end_month_string, count(ride_id) AS Count_Riders,
FROM `my-project-test-336015.bike_share.Trip_Data_Clean_2021`
GROUP BY member_casual, rideable_type, end_month_string
ORDER BY Count_Riders DESC; 

SELECT member_casual, rideable_type, end_month_string, count(ride_id) AS Count_Riders,
FROM `my-project-test-336015.bike_share.Trip_Data_Clean_2021`
WHERE member_casual = "member"
GROUP BY member_casual, rideable_type, end_month_string
ORDER BY Count_Riders DESC; 

SELECT member_casual, rideable_type, end_month_string, count(ride_id) AS Count_Riders,
FROM `my-project-test-336015.bike_share.Trip_Data_Clean_2021`
WHERE member_casual = "casual"
GROUP BY member_casual, rideable_type, end_month_string
ORDER BY Count_Riders DESC; 

SELECT member_casual, rideable_type, start_date, count(ride_id) AS Count_Riders
FROM `my-project-test-336015.bike_share.Trip_Data_Clean_2021`
GROUP BY member_casual, rideable_type, start_date
ORDER BY Count_Riders DESC;

SELECT member_casual, rideable_type, start_date, count(ride_id) AS Count_Riders
FROM `my-project-test-336015.bike_share.Trip_Data_Clean_2021`
WHERE member_casual = "member"
GROUP BY member_casual, rideable_type, start_date
ORDER BY Count_Riders DESC;

SELECT member_casual, rideable_type, start_date, count(ride_id) AS Count_Riders
FROM `my-project-test-336015.bike_share.Trip_Data_Clean_2021`
WHERE member_casual = "casual"
GROUP BY member_casual, rideable_type, start_date
ORDER BY Count_Riders DESC;

SELECT member_casual, rideable_type, end_date, count(ride_id) AS Count_Riders
FROM `my-project-test-336015.bike_share.Trip_Data_Clean_2021`
GROUP BY member_casual, rideable_type, end_date
ORDER BY Count_Riders DESC;

SELECT member_casual, rideable_type, end_date, count(ride_id) AS Count_Riders
FROM `my-project-test-336015.bike_share.Trip_Data_Clean_2021`
WHERE member_casual = "member"
GROUP BY member_casual, rideable_type, end_date
ORDER BY Count_Riders DESC;

SELECT member_casual, rideable_type, end_date, count(ride_id) AS Count_Riders
FROM `my-project-test-336015.bike_share.Trip_Data_Clean_2021`
WHERE member_casual = "casual"
GROUP BY member_casual, rideable_type, end_date
ORDER BY Count_Riders DESC;

SELECT member_casual, rideable_type, extract(hour FROM start_time) AS Start_Hour, count(ride_id) AS Count_Riders
FROM `my-project-test-336015.bike_share.Trip_Data_Clean_2021`
GROUP BY member_casual, rideable_type, Start_Hour
ORDER BY Count_Riders DESC;

SELECT member_casual, rideable_type, extract(hour FROM end_time) AS End_Hour, count(ride_id) AS Count_Riders
FROM `my-project-test-336015.bike_share.Trip_Data_Clean_2021`
GROUP BY member_casual, rideable_type, End_Hour
ORDER BY Count_Riders DESC;

SELECT member_casual, rideable_type, count(ride_id) AS Count_Riders, max(trip_length) AS Max_Trip_Length, 
    avg(trip_length) AS Avg_Trip_Length, min(trip_length) AS Min_Trip_Length, max(trip_displacement) AS Max_Trip_Displacement, 
    avg(trip_displacement) AS Avg_Trip_Displacement, min(trip_displacement) AS Min_Trip_Displacement
From `my-project-test-336015.bike_share.Trip_Data_Clean_2021`
WHERE end_date = start_date AND trip_length > 0
GROUP BY member_casual, rideable_type
ORDER BY Count_Riders DESC;

SELECT member_casual, rideable_type, count(ride_id) AS Count_Riders, max(trip_length) AS Max_Trip_Length, 
    avg(trip_length) AS Avg_Trip_Length, min(trip_length) AS Min_Trip_Length, max(trip_displacement) AS Max_Trip_Displacement, 
    avg(trip_displacement) AS Avg_Trip_Displacement, min(trip_displacement) AS Min_Trip_Displacement
From `my-project-test-336015.bike_share.Trip_Data_Clean_2021`
WHERE end_date != start_date AND trip_length > 0
GROUP BY member_casual, rideable_type
ORDER BY Count_Riders DESC; 
