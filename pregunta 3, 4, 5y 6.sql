-- Pregunta 3
-- Ventas por mes, separadas entre Boletas y Facturas
select tc.tipo, extract(month from v.fecha), count(*) as ventas_mes 
from venta v, tipo_doc tc
where v.id_tipo_doc = tc.id_doc
group by v.fecha, tc.tipo
order by v.fecha asc;

--Pregunta 4
--Empleado que ganó más por tienda 2020, indicando la comuna donde vive y el cargo
--que tiene en la empresa

select e.nombre, e.apellido, c.nombre, e.cargo
from empleado e,
	comuna c,
	sueldo s
where e.id_comuna = c.id_comuna
and e.id_empleado = s.id_empleado
and s.fecha >= '2020-01-01 '
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
--El vendedor con más ventas por mes

select v.nombre, v.apellido, 
	extract(month from ve.fecha), 
	extract(year from ve.fecha), 
	count(distinct ve.id_venta) as ventas
from vendedor v,
	prod_venta pv,
	venta ve
where v.id_vendedor = pv.id_vendedor
and pv.id_venta = ve.id_venta
group by v.id_vendedor, extract(month from ve.fecha), extract(year from ve.fecha)
order by count(distinct ve.id_venta) desc


-- resultado cercano al esperado, pero aun incorrecto
