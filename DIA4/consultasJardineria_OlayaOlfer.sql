use jardineria;
-- 1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas
select codigo_oficina, ciudad from oficina;

-- 2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España.
SELECT ciudad, telefono FROM oficina WHERE ciudad LIKE '%España%';

-- 3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.
select  nombre, apellido1, apellido2, email from empleado where codigo_jefe =7;

-- 4. Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.
select codigo_jefe, codigo_empleado, puesto from empleado; -- para saber que puesto hay y nombre
select puesto, nombre, apellido1, apellido2, email from empleado where puesto like '%Director General%';

-- 5. Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas.
select nombre, apellido1, apellido2 from empleado where puesto like '%Representante Ventas%';

-- 6. Devuelve un listado con el nombre de los todos los clientes españoles.
select nombre_cliente, pais from cliente;
select nombre_cliente from cliente where pais like '%Spain%';

-- 7. Devuelve un listado con los distintos estados por los que puede pasar un pedido.
select estado from pedido;
SELECT DISTINCT estado FROM pedido; -- distinct elimina valores duplicados

-- 8. Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos
-- funcion year
SELECT DISTINCT codigo_cliente FROM pago WHERE YEAR(fecha_pago) = 2008;
-- funcion date_format
select fecha_pago from pago;
select distinct codigo_cliente from pago where date_format(fecha_pago,'%Y') ='2008';
-- funcion otra
select distinct codigo_cliente from pago where fecha_pago like '2008%'; -- el % (al final) indica que quiero que la bsuqueda empiece por 2008 y despues de eso no me importa el resto
 
 -- 9. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.
 SELECT codigo_pedido, fecha_esperada, fecha_entrega FROM pedido WHERE fecha_entrega > fecha_esperada;
 
 -- 10. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada
 -- ADDDATE 
 select codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega from pedido where adddate(fecha_esperada, interval -2 day)= fecha_entrega;
 -- DATEDIFF
 select codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega from pedido WHERE DATEDIFF(fecha_esperada, fecha_entrega) = 2;
 -- otra
 SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega  FROM pedido WHERE fecha_esperada - 2 = fecha_entrega; -- resta 2 a la fecha e iguala con entrega
 
 -- 10 Devuelve un listado de todos los pedidos que fueron en 2009.
 select * from pedido where fecha_pedido like '2009%';
 
 -- 11. Devuelve un listado de todos los pedidos que han sido  en el mes de enero de cualquier año
 select * from pedido where month(fecha_pedido)=1;
 
 -- 12. Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. Ordene el resultado de mayor a menor

 select * from pago where forma_pago like '%PayPal%' and fecha_pago like '2008%';
 
 -- 13. Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. Tenga en cuenta que no deben aparecer formas de pago repetidas.
 select distinct forma_pago from pago;
 
 -- 14. Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y que tienen más de 100 unidades en stock. El listado deberá estar ordenado por su precio de venta, mostrando en primer lugar los de mayor precio.
 select *  from producto where gama like '%ornamentales%' and cantidad_en_stock >= 100 order by precio_venta desc;
 
 -- 15. Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo representante de ventas tenga el código de empleado 11 o 30.
 select * from cliente where ciudad like 'Madrid' and  (codigo_empleado_rep_ventas = 11 OR codigo_empleado_rep_ventas = 30);
 
 -- ############################ CONSULTAS MULTITABLA########################
 -- 1. Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.
 select C.nombre_cliente, E.nombre, E.apellido1 from cliente C inner join empleado E on E.codigo_empleado = C.codigo_empleado_rep_ventas;
 
 -- 2. Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.
 select C.nombre_cliente, P.forma_pago, E.nombre from cliente C 
 inner join pago P on P.codigo_cliente = C.codigo_cliente
 inner join empleado E on E.codigo_empleado= C.codigo_empleado_rep_ventas;
 
 -- 3. Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
 select C.nombre_cliente, P.forma_pago, E.nombre, O.ciudad from cliente C 
 inner join pago P on P.codigo_cliente = C.codigo_cliente
 inner join empleado E on E.codigo_empleado= C.codigo_empleado_rep_ventas
 inner join oficina O on O.codigo_oficina= E.codigo_oficina;
 
 -- 4. Devuelve el nombre de los clientes que  hayan hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.
 select C.nombre_cliente, C.ciudad, P.forma_pago, E.nombre, O.ciudad, O.linea_direccion1 from cliente C 
 inner join pago P on P.codigo_cliente = C.codigo_cliente
 inner join empleado E on E.codigo_empleado= C.codigo_empleado_rep_ventas
 inner join oficina O on O.codigo_oficina= E.codigo_oficina
 where C.ciudad like 'Fuenlabrada';
 
 -- 5. Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
  select C.nombre_cliente, E.nombre, E.apellido1, O.linea_direccion1 from cliente C 
  inner join empleado E on E.codigo_empleado = C.codigo_empleado_rep_ventas
  inner join oficina O on O.codigo_oficina= E.codigo_oficina;
  
  -- 6. Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.
 select E.nombre as nombreEmpleado, E2.nombre as nombreJefe from empleado E 
 inner join empleado E2 on E.codigo_jefe = E2.codigo_empleado;
 
 -- 7. Devuelve un listado que muestre el nombre de cada empleados, el nombre de su jefe y el nombre del jefe de sus jefe.
 
 
 -- 8. Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.
 select C.nombre_cliente as nombreCliente from pedido P
 inner join cliente C on P.codigo_cliente=C.codigo_cliente
 inner join detalle_pedido D on D.codigo_pedido=P.codigo_pedido
 where DATEDIFF(P.fecha_esperada , P.fecha_entrega) <0;
 
 -- 9. Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.
 select C.nombre_cliente,G.gama from cliente C
 inner join pedido P on P.codigo_cliente=C.codigo_cliente
 inner join detalle_pedido D on D.codigo_pedido=P.codigo_pedido
 inner join producto Pr on Pr.codigo_producto = D.codigo_producto
 inner join gama_producto G on G.gama = Pr.gama;
 
 
 






