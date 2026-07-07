/*
==========================================================
Transit Analytics Database

File: queries.sql

Purpose:
Contains business reports and analytics queries for the
Transit Analytics Database.

Author: Nimrah Ashraf
==========================================================
*/

/*
==========================================================
Report 1: Complete Trip History

Purpose:
Displays every transit trip with rider information,
membership type, transit route, station, fare zone,
travel period, trip date, and trip fare.

Business Value:
Provides a complete history of transit trips for
reporting and operational analysis.
==========================================================
*/

SELECT
    trip_id AS "Trip ID",
    rider_name AS "Rider Name",
    membership_type AS "Membership Type",
    route_name AS "Route",
    transportation_type AS "Transit Type",
    station_name AS "Station",
    zone_number AS "Fare Zone",
    TO_CHAR(trip_date, 'Mon DD, YYYY') AS "Trip Date",
    travel_period AS "Travel Period",
    TO_CHAR(fare, '$9,990.00') AS "Trip Fare"
FROM TripSummary
ORDER BY trip_date;


/*
==========================================================
Report 2: Revenue by Route

Purpose:
Shows total trips and revenue for each transit route.

Business Value:
Helps identify the busiest and highest revenue routes.
==========================================================
*/

SELECT
    route_name AS "Route",
    COUNT(*) AS "Total Trips",
    TO_CHAR(SUM(fare), '$9,990.00') AS "Total Revenue"
FROM TripSummary
GROUP BY route_name
ORDER BY SUM(fare) DESC;


/*
==========================================================
Report 3: Trips by Membership Type

Purpose:
Shows the number of trips taken by each membership type.

Business Value:
Helps understand rider usage patterns by membership group.
==========================================================
*/

SELECT
    membership_type AS "Membership Type",
    COUNT(*) AS "Trips Taken"
FROM TripSummary
GROUP BY membership_type
ORDER BY COUNT(*) DESC;


/*
==========================================================
Report 4: Average Fare by Transit Type

Purpose:
Shows the average fare for each type of transit.

Business Value:
Helps compare fare patterns between different transportation types.
==========================================================
*/

SELECT
    transportation_type AS "Transit Type",
    TO_CHAR(ROUND(AVG(fare), 2), '$9,990.00') AS "Average Fare"
FROM TripSummary
GROUP BY transportation_type
ORDER BY AVG(fare) DESC;
