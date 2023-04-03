-- Pregunta 1
-- Producto mas vendido por mes el 2021
SELECT DISTINCT ON (tabla.mes) tabla.mes, p2.nombre
FROM(
	SELECT p.nombre as producto, COUNT(p.nombre) as veces_comprado, EXTRACT (MONTH FROM v.fecha) as mes
	FROM producto p, prod_venta pv, venta v
	WHERE v.id_venta = pv.id_venta AND p.id_producto = pv.id_producto
	AND EXTRACT (YEAR FROM v.fecha) = 2021 -- Todos los productos comprados el 2021
	GROUP BY producto, mes
	ORDER BY veces_comprado DESC
	)tabla,
	producto p2
WHERE p2.nombre = tabla.producto
GROUP BY p2.nombre, tabla.mes;


-- Pregunta 2
-- Producto mas economico por tienda
SELECT DISTINCT ON (tabla.nombre_tienda) tabla.nombre_tienda,
    tabla.producto,
    MIN(tabla.precio)
FROM(
    SELECT t.nombre AS nombre_tienda, p.nombre AS producto, p.precio as precio
    FROM tienda t, venta v, prod_venta pv, producto p
    WHERE t.id_tienda = v.id_tienda AND p.id_producto = pv.id_producto AND pv.id_venta = v.id_venta
    GROUP BY nombre_tienda, producto, precio
    ORDER BY nombre_tienda, precio ASC
    )tabla,
    producto p2
GROUP BY tabla.nombre_tienda, tabla.producto;


-- Pregunta 3
-- Ventas por mes, separadas entre Boletas y Facturas
select tc.tipo, extract(month from v.fecha), count(*) as ventas_mes 
from venta v, tipo_doc tc
where v.id_tipo_doc = tc.id_doc
group by v.fecha, tc.tipo
order by v.fecha asc;


--Pregunta 4
--Empleado que gano mas por tienda 2020, indicando la comuna donde vive y el cargo
--que tiene en la empresa
select e.nombre, e.apellido, c.nombre, e.cargo
from empleado e,
	comuna c,
	sueldo s
where e.id_comuna = c.id_comuna
and e.id_empleado = s.id_empleado
and s.fecha >= '2020-01-01'
and s.fecha < '2021-01-01'
order by s.total desc
limit 1;


-- Pregunta 5: 
-- La tienda que tiene menos empleados
select t.nombre, count(*) as cant_empleados
from tienda t, tienda_emp te
where t.id_tienda = te.id_tienda
group by t.nombre
order by cant_empleados asc
limit 1;


--Pregunta 6
--El vendedor con mas ventas por mes
SELECT DISTINCT ON (t.mes) t.mes, t.año, v.nombre, v.apellido
FROM(
	select distinct v.nombre as nombre, v.apellido as apellido, count(distinct ve.id_venta) as ventas,
		extract(month from ve.fecha) as mes, 
		extract(year from ve.fecha) as año
	from venta ve, prod_venta pv, vendedor v
	where ve.id_venta = pv.id_venta	and pv.id_vendedor = v.id_vendedor
	group by nombre, apellido, mes, año
	) t,
	vendedor v
where t.nombre = v.nombre
group by v.nombre, v.apellido, t.mes, t.año;

-- resultado no es el esperado, pero contiene un acercamiento a la informacion buscada


-- Pregunta 7
-- el vendedor que ha recaudado mas dinero para la tienda por ano
SELECT v.nombre, td.nombre, SUM(total) as total_recaudado, 
		extract(year from vn.fecha) as anio
FROM vendedor v, tienda td, venta vn, tienda_emp tdemp
WHERE v.id_empleado = tdemp.id_empleado
AND tdemp.id_tienda = td.id_tienda
AND td.id_tienda = vn.id_tienda
GROUP BY v.nombre, td.nombre, anio
ORDER BY anio, total_recaudado DESC;

-- A veces se repiten tiendas, pero es porque hay 2 vendedores que recaudaron lo mismo


-- Pregunta 8
-- el vendedor con mas productos vendidos por tienda
SELECT  DISTINCT ON (data1.nombre_tienda)
	v2.nombre as nombre_vendedor, data1.nombre_tienda, MAX(data1.ventas_totales) AS productos_vendidos
FROM(
	SELECT pv.id_vendedor as id_vend, td.nombre as nombre_tienda, 
			COUNT(*) as ventas_totales
	FROM prod_venta pv, empleado emp, tienda td, tienda_emp tdemp
	WHERE pv.id_vendedor = emp.id_empleado
	AND tdemp.id_empleado = emp.id_empleado
	AND tdemp.id_tienda = td.id_tienda
	GROUP BY pv.id_vendedor,td.nombre
	ORDER BY ventas_totales DESC
	)data1,
	vendedor v2
WHERE v2.id_vendedor = data1.id_vend
GROUP BY data1.nombre_tienda, v2.nombre
ORDER BY data1.nombre_tienda, productos_vendidos DESC;


-- Pregunta 9
-- el empleado con mayor sueldo por mes
SELECT e.*, s.total FROM empleado e
JOIN sueldo s ON  s.id_empleado = e.id_empleado
where s.total =(SELECT MAX(total) FROM SUELDO);


-- PREGUNTA 10
-- la tienda que con menor recaudacion por mes
SELECT t.id_tienda, t.nombre, SUM(v.total) AS total_venta 
FROM tienda t
JOIN venta v ON v.id_tienda = t.id_tienda
GROUP BY t.id_tienda, t.nombre
-- De aqui hacia abajo es para obtener la tienda con mas recaudacion de ventas
ORDER BY total_venta DESC
LIMIT 1;