/*
==========================================================
Transit Analytics Database

File: schema.sql

Purpose:
Creates the database structure for the Transit Analytics
project, including tables, relationships, views, and indexes.

Author: Nimrah Ashraf
==========================================================
*/

BEGIN
    EXECUTE IMMEDIATE 'DROP VIEW TripSummary';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Trips';
    EXECUTE IMMEDIATE 'DROP TABLE Riders';
    EXECUTE IMMEDIATE 'DROP TABLE Routes';
    EXECUTE IMMEDIATE 'DROP TABLE Stations';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE Riders (
    rider_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    membership_type VARCHAR2(20) NOT NULL,
    join_date DATE NOT NULL,
    CONSTRAINT chk_membership_type
        CHECK (membership_type IN ('Student', 'Regular', 'Senior'))
);

CREATE TABLE Routes (
    route_id NUMBER PRIMARY KEY,
    route_name VARCHAR2(100) NOT NULL UNIQUE,
    transportation_type VARCHAR2(20) NOT NULL,
    CONSTRAINT chk_transportation_type
        CHECK (transportation_type IN ('Train', 'Bus'))
);

CREATE TABLE Stations (
    station_id NUMBER PRIMARY KEY,
    station_name VARCHAR2(100) NOT NULL UNIQUE,
    city VARCHAR2(50) DEFAULT 'Chicago',
    zone_number NUMBER NOT NULL,
    CONSTRAINT chk_zone
        CHECK (zone_number BETWEEN 1 AND 5)
);

CREATE TABLE Trips (
    trip_id NUMBER PRIMARY KEY,
    rider_id NUMBER NOT NULL,
    route_id NUMBER NOT NULL,
    station_id NUMBER NOT NULL,
    trip_date DATE NOT NULL,
    fare NUMBER(5,2) NOT NULL,
    travel_period VARCHAR2(20) NOT NULL,

    CONSTRAINT fk_trip_rider
        FOREIGN KEY (rider_id) REFERENCES Riders(rider_id),

    CONSTRAINT fk_trip_route
        FOREIGN KEY (route_id) REFERENCES Routes(route_id),

    CONSTRAINT fk_trip_station
        FOREIGN KEY (station_id) REFERENCES Stations(station_id),

    CONSTRAINT chk_fare
        CHECK (fare >= 0),

    CONSTRAINT chk_travel_period
        CHECK (travel_period IN ('Peak', 'Off-Peak'))
);

CREATE OR REPLACE VIEW TripSummary AS
SELECT
    t.trip_id,
    r.first_name || ' ' || r.last_name AS rider_name,
    r.membership_type,
    ro.route_name,
    ro.transportation_type,
    s.station_name,
    s.zone_number,
    t.trip_date,
    t.travel_period,
    t.fare
FROM Trips t
JOIN Riders r ON t.rider_id = r.rider_id
JOIN Routes ro ON t.route_id = ro.route_id
JOIN Stations s ON t.station_id = s.station_id;

CREATE INDEX idx_trips_date
ON Trips(trip_date);

CREATE INDEX idx_trips_route
ON Trips(route_id);
