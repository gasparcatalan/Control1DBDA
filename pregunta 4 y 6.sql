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
limit 1

--Pregunta 6
--El vendedor con más ventas por mes

select distinct v.nombre, 
	v.apellido, 
	extract(month from ve.fecha) as mes, 
	extract(year from ve.fecha) as año,
	count(distinct ve.id_venta)
from venta ve,
	prod_venta pv,
	vendedor v
where ve.id_venta = pv.id_venta
and pv.id_vendedor = v.id_vendedor
group by v.nombre, v.apellido, extract(month from ve.fecha), extract(year from ve.fecha)

-- resultado cercano al esperado, pero aun incorrecto