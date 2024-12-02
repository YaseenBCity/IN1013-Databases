--1
CREATE VIEW samsBills AS
SELECT s.first_name, s.surname, b.bill_date, b.cust_name, b.bill_total
FROM reststaff s
JOIN restbill b ON s.staff_no = b.waiter_no
WHERE first_name = 'Sam' AND surname = 'Pitt';

--2
SELECT *
FROM samsBills
WHERE bill_total > 400;

--3
CREATE VIEW roomTotals AS
SELECT t.room_name, SUM(b.bill_total) AS total_sum
FROM restrest_table t
JOIN restbill b ON t.table_no = b.table_no
GROUP BY t.room_name;

--4

CREATE VIEW teamTotals AS
SELECT CONCAT(h.first_name, h.surname) AS headwaiter_name, SUM(b.bill_total) AS total_sum
FROM reststaff s
JOIN restbill b ON s.staff_no = b.waiter_no
JOIN reststaff h ON s.headwaiter = h.staff_no
GROUP BY headwaiter_name;