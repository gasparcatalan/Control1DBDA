-- 1) Producto mas vendido por mes el 2021
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

-- 2) Producto mas economico por tienda
SELECT DISTINCT ON (tabla.nombre_tienda) tabla.nombre_tienda, p2.nombre, MIN(tabla.precio) as precio
FROM(
	SELECT t.nombre AS nombre_tienda, p.nombre AS producto, p.precio as precio
	FROM tienda t, venta v, prod_venta pv, producto p
	WHERE t.id_tienda = v.id_tienda AND p.id_producto = pv.id_producto AND pv.id_venta = v.id_venta
	GROUP BY nombre_tienda, producto, precio
	ORDER BY nombre_tienda, precio ASC
	)tabla,
	producto p2
WHERE p2.nombre = tabla.producto
GROUP BY tabla.nombre_tienda, p2.nombre;
-- Obtiene los precios mayores por tienda xd
-- Falta tomar la fila con el menor de precio por tienda

