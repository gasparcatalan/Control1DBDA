ALTER SEQUENCE comuna_id_comuna_seq RESTART WITH 1;
INSERT INTO public.comuna (nombre)
VALUES
    ('Las Condes'),
    ('Providencia'),
    ('Santiago'),
    ('La Florida'),
    ('Maipú');

ALTER SEQUENCE producto_id_producto_seq RESTART WITH 1;
INSERT INTO public.producto (nombre, precio)
VALUES
    ('Leche', 1000),
    ('Pan', 500),
    ('Arroz', 1200),
    ('Huevos', 800),
    ('Aceite', 2000);
	
ALTER SEQUENCE tipo_doc_id_doc_seq RESTART WITH 1;
INSERT INTO public.tipo_doc (tipo)
VALUES
	('Boleta'),
	('Factura');

ALTER SEQUENCE empleado_id_empleado_seq RESTART WITH 1;
INSERT INTO public.empleado (apellido, nombre, id_comuna, cargo)
VALUES
    ('González', 'Juan', 1, 'Vendedor'),
    ('Martínez', 'Carla', 2, 'Vendedor'),
    ('Rodríguez', 'Pedro', 3, 'Vendedor'),
    ('Fernández', 'María', 4, 'Vendedor'),
    ('García', 'Luis', 5, 'Vendedor'),
    ('Diaz', 'Fernando', 1, 'Gerente'),
    ('Lopez', 'Francisco', 2, 'Auxiliar'),
	('Gomez', 'Felipe', 3, 'Guardia'),
	('Garcia', 'Fernanda', 4, 'Gerente'),
	('Moreira', 'Ignacio', 5, 'Auxiliar');

ALTER SEQUENCE vendedor_id_vendedor_seq RESTART WITH 1;
INSERT INTO public.vendedor (id_empleado, nombre, apellido)
VALUES
    (1, 'Juan', 'González'),
    (2, 'Carla', 'Martínez'),
    (3, 'Pedro', 'Rodríguez'),
    (4,'María', 'Fernández'),
    (5, 'Luis','García');

ALTER SEQUENCE sueldo_id_sueldo_seq RESTART WITH 1;
INSERT INTO public.sueldo ( id_empleado, total, fecha)
VALUES
	(1,300000,'2020-08-06'),
	(2,500000,'2020-08-07'),
	(3,400000,'2021-08-05'),
	(4,300000,'2022-08-06'),
	(5,400000,'2023-08-07');
	
ALTER SEQUENCE tienda_id_tienda_seq RESTART WITH 1;
INSERT INTO public.tienda (id_comuna, nombre)
VALUES
	(1,'Mall Plaza Condes'),
	(2,'Mall Plaza Providencia'),
	(3,'Parque Santiago'),
	(4,'Parque La florida'),
	(5,'Centro Maipu');

ALTER SEQUENCE venta_id_venta_seq RESTART WITH 1;
INSERT INTO public.venta (id_tienda, total, id_tipo_doc, fecha)
VALUES
    (1, 1500, 1, '2020-02-04'),
    (2, 2200, 2, '2020-02-04'),
    (3, 1800, 1, '2021-03-11'),
    (4, 5000, 2, '2021-03-11'),
    (5, 3000, 1, '2020-06-17'),
    (2, 1250, 2, '2020-06-17'),
    (5, 2300, 2, '2020-08-25'),
    (3, 1870, 1, '2020-08-25'),
    (3, 8000, 1, '2020-09-12'),
    (4, 3500, 1, '2020-09-12');

ALTER SEQUENCE tienda_emp_id_tienda_emp_seq RESTART WITH 1;
INSERT INTO public.tienda_emp(id_tienda, id_empleado)
VALUES
	(1,1),
	(1,2),
	(2,3),
	(2,4),
	(3,5),
	(3,6),
	(4,7),
	(4,8),
	(5,9),
	(5,10);

ALTER SEQUENCE prod_venta_id_prod_venta_seq RESTART WITH 1;
INSERT INTO public.prod_venta(id_producto, id_venta, id_vendedor)
VALUES
	(4, 1, 3),
	(3, 1, 3),
	(2, 2, 2),
	(1, 2, 2),
	(1, 2, 2),
	(2, 2, 2),
	(4, 3, 4),
	(4, 5, 5),
	(3, 5, 5),
	(1, 6, 4),
	(5, 6, 4),
	(5, 7, 1),
	(2, 7, 1),
	(1, 8, 2),
	(2, 9, 1),
	(3,10, 1);