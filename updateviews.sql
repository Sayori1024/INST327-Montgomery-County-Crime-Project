-- INST 327 Final Project - Views and Sample Queries
-- Scope: 2020 Robbery Incidents MOCO in the Silver Spring District

USE moco_crime;
-- View 1: vw_monthly_robbery_trend
-- Purpose: Monthly trends of reported robbery incidents in 2020 to months with at least 5 incidents.
DROP VIEW IF EXISTS vw_monthly_robbery_trend;
CREATE VIEW vw_monthly_robbery_trend AS
SELECT
    MONTH(i.Start_Date_Time)        AS 'Month ID',
    MONTHNAME(i.Start_Date_Time)    AS 'Month Name',
    COUNT(DISTINCT i.IncidentID)    AS 'Incident Count',
    COUNT(o.OffenseID)              AS 'Offense Count'
FROM incidents AS i
JOIN offenses 
AS o
ON o.IncidentID = i.IncidentID
WHERE YEAR(i.Start_Date_Time) = 2020
GROUP BY MONTH(i.Start_Date_Time), MONTHNAME(i.Start_Date_Time)
HAVING COUNT(DISTINCT i.IncidentID) >= 5
ORDER BY 'Month ID';



-- View 2: vw_offenses_by_crime_name
-- Purpose: Offense counts and victim totals grouped by the CrimeName3 classification.

DROP VIEW IF EXISTS vw_offenses_by_crime_name;
CREATE VIEW vw_offenses_by_crime_name AS
SELECT
    ct.CrimeName3                   AS 'Crime Name',
    COUNT(o.OffenseID)              AS 'Offense Count',
    COUNT(DISTINCT i.IncidentID)    AS 'Incident Count',
    SUM(o.Victims)                  AS 'Total Victims'
FROM offenses   AS o
JOIN incidents  AS i 
ON i.IncidentID  = o.IncidentID
JOIN crimetypes AS ct
ON ct.OffenseCode = o.OffenseCode
GROUP BY ct.CrimeName3
ORDER BY 'Offense Count' DESC;




-- View 3: vw_top_patrol_areas
-- Purpose: Patrol areas with above-average incident counts. Uses a subquery.
DROP VIEW IF EXISTS vw_top_patrol_areas;
CREATE VIEW vw_top_patrol_areas AS
SELECT
    pa.PatrolAreaID,
    pa.Sector,
    pa.Beat,
    pa.PRA,
    pa.Place,
    COUNT(i.IncidentID) AS incident_count
FROM patrolareas AS pa
JOIN incidents AS i 
ON i.PatrolAreaID = pa.PatrolAreaID
GROUP BY pa.PatrolAreaID, pa.Sector, pa.Beat, pa.PRA, pa.Place
HAVING COUNT(i.IncidentID) > (
    SELECT AVG(area_count)
    FROM (
        SELECT COUNT(IncidentID) AS area_count
        FROM incidents
        GROUP BY PatrolAreaID
    ) AS per_area
)
ORDER BY incident_count DESC;





-- View 4: vw_location_type
-- Purpose: Incident counts by location type

DROP VIEW IF EXISTS vw_location_type;
CREATE VIEW vw_location_type AS
SELECT
    pa.Place                        AS 'Location Type',
    COUNT(DISTINCT i.IncidentID)    AS 'Incident Count'
FROM incidents   AS i
JOIN patrolareas AS pa
ON pa.PatrolAreaID = i.PatrolAreaID
WHERE pa.Place IS NOT NULL
GROUP BY pa.Place
HAVING COUNT(DISTINCT i.IncidentID) >= 3
ORDER BY 'Incident Count' DESC;




-- View 5: vw_weapon_use_summary
-- Purpose: Offense and victim counts grouped by weapon category

DROP VIEW IF EXISTS vw_weapon_use_summary;
CREATE VIEW vw_weapon_use_summary AS
SELECT
    CASE
        WHEN ct.CrimeName3 LIKE '%GUN%'           THEN 'Gun'
        WHEN ct.CrimeName3 LIKE '%KNIFE%'         THEN 'Knife'
        WHEN ct.CrimeName3 LIKE '%STRONG-ARM%'
          OR ct.CrimeName3 LIKE '%STRONG ARM%'    THEN 'Strong-Arm'
        WHEN ct.CrimeName3 LIKE '%OTHER WEAPON%'  THEN 'Other Weapon'
        ELSE 'Unspecified'
    END AS `Weapon Type`,
    COUNT(o.OffenseID)           AS `Offense Count`,
    COUNT(DISTINCT i.IncidentID) AS `Incident Count`,
    SUM(o.Victims)               AS `Total Victims`
FROM offenses AS o
JOIN incidents AS i ON i.IncidentID = o.IncidentID
JOIN crimetypes AS ct ON ct.OffenseCode = o.OffenseCode
GROUP BY `Weapon Type`
ORDER BY `Offense Count` DESC;

-- =====================================================================
-- Sanity-check queries (not stored as views; included for reference)
-- =====================================================================

-- Confirm the views exist
SELECT * FROM vw_monthly_robbery_trend;
SELECT * FROM vw_offenses_by_crime_name;
SELECT * FROM vw_top_patrol_areas;
SELECT * FROM vw_location_type;
SELECT * FROM vw_weapon_use_summary;
