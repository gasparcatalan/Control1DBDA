/* Pregunta 9*/

SELECT e.*, s.total FROM empleado e
 JOIN sueldo s ON  s.id_empleado = e.id_empleado
 where s.total =(SELECT MAX(total) FROM SUELDO);
 
/*PREGUNTA 10*/
SELECT t.id_tienda, t.nombre, SUM(v.total) as total_venta FROM tienda t
	join venta v ON v.id_tienda = t.id_tienda
GROUP BY t.id_tienda, t.nombre
/*De aqui hacia abajo es para obtener la tienda con más recaudación de ventas*/
ORDER BY total_venta DESC
LIMIT 1;
 
 
 