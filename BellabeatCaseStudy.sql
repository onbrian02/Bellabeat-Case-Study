##### BELLABEAT CASE STUDY #####

### Count Distinct ID from dailyActivity ###
SELECT
  COUNT(DISTINCT(Id)) AS distinctID,
FROM
  FitBit.dailyActivity
;

### Count Distinct Dates from dailyActivity Grouped by ID ###
SELECT
  Id,
  COUNT(DISTINCT(ActivityDate)) AS distinctDate1
FROM
  FitBit.dailyActivity AS dailyActivity
WHERE
  TotalSteps > 0
GROUP BY
  dailyActivity.Id
;

### Count Distanct ID from sleepDay ###
SELECT
  COUNT(DISTINCT(Id)) AS distinctId2
FROM
  FitBit.sleepDay
;

### Min/Max/Average Steps and Sleep Grouped by Days
SELECT
  EXTRACT(DAYOFWEEK FROM DATE(ActivityDate)) AS Day,
  MIN(TotalSteps) AS MinSteps,
  MAX(TotalSteps) AS MaxSteps,
  AVG(TotalSteps) As AvgSteps,
  MIN(TotalMinutesAsleep) AS MinSleep,
  MAX(TotalMinutesAsleep) AS MaxSleep,
  AVG(TotalMinutesAsleep) AS AvgSleep,
  CASE
    WHEN EXTRACT(DAYOFWEEK FROM DATE(ActivityDate)) = 1 THEN "Sunday"
    WHEN EXTRACT(DAYOFWEEK FROM DATE(ActivityDate)) = 2 THEN "Monday"
    WHEN EXTRACT(DAYOFWEEK FROM DATE(ActivityDate)) = 3 THEN "Tuesday"
    WHEN EXTRACT(DAYOFWEEK FROM DATE(ActivityDate)) = 4 THEN "Wednesday"
    WHEN EXTRACT(DAYOFWEEK FROM DATE(ActivityDate)) = 5 THEN "Thursday"
    WHEN EXTRACT(DAYOFWEEK FROM DATE(ActivityDate)) = 6 THEN "Friday"
    WHEN EXTRACT(DAYOFWEEK FROM DATE(ActivityDate)) = 7 THEN "Saturday"
  END AS DayOfWeek
FROM
  FitBit.dailyActivity AS dailyActivity
INNER JOIN
  FitBit.sleepDay AS sleepDay
ON
  dailyActivity.Id = sleepDay.Id
  AND dailyActivity.ActivityDate = sleepDay.SleepDay
WHERE
  TotalSteps > 0
GROUP BY
  Day,
  DayOfWeek
ORDER BY
  Day ASC
;


