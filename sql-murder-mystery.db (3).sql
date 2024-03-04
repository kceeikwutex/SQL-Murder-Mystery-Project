--The description of the type of crime, date and location as mentioned in the description of the question.
SELECT *
FROM crime_scene_report
where type = 'murder'AND city = 'SQL City' AND date = '20180115'

--After getting the description of the crime, two witnesses need to be found based on the description on the crime scene report.

-- witness 1 that lives on the last house on his street, to get his id, license id and ssn 
select *, max(address_number)
from person
where address_street_name = 'Northwestern Dr'
-- Atternative to finding witness 1
SELECT *
FROM person
where address_street_name = 'Northwestern Dr';

SELECT *
FROM person
WHERE address_street_name = 'Northwestern Dr'
ORDER BY address_number DESC
LIMIT 1;

--witness 2, her name was stated with her street name to get her id, license id and ssn
select *
from person
where name like 'Annabel%' and address_street_name = 'Franklin Ave'

--My witnesses are Morty Schapiro and Annabel Miller. Then proceed to listen to their transcript when they were interviewed
--witness 1
SELECT *
FROM interview
WHERE person_id = '14887'
--witness 2
SELECT *
FROM interview
WHERE person_id = '16371'

--witness 1 gave details pertaining to gym membership and plate number
SELECT *
FROM get_fit_now_member
WHERE id LIKE '48Z%' AND membership_status = 'gold'
--witness 2 saw him on a cerain date which we match with membership id
select *
from get_fit_now_check_in
where check_in_date = 20180109 and membership_id like '48z%'

--we have two suspect with almost similar gym id the person id was noted below
--SUSPECT 1, Gym_id 48Z7A, Person_id 28819
--SUSPECT 2, Gym_id 48Z55, Person_id 67318
--checking both suspect person_id to get License_id
select *
from person
where id = 28819
select *
from person
where id = 67318

---Suspect 1, 28819 - License_id = 173289
---Suspect 2, 67318 - License_id = 423327

--Searching for plate number
select *
from drivers_license
where plate_number like '%H42W%'
--Suspect 2 with person_id 67318 match with license_id 2 - 423327 in the name of JEREMY BOWERS.
--JEREMY BOWERS is the murderer

--questioned and interogated the murderer
select *
from interview
where person_id = 67318

--he was hired by a woman, she's around 5'5(65) or 5'7(67)
--she has red hair and she drives a tesla model
--i know that she attended the SQL Symphony Concert 3 times in december 2017

SELECT *
FROM drivers_license
where car_make like '%tesla%' and gender = 'female' and hair_color = 'red'

--Got 3 License_id to check her information from the person table
SELECT *
FROM person
WHERE license_id in (918773, 291182, 202298)

--to confirm we note the person id and search her facebook_event_checkin if she attended the SQL symphony concert
SELECT * 
FROM facebook_event_checkin
WHERE person_id in (78881, 90700, 99716)

--only one ID  appeared 3 times, search and identify the ID
SELECT *
FROM person
WHERE id = 99716

--MIRANDA PRIESTLY is the rich woman who sent JEREMY BOWERS for the murder........
