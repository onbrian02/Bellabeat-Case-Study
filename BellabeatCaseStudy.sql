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

### Count Distinct ID from weightLogInfo ###
SELECT
  COUNT(DISTINCT(Id)) AS distinctId3
FROM
  FitBit.weightLogInfo
;

### Min/Max/Average Steps Grouped by Days ###
  SELECT
  EXTRACT(DAYOFWEEK FROM DATE(ActivityDate)) AS Day,
  MIN(TotalSteps) AS MinSteps,
  MAX(TotalSteps) AS MaxSteps,
  AVG(TotalSteps) As AvgSteps,
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
  FitBit.dailyActivity
WHERE
  TotalSteps > 0
GROUP BY
  Day,
  DayOfWeek
ORDER BY
  Day ASC
;

### Average Steps a Day ###
SELECT
  AVG(TotalSteps) As AvgSteps
FROM
  FitBit.dailyActivity
WHERE
  TotalSteps > 0
;

### Steps VS Calories ###
SELECT 
  TotalSteps,
  Calories
FROM
  FitBit.dailyActivity
WHERE
  TotalSteps > 0
;

### Sedentary Minutes VS Calories ###
SELECT 
  SedentaryMinutes,
  Calories,
  SedentaryMinutes + LightlyActiveMinutes + FairlyActiveMinutes + VeryActiveMinutes AS TotalActivityMinutes
FROM
  FitBit.dailyActivity
WHERE
  TotalSteps > 0
  AND SedentaryMinutes + LightlyActiveMinutes + FairlyActiveMinutes + VeryActiveMinutes = 1440
;

### Lightly Active Minutes VS Calories ###
SELECT 
  LightlyActiveMinutes,
  Calories,
  SedentaryMinutes + LightlyActiveMinutes + FairlyActiveMinutes + VeryActiveMinutes AS TotalActivityMinutes
FROM
  FitBit.dailyActivity
WHERE
  TotalSteps > 0
  AND SedentaryMinutes + LightlyActiveMinutes + FairlyActiveMinutes + VeryActiveMinutes = 1440
;

### Fairly Active Minutes VS Calories ###
SELECT 
  FairlyActiveMinutes,
  Calories,
  SedentaryMinutes + LightlyActiveMinutes + FairlyActiveMinutes + VeryActiveMinutes AS TotalActivityMinutes
FROM
  FitBit.dailyActivity
WHERE
  TotalSteps > 0
  AND SedentaryMinutes + LightlyActiveMinutes + FairlyActiveMinutes + VeryActiveMinutes = 1440
;

### Very Active Minutes VS Calories ###
SELECT 
  VeryActiveMinutes,
  Calories,
  SedentaryMinutes + LightlyActiveMinutes + FairlyActiveMinutes + VeryActiveMinutes AS TotalActivityMinutes
FROM
  FitBit.dailyActivity
WHERE
  TotalSteps > 0
  AND SedentaryMinutes + LightlyActiveMinutes + FairlyActiveMinutes + VeryActiveMinutes = 1440
;

### Count Distinct ID after Inner Join dailyActivty and sleepDay ###
SELECT
  COUNT(DISTINCT(dailyActivity.Id)) AS distinctId1,
  COUNT(DISTINCT(sleepDay.Id)) AS distinctId2
FROM
  FitBit.dailyActivity AS dailyActivity
INNER JOIN
  FitBit.sleepDay AS sleepDay
ON
  dailyActivity.Id = sleepDay.Id
  AND dailyActivity.ActivityDate = sleepDay.SleepDay
WHERE
  TotalSteps > 0
;

### Distinct Dates after Inner Join dailyActivity and sleepDay ###
SELECT
  COUNT(DISTINCT(dailyActivity.ActivityDate)) AS distinctDate1,
  COUNT(DISTINCT(sleepDay.SleepDay)) AS distinctDate2
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
  dailyActivity.Id
;

### Min/Max/Average Sleep Grouped by Days after Inner Join dailyActivity and sleepDay ###
SELECT
  EXTRACT(DAYOFWEEK FROM DATE(ActivityDate)) AS Day,
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

### Average Sleep after Inner Join dailyActivity and sleepDay ###
SELECT
  AVG(TotalMinutesAsleep) AS AvgSleep
FROM
  FitBit.dailyActivity AS dailyActivity
INNER JOIN
  FitBit.sleepDay AS sleepDay
ON
  dailyActivity.Id = sleepDay.Id
  AND dailyActivity.ActivityDate = sleepDay.SleepDay
WHERE
  TotalSteps > 0
;

### Total Steps and Total Time Asleep per Day ###
SELECT
  dailyActivity.Id,
  ActivityDate,
  TotalSteps,
  TotalMinutesAsleep
FROM
  FitBit.dailyActivity AS dailyActivity
INNER JOIN
  FitBit.sleepDay AS sleepDay
ON
  dailyActivity.Id = sleepDay.Id
  AND dailyActivity.ActivityDate = sleepDay.SleepDay
WHERE
  TotalSteps > 0
;

### Sedentary Minutes and Total Time Asleep ###
SELECT
  dailyActivity.SedentaryMinutes,
  sleepDay.TotalMinutesAsleep,
  dailyActivity.SedentaryMinutes + dailyActivity.LightlyActiveMinutes + dailyActivity.FairlyActiveMinutes + dailyActivity.VeryActiveMinutes AS TotalActiveMinutes
FROM
  FitBit.dailyActivity AS dailyActivity
INNER JOIN
  FitBit.sleepDay AS sleepDay
ON
  dailyActivity.Id = sleepDay.Id
  AND dailyActivity.ActivityDate = sleepDay.SleepDay
WHERE
  TotalSteps > 0
;

### Lightly Active Minutes and Total Time Asleep ###
SELECT
dailyActivity.LightlyActiveMinutes,
  sleepDay.TotalMinutesAsleep,
  dailyActivity.SedentaryMinutes + dailyActivity.LightlyActiveMinutes + dailyActivity.FairlyActiveMinutes + dailyActivity.VeryActiveMinutes AS TotalActiveMinutes
FROM
  FitBit.dailyActivity AS dailyActivity
INNER JOIN
  FitBit.sleepDay AS sleepDay
ON
  dailyActivity.Id = sleepDay.Id
  AND dailyActivity.ActivityDate = sleepDay.SleepDay
WHERE
  TotalSteps > 0
;

### Fairly Active Minutes and Total Time Asleep ###
SELECT
  dailyActivity.FairlyActiveMinutes,
  sleepDay.TotalMinutesAsleep,
  dailyActivity.SedentaryMinutes + dailyActivity.LightlyActiveMinutes + dailyActivity.FairlyActiveMinutes + dailyActivity.VeryActiveMinutes AS TotalActiveMinutes
FROM
  FitBit.dailyActivity AS dailyActivity
INNER JOIN
  FitBit.sleepDay AS sleepDay
ON
  dailyActivity.Id = sleepDay.Id
  AND dailyActivity.ActivityDate = sleepDay.SleepDay
WHERE
  TotalSteps > 0 AND
  FairlyActiveMinutes > 0
;

### Very Active Minutes and Total Time Asleep ###
SELECT
  dailyActivity.VeryActiveMinutes,
  sleepDay.TotalTimeInBed - sleepDay.TotalMinutesAsleep AS TimeFallAsleep,
  dailyActivity.SedentaryMinutes + dailyActivity.LightlyActiveMinutes + dailyActivity.FairlyActiveMinutes + dailyActivity.VeryActiveMinutes AS TotalActiveMinutes
FROM
  FitBit.dailyActivity AS dailyActivity
INNER JOIN
  FitBit.sleepDay AS sleepDay
ON
  dailyActivity.Id = sleepDay.Id
  AND dailyActivity.ActivityDate = sleepDay.SleepDay
WHERE
  TotalSteps > 0 AND
  VeryActiveMinutes > 0
;

### Total Steps and Time to Fall Asleep ###
SELECT
  dailyActivity.TotalSteps,
  sleepDay.TotalTimeInBed - sleepDay.TotalMinutesAsleep AS TimeFallAsleep
FROM
  FitBit.dailyActivity AS dailyActivity
INNER JOIN
  FitBit.sleepDay AS sleepDay
ON
  dailyActivity.Id = sleepDay.Id
  AND dailyActivity.ActivityDate = sleepDay.SleepDay
WHERE
  TotalSteps > 0
;

### Sedentary Minutes and Time to Fall Asleep ###
SELECT
  dailyActivity.SedentaryMinutes,
  sleepDay.TotalTimeInBed - sleepDay.TotalMinutesAsleep AS TimeFallAsleep,
  dailyActivity.SedentaryMinutes + dailyActivity.LightlyActiveMinutes + dailyActivity.FairlyActiveMinutes + dailyActivity.VeryActiveMinutes AS TotalActiveMinutes
FROM
  FitBit.dailyActivity AS dailyActivity
INNER JOIN
  FitBit.sleepDay AS sleepDay
ON
  dailyActivity.Id = sleepDay.Id
  AND dailyActivity.ActivityDate = sleepDay.SleepDay
WHERE
  TotalSteps > 0
;

### Lightly Active Minutes and Time to Fall Asleep ###
SELECT
  dailyActivity.LightlyActiveMinutes,
  sleepDay.TotalTimeInBed - sleepDay.TotalMinutesAsleep AS TimeFallAsleep.
  dailyActivity.SedentaryMinutes + dailyActivity.LightlyActiveMinutes + dailyActivity.FairlyActiveMinutes + dailyActivity.VeryActiveMinutes AS TotalActiveMinutes
FROM
  FitBit.dailyActivity AS dailyActivity
INNER JOIN
  FitBit.sleepDay AS sleepDay
ON
  dailyActivity.Id = sleepDay.Id
  AND dailyActivity.ActivityDate = sleepDay.SleepDay
WHERE
  TotalSteps > 0
;

### Fairly Active Minutes and Time to Fall Asleep ###
SELECT
  dailyActivity.FairlyActiveMinutes,
  sleepDay.TotalTimeInBed - sleepDay.TotalMinutesAsleep AS TimeFallAsleep.
  dailyActivity.SedentaryMinutes + dailyActivity.LightlyActiveMinutes + dailyActivity.FairlyActiveMinutes + dailyActivity.VeryActiveMinutes AS TotalActiveMinutes
FROM
  FitBit.dailyActivity AS dailyActivity
INNER JOIN
  FitBit.sleepDay AS sleepDay
ON
  dailyActivity.Id = sleepDay.Id
  AND dailyActivity.ActivityDate = sleepDay.SleepDay
WHERE
  TotalSteps > 0
;

### Very Active Minutes and Time to Fall Asleep ###
SELECT
  dailyActivity.VeryActiveMinutes,
  sleepDay.TotalTimeInBed - sleepDay.TotalMinutesAsleep AS TimeFallAsleep.
  dailyActivity.SedentaryMinutes + dailyActivity.LightlyActiveMinutes + dailyActivity.FairlyActiveMinutes + dailyActivity.VeryActiveMinutes AS TotalActiveMinutes
FROM
  FitBit.dailyActivity AS dailyActivity
INNER JOIN
  FitBit.sleepDay AS sleepDay
ON
  dailyActivity.Id = sleepDay.Id
  AND dailyActivity.ActivityDate = sleepDay.SleepDay
WHERE
  TotalSteps > 0




