/* IDEAS */

/*
Top 5 and bottom 5 donor job fields
Top 5 and bottom 5 donor states
Daily, weekly, monthly, yearly and null frequency totals
States and job fields with highest frequency totals
States and job fields with lowest frequency totals
Top 5 donors and their donation frequency and bottom 5
How many donors in each state
How many donors per job field
*/



1.
SELECT job_field, SUM(donation) AS job_field_total
FROM Donation_Data
GROUP BY job_field
ORDER BY SUM(donation) DESC
LIMIT 5;

SELECT job_field, SUM(donation) AS job_field_total
FROM Donation_Data
GROUP BY job_field
ORDER BY SUM(donation)
LIMIT 5;


2.
SELECT state, SUM(donation) AS state_total
FROM Donation_Data
GROUP BY state
ORDER BY SUM(donation) DESC
LIMIT 5;

SELECT state, SUM(donation) AS state_total
FROM Donation_Data
GROUP BY state
ORDER BY SUM(donation)
LIMIT 5;

3.
SELECT donation_frequency, SUM(donation) AS total_by_frequency, COUNT(*) AS donation_frequency_count
FROM Donation_Data
JOIN Donor_Data2 
ON Donation_Data.id = Donor_Data2.id
GROUP BY donation_frequency
ORDER BY SUM(donation) DESC;

4.
/* Number of donors per donation frequency in top 5 donation states*/

SELECT state, donation_frequency, COUNT(*) AS num_of_donors
FROM Donation_Data
JOIN Donor_Data2 
ON Donation_Data.id = Donor_Data2.id
WHERE state = 'California' OR state = 'Texas' OR state = 'Florida' 
OR state = 'New York' OR state = 'Virginia'
GROUP BY donation_frequency, state
ORDER BY state, COUNT(*) DESC;

5.
/* Top 5 weekly, monthly, yearly and one off donors */

SELECT first_name, last_name, email, job_field, state, donation, donation_frequency
FROM Donation_Data
JOIN Donor_Data2 
ON Donation_Data.id = Donor_Data2.id
WHERE donation_frequency = 'Weekly'
ORDER BY donation DESC
LIMIT 5;

SELECT first_name, last_name, email, job_field, state, donation, donation_frequency
FROM Donation_Data
JOIN Donor_Data2 
ON Donation_Data.id = Donor_Data2.id
WHERE donation_frequency = 'Monthly'
ORDER BY donation DESC
LIMIT 5;

SELECT first_name, last_name, email, job_field, state, donation, donation_frequency
FROM Donation_Data
JOIN Donor_Data2 
ON Donation_Data.id = Donor_Data2.id
WHERE donation_frequency = 'Yearly'
ORDER BY donation DESC
LIMIT 5;

SELECT first_name, last_name, email, job_field, state, donation, donation_frequency
FROM Donation_Data
JOIN Donor_Data2 
ON Donation_Data.id = Donor_Data2.id
WHERE donation_frequency = 'Once'
ORDER BY donation DESC
LIMIT 5;


