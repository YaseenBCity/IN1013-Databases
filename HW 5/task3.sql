--1
SELECT DISTINCT first_name, surname 
FROM restbill
INNER JOIN reststaff
WHERE restbill.cust_name = 'Tanya Singh';

--2
SELECT DISTINCT bill_date
FROM restbill
INNER JOIN restroom_management
WHERE room_name = 'Green' 
AND headwaiter ='10'
AND bill_date LIKE '1602%';

--3
SELECT first_name, surname
FROM reststaff
WHERE headwaiter IN (
	SELECT headwaiter
	FROM reststaff
	WHERE first_name ='Zoe'
	AND surname ='Ball');

--4
SELECT DISTINCT cust_name, bill_total, reststaff.first_name, reststaff.surname
FROM restbill
INNER JOIN reststaff
WHERE restbill.waiter_no = reststaff.staff_no
ORDER BY bill_total DESC;

--5
SELECT first_name, surname 
FROM reststaff
INNER JOIN restbill 
ON waiter_no = staff_no
WHERE bill_no ='14' OR bill_no = '17';

--6
SELECT DISTINCT
    w.first_name, w.surname, h.first_name, h.surname 
FROM reststaff w
INNER JOIN restbill b ON w.staff_no = b.waiter_no
INNER JOIN restrest_table t ON b.table_no = t.table_no
INNER JOIN reststaff h ON w.headwaiter = h.staff_no
WHERE
    b.bill_date = '160312'
    AND t.room_name = 'Blue';
