-- Ejercicio #3
-- c) Mostrar el status de las ordenes donde el costo del menu es mayor al promedio (promedio del costo de todos los menus).
SELECT AVG(price) as 'Promedio' from foody.menu;
SELECT order_id, order_status, price FROM foody.orders 
inner join foody.menu on menu.menu_id = orders.menu_id 
where price>(select avg(price) from foody.menu);
