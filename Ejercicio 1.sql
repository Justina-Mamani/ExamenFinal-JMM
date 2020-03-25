-- Ejercicio 1
-- a) Mostrar los nombres de los clientes donde su tarjeta de credito contenga la palabra 'ins'.
SELECT distinct first_name FROM foody.customer 
inner join foody.payment_details on customer.customer_id = payment_details.customer_id 
where payment_details.card_holder_name like '%ins%';