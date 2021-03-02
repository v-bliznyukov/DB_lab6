EXPLAIN ANALYZE
--select the total amount and the store id
SELECT store_id, SUM(amount) 
FROM (SELECT *
	  --table with payment connected to a particular store
FROM (payment LEFT JOIN staff ON staff.staff_id=payment.staff_id)
WHERE
	  --choose payments for the last month
    date_trunc('month', payment_date) IN (SELECT date_trunc('month', max(payment_date)) FROM payment)) as last_payment
GROUP BY store_id
ORDER BY sum DESC;

--HERE THE SORTING IS THE COSTS THE MOST, AGAIN INDEXING CAN HELP (FOR EXAMPLE, SORTIGN WITH B TREE SEARCH IS LOG(2))

--I didn't quite got the idea of the 'greater amount' in the task, so Ive just sorted by the earned money in the last month)) 
