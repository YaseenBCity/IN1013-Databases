1--
SELECT first_name, surname, bill_date, COUNT(bill_no) 
FROM restbill
INNER JOIN reststaff ON restbill.waiter_no = reststaff.staff_no
GROUP BY first_name, surname, bill_date
HAVING COUNT(bill_no) > 2;


2--
SELECT room_name, SUM(no_of_seats)
FROM restrest_table
GROUP BY room_name
HAVING SUM(no_of_seats) > 6;


3--
SELECT room_name, COUNT(bill_no)
FROM restbill
JOIN restrest_table ON restbill.table_no = restrest_table.table_no
GROUP BY room_name;


4--
SELECT h.first_name, h.surname, SUM(b.bill_total) AS total_bill
FROM reststaff s
JOIN restbill b ON b.waiter_no = s.staff_no
JOIN reststaff h ON s.headwaiter = h.staff_no
GROUP BY h.first_name, h.surname
ORDER BY total_bill ASC;


5--
SELECT cust_name, AVG(bill_total) AS avgbill
FROM restbill
GROUP BY cust_name
HAVING AVG(bill_total) > 400
ORDER BY avgbill ASC;

6-- 
SELECT s.first_name, s.surname, COUNT(b.bill_no) AS billcount
FROM restbill b
JOIN reststaff s ON b.waiter_no = s.staff_no
GROUP BY s.first_name, s.surname
HAVING billcount > 3;