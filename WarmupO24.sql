--Question 1
SELECT AVG(amount), stddev_pop(amount)
FROM payment;
 
Average 4.20. standard deviation: 2.37

--Question 2
SELECT staff_id,  AVG(amount), stddev_pop(amount)
FROM payment
GROUP BY staff_id;

staff 1 Average: 4.15 standard deviation 2.37
staff 2 Average: 4.25 standard deviation 2.37

Their standard deviations are virtually the same so I do not think there is a meaningful difference.

--Question 3
with  customer_prob as (SELECT customer_id, AVG(amount), stddev_pop(amount) as standard
FROM payment
GROUP BY customer_id)
SELECT * 
FROM customer_prob
Having standard = (SELECT MAX(standard) FROM payment);

--Question 4
with purchase_count AS (SELECT customer_id, count(customer_id) as cust_count
FROM payment
GROUP BY customer_id)
SELECT AVG(cust_count), stddev_pop(cust_count)
FROM purchase_count;