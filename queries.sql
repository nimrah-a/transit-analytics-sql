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
...
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
