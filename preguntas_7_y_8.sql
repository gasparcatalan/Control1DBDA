-- Pregunta 7
-- el vendedor que ha recaudado más dinero para la tienda por año

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
-- el vendedor con más productos vendidos por tienda
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