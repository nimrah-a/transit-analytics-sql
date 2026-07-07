/*
==========================================================
Transit Analytics Database

File: data.sql

Purpose:
Populates the Transit Analytics Database with sample data
used for testing and business reporting.

Author: Nimrah Ashraf
Last Updated: July 2026
==========================================================
*/

----------------------------------------------------------
-- Insert Riders
----------------------------------------------------------

INSERT INTO Riders VALUES (1, 'Sarah', 'Ahmed', 'Student', TO_DATE('2025-01-01', 'YYYY-MM-DD'));
INSERT INTO Riders VALUES (2, 'Ali', 'Khan', 'Regular', TO_DATE('2024-05-10', 'YYYY-MM-DD'));
INSERT INTO Riders VALUES (3, 'Maria', 'Lopez', 'Senior', TO_DATE('2023-08-12', 'YYYY-MM-DD'));
INSERT INTO Riders VALUES (4, 'Nadia', 'Hussain', 'Student', TO_DATE('2025-09-03', 'YYYY-MM-DD'));
INSERT INTO Riders VALUES (5, 'James', 'Wilson', 'Regular', TO_DATE('2024-11-20', 'YYYY-MM-DD'));
INSERT INTO Riders VALUES (6, 'Amina', 'Rahman', 'Student', TO_DATE('2026-01-15', 'YYYY-MM-DD'));

----------------------------------------------------------
-- Insert Routes
----------------------------------------------------------

INSERT INTO Routes VALUES (101, 'Blue Line', 'Train');
INSERT INTO Routes VALUES (102, 'Red Line', 'Train');
INSERT INTO Routes VALUES (103, 'Brown Line', 'Train');
INSERT INTO Routes VALUES (201, 'Route 8 Halsted', 'Bus');
INSERT INTO Routes VALUES (202, 'Route 22 Clark', 'Bus');

----------------------------------------------------------
-- Insert Stations
----------------------------------------------------------

INSERT INTO Stations VALUES (1, 'Clark/Lake', 'Chicago', 1);
INSERT INTO Stations VALUES (2, 'Belmont', 'Chicago', 2);
INSERT INTO Stations VALUES (3, 'O''Hare', 'Chicago', 3);
INSERT INTO Stations VALUES (4, '95th/Dan Ryan', 'Chicago', 3);
INSERT INTO Stations VALUES (5, 'Fullerton', 'Chicago', 2);
INSERT INTO Stations VALUES (6, 'Jackson', 'Chicago', 1);

----------------------------------------------------------
-- Insert Trips
----------------------------------------------------------

INSERT INTO Trips VALUES (1, 1, 101, 3, TO_DATE('2026-06-01', 'YYYY-MM-DD'), 2.50, 'Peak');
INSERT INTO Trips VALUES (2, 1, 102, 2, TO_DATE('2026-06-02', 'YYYY-MM-DD'), 2.50, 'Peak');
INSERT INTO Trips VALUES (3, 2, 201, 1, TO_DATE('2026-06-02', 'YYYY-MM-DD'), 2.25, 'Off-Peak');
INSERT INTO Trips VALUES (4, 3, 102, 4, TO_DATE('2026-06-03', 'YYYY-MM-DD'), 1.25, 'Off-Peak');
INSERT INTO Trips VALUES (5, 2, 101, 3, TO_DATE('2026-06-05', 'YYYY-MM-DD'), 2.50, 'Peak');
INSERT INTO Trips VALUES (6, 4, 103, 5, TO_DATE('2026-06-06', 'YYYY-MM-DD'), 2.50, 'Peak');
INSERT INTO Trips VALUES (7, 5, 202, 2, TO_DATE('2026-06-07', 'YYYY-MM-DD'), 2.25, 'Off-Peak');
INSERT INTO Trips VALUES (8, 4, 101, 1, TO_DATE('2026-06-08', 'YYYY-MM-DD'), 2.50, 'Peak');
INSERT INTO Trips VALUES (9, 1, 201, 5, TO_DATE('2026-06-09', 'YYYY-MM-DD'), 2.25, 'Off-Peak');
INSERT INTO Trips VALUES (10, 5, 102, 4, TO_DATE('2026-06-10', 'YYYY-MM-DD'), 2.50, 'Peak');
INSERT INTO Trips VALUES (11, 6, 103, 6, TO_DATE('2026-06-11', 'YYYY-MM-DD'), 2.50, 'Peak');
INSERT INTO Trips VALUES (12, 3, 202, 1, TO_DATE('2026-06-12', 'YYYY-MM-DD'), 1.25, 'Off-Peak');

----------------------------------------------------------
-- Save Changes
----------------------------------------------------------

COMMIT;
