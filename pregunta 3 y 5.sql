-- Pregunta 3
-- Ventas por mes, separadas entre Boletas y Facturas
select tc.tipo, extract(month from v.fecha), count(*) as ventas_mes 
from venta v, tipo_doc tc
where v.id_tipo_doc = tc.id_doc
group by v.fecha, tc.tipo
order by v.fecha asc;

-- Pregunta 5: 
-- La tienda que tiene menos empleados

select t.nombre, count(*) as cant_empleados
from tienda t, tienda_emp te
where t.id_tienda = te.id_tienda
group by t.nombre
order by cant_empleados asc
limit 1;
