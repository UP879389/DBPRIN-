
Queries
1. For the Card table decrypt and encrypt the CVC number for Payment ID 5576.


SELECT aes_decrypt(Last_3_Digit, SHA2('secret passphrase',512)) as CVC from Card where Payment_ID = 5576;
SELECT aes_encrypt(Last_3_Digit, SHA2('secret passphrase',512)) as CVC from Card where Payment_ID = 5576;


2. Crazy Cats would like to know what and where their most popular sales time is, this can
help managers offer deals and plan for staffing.

SELECT Transaction.Transaction_ID,Venue.Venue_ID, Transaction.Transaction_Time, count(distinct Transaction_Time) as number_of_transactions
FROM Transaction
INNER JOIN Venue on Venue.Venue_ID = Transaction.Venue_ID
ORDER BY number_of_transactions ASC limit 1;

3. The Crazy Cat pub chain will be closed for a week for training, in the week commencing on
03/14, find all the staff working on those days to give them time off.

SELECT Shift.Shift_ID, Shift.Shift_Start_Time, Staff_Shift.Staff_ID
FROM Shift
INNER JOIN Staff_Shift on Shift.Shift_ID = Staff_Shift.Shift_ID
WHERE Shift_Start_Time between '2019-03-09' AND '2019-03-14';


4. It's Crazy Cats pub 50 year anniversary!To celebrate we are offering all our loyalty
cardholders that have been with us for the past 10 years a 100 point bonus.

UPDATE Loyalty_Card
SET  Points = Points + 100
WHERE Start_Date BETWEEN '2010/01/01' AND '2019/06/01';


5. The head office at Crazy Cat would like to congratulate their best pub venues.
Find the pubs that have the top ten sales.

SELECT Venue.Venue_ID, Venue.Venue_Name, Venue.Venue_City, ROUND(AVG(Transaction_Price),1) as average_sales
FROM Transaction
INNER JOIN Venue on Venue.Venue_ID = Transaction.Venue_ID
GROUP BY Venue_ID
ORDER BY avg(Transaction_Price) desc limit 10;
