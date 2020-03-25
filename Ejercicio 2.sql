-- Ejercicio 2
-- a) Obtener el pincode y nombre de los clientes con ordenes pagadas de forma online (ONLINE_PAYMENT).
SELECT distinct customer.customer_id,first_name FROM foody.customer
inner join foody.orders on customer.customer_id = orders.customer_id 
inner join foody.payment on orders.order_id = payment.order_id && payment.payment_type = 'ONLINE_PAYMENT';