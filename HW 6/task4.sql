--1
SELECT cust_name
FROM restbill b
JOIN reststaff s
ON b.waiter_no = s.staff_no
WHERE b.bill_total > 450.00 AND s.headwaiter = 10;

--2
SELECT h.first_name, h.surname 
FROM reststaff s
INNER JOIN reststaff h ON s.headwaiter = h.staff_no
JOIN restbill b ON s.staff_no = b.waiter_no
WHERE b.cust_name LIKE 'Nerida%' 
AND b.bill_date = '160111'
AND s.headwaiter = h.staff_no;

--3
SELECT cust_name, bill_total
FROM restbill
WHERE bill_total < 200
ORDER BY bill_total ASC;

--4
SELECT first_name, surname
FROM reststaff
LEFT JOIN restbill ON restbill.waiter_no = reststaff.staff_no
WHERE restbill.waiter_no IS NULL;

--5
SELECT cust_name, h.first_name, h.surname, room_name
FROM restbill
JOIN reststaff s ON restbill.waiter_no = s.staff_no
JOIN restrest_table ON restbill.table_no = restrest_table.table_no
INNER JOIN reststaff h ON s.headwaiter = h.staff_no

WHERE bill_total = (
    SELECT MAX(bill_total)
    FROM restbill
)
AND s.headwaiter = h.staff_no;



