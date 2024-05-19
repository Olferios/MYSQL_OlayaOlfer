use taller4;
-- 1. Lista el primer apellido de todos los empleados.
select apellido1 from empleado;

-- 2. Lista el primer apellido de los empleados eliminando los apellidos que estén repetidos
select distinct(apellido1) from empleado;

-- 3. 3. Lista todas las columnas de la tabla empleado.
select * from empleado;

--  4. Lista el nombre y los apellidos de todos los empleados.
select nombre,apellido1, apellido2 from empleado;

-- 5. Lista el identificador de los departamentos de los empleados que aparecen en la tabla empleado.
select d.id from empleado e
right join departamento d on e.id_departamento=d.id
where e.id_departamento is not null;

-- 6. Lista el identificador de los departamentos de los empleados que aparecen en la tabla empleado, eliminando los identificadores que aparecen repetidos.
select distinct(d.id) from empleado e
right join departamento d on e.id_departamento=d.id
where e.id_departamento is not null;

-- 7. Lista el nombre y apellidos de los empleados en una única columna.
select concat(nombre,' ',apellido1,' ',apellido2) as nombreapellido from empleado;
-- 8. Lista el nombre y apellidos de los empleados en una única columna,convirtiendo todos los caracteres en mayúscula.
select upper(concat(nombre,' ',apellido1,' ',apellido2)) as nombreapellido from empleado;
-- 9. Lista el nombre y apellidos de los empleados en una única columna,convirtiendo todos los caracteres en minúscula.
select lower(concat(nombre,' ',apellido1,' ',apellido2)) as nombreapellido from empleado;
-- 10. Lista el identificador de los empleados junto al nif, pero el nif deberá aparecer en dos columnas, una mostrará únicamente los dígitos del nif y la otra la letra.
SELECT id, 
       CONCAT(SUBSTRING(nif, 1, 8)) AS nif_digitos, 
       SUBSTRING(nif, 9, 1) AS nif_letra 
FROM empleado;
-- 11. 
select nombre, (presupuesto-gastos) as presupuesto_actual from departamento;
-- 12.Lista el nombre de los departamentos y el valor del presupuesto actual ordenado de forma ascendente.
select nombre, (presupuesto-gastos) as presupuesto_actual from departamento
order by presupuesto_actual asc;
-- 13.Lista el nombre de todos los departamentos ordenados de forma ascendente.
select nombre from departamento
order by nombre asc;

-- 14. Lista el nombre de todos los departamentos ordenados de forma descendente.
select nombre from departamento
order by nombre desc;
-- 15. Lista los apellidos y el nombre de todos los empleados, ordenados de forma alfabética tendiendo en cuenta en primer lugar sus apellidos y luego su nombre. 
select apellido1, apellido2,nombre from empleado
order by apellido1, apellido2,nombre asc;
-- 16. 16. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen mayor presupuesto.
select nombre, presupuesto from departamento
order by presupuesto desc
limit 3;
-- 17. 17. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen menor presupuesto.
select nombre, presupuesto from departamento
order by presupuesto asc
limit 3;
-- 18. Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen mayor gasto.
select nombre, gastos from departamento
order by gastos desc
limit 2;
-- 19. 19. Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen menor gasto.
select nombre, gastos from departamento
order by gastos asc
limit 2;

-- 20. Devuelve una lista con 5 filas a partir de la tercera fila de la tabla empleado. Latercera fila se debe incluir en la respuesta. La respuesta debe incluir todas lascolumnas de la tabla empleado.
SELECT *FROM empleado
LIMIT 5 OFFSET 2;
-- 21.
select nombre, presupuesto from departamento
where presupuesto >= 150000;
-- 22. Devuelve una lista con el nombre de los departamentos y el gasto, de aquellos que tienen menos de 5000 euros de gastos.
select nombre, gastos from departamento
where gastos >= 5000;
-- 23. Devuelve una lista con el nombre de los departamentos y el presupuesto, deaquellos que tienen un presupuesto entre 100000 y 200000 euros. Sin utilizar el operador BETWEEN.
SELECT nombre, presupuesto FROM departamento
WHERE presupuesto >= 100000 AND presupuesto <= 200000;
-- 24. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre 100000 y 200000 euros. Sin utilizar el operador BETWEEN.
SELECT nombre FROM departamento
WHERE presupuesto < 100000 OR presupuesto > 200000;
-- 25. Devuelve una lista con el nombre de los departamentos que tienen un presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.
SELECT nombre FROM departamento
WHERE presupuesto BETWEEN 100000 AND 200000;
-- 26. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.
SELECT nombre FROM departamento
WHERE presupuesto NOT BETWEEN 100000 AND 200000;
-- 27. Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos departamentos donde los gastos sean mayores que el presupuesto del que disponen.
select nombre from departamento
where gastos> presupuesto;
-- 28. Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos departamentos donde los gastos sean menores que el presupuesto del que disponen.
select nombre from departamento
where gastos< presupuesto;
-- 29. Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos departamentos donde los gastos sean iguales al presupuesto del que disponen.
select nombre from departamento
where gastos =presupuesto;
-- 30. Lista todos los datos de los empleados cuyo segundo apellido sea NULL.
select * from empleado
where apellido2 is  null;
-- 31. Lista todos los datos de los empleados cuyo segundo apellido no sea NULL.
select * from empleado
where apellido2 is not null;
-- 32. Lista todos los datos de los empleados cuyo segundo apellido sea López.
select * from empleado
where apellido2 = 'López';
-- 33. Lista todos los datos de los empleados cuyo segundo apellidosea Díaz o Moreno. Sin utilizar el operador IN.
select * from empleado
where apellido2 = 'López' or apellido2='moreno';
-- 34. Lista todos los datos de los empleados cuyo segundo apellidosea Díaz o Moreno. Utilizando el operador IN.
select * from empleado
where apellido2 in ( 'Díaz', 'Moreno');
-- 35. Lista los nombres, apellidos y nif de los empleados que trabajan en eldepartamento 3.
select nombre, apellido1, apellido2, nif from empleado
where id_departamento=3;
-- 36. Lista los nombres, apellidos y nif de los empleados que trabajan en los departamentos 2, 4 o 5.
select nombre, apellido1, apellido2, nif from empleado
where id_departamento=2 or id_departamento=4 or id_departamento=5;

---------------------------------- Consultas multitabla----------------------------------
-- 1. Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno.
select * from empleado e
inner join departamento d on d.id=e.id_departamento;
-- 2. Devuelve un listado con los empleados y los datos de los departamentosdonde trabaja cada uno. Ordena el resultado, en primer lugar por el nombredel departamento (en orden alfabético) y en segundo lugar por los apellidosy el nombre de los empleados.
select * from empleado e
inner join departamento d on d.id=e.id_departamento
order by d.nombre asc;
-- 3. 3. Devuelve un listado con el identificador y el nombre del departamento,solamente de aquellos departamentos que tienen empleados.
select d.id, d.nombre from empleado e
right join departamento d on d.id= e.id_departamento
where e.id_departamento is not null;
-- 4. 
select d.id, d.nombre,(d.presupuesto - d.gastos) as presupuestoActual from empleado e
right join departamento d on d.id= e.id_departamento
where e.id_departamento is not null;

-- 5. Devuelve el nombre del departamento donde trabaja el empleado que tiene el nif 38382980M
select d.nombre from empleado e
inner join departamento d on d.id= e.id_departamento
where e.nif='38382980M';

-- 6. Devuelve el nombre del departamento donde trabaja el empleado Pepe Ruiz Santana.
select d.nombre from empleado e
inner join departamento d on d.id= e.id_departamento
where e.nombre ='Pepe' and e.apellido1='Ruiz' and e.apellido2='Santana';
-- 7. Devuelve un listado con los datos de los empleados que trabajan en el departamento de I+D. Ordena el resultado alfabéticamente.
select * from empleado e
inner join departamento d on d.id= e.id_departamento
where d.nombre='I+D'
order by e.nombre asc;

-- 8. Devuelve un listado con los datos de los empleados que trabajan en el departamento de Sistemas,Contabilidad o I+D. Ordena el resultado alfabéticamente.
select * from empleado e
inner join departamento d on d.id= e.id_departamento
where d.nombre ='sistemas' or d.nombre='contabilidad' or d.nombre='I+D'
order by e.nombre asc;

-- 9. Devuelve una lista con el nombre de los empleados que tienen los departamentos que no tienen un presupuesto entre 100000 y 200000 euros.
SELECT * FROM empleado e
INNER JOIN departamento d ON d.id = e.id_departamento
WHERE d.presupuesto NOT BETWEEN 100000 AND 200000;
-- 10. Devuelve un listado con el nombre de los departamentos donde existealgún empleado cuyo segundo apellido sea NULL. Tenga en cuenta que nodebe mostrar nombres de departamentos que estén repetidos.
SELECT (d.nombre)FROM empleado e
left JOIN departamento d ON d.id = e.id_departamento
where e.apellido2 is null;

-------------------------------------------- Consultas multitabla (Composición externa)----------------------------------------------------------
-- 1. Devuelve un listado con todos los empleados junto con los datos de losdepartamentos donde trabajan. Este listado también debe incluir losempleados que no tienen ningún departamento asociado.
SELECT *FROM empleado e
left JOIN departamento d ON d.id = e.id_departamento;

-- 2. Devuelve un listado donde sólo aparezcan aquellos empleados que no tienen ningún departamento asociado.
SELECT e.nombre FROM empleado e
left JOIN departamento d ON d.id = e.id_departamento
where e.id_departamento is null;

-- 3. Devuelve un listado donde sólo aparezcan aquellos departamentos que no tienen ningún empleado asociado.
SELECT *FROM departamento d
left JOIN empleado e ON d.id = e.id_departamento
WHERE e.id  IS NULL;
-- 4. 
SELECT * FROM empleado e
left JOIN departamento d ON d.id = e.id_departamento
order by d.nombre asc;

-- 5. 
SELECT *
FROM (
    -- Empleados sin departamento asociado
    SELECT e.id AS empleado_id, e.nif, e.nombre AS nombre_empleado, e.apellido1, e.apellido2, e.id_departamento
    FROM empleado e
    LEFT JOIN departamento d ON e.id_departamento = d.id
    WHERE e.id_departamento IS NULL

    UNION ALL

    -- Departamentos sin empleados asociados
    SELECT NULL AS empleado_id, NULL AS nif, NULL AS nombre_empleado, NULL AS apellido1, NULL AS apellido2, d.id AS id_departamento
    FROM departamento d
    LEFT JOIN empleado e ON d.id = e.id_departamento
    WHERE e.id_departamento IS NULL
) AS resultados
ORDER BY nombre_empleado;

-- ############################################################# consultas resumen############################################################
-- 1. Calcula la suma del presupuesto de todos los departamentos.
select sum(presupuesto) from departamento;
-- 2. Calcula la media del presupuesto de todos los departamentos.
select avg(presupuesto) from departamento;
-- 3. Calcula el valor mínimo del presupuesto de todos los departamentos.
select min(presupuesto) from departamento;
-- 4. Calcula el nombre del departamento y el presupuesto que tiene asignado, del departamento con menor presupuesto.
select nombre, presupuesto from departamento
where presupuesto=(select min(presupuesto) from departamento);

-- 5. Calcula el valor máximo del presupuesto de todos los departamentos.
select nombre, presupuesto from departamento
where presupuesto=(select max(presupuesto) from departamento);
-- 6. Calcula el nombre del departamento y el presupuesto que tiene asignado,del departamento con mayor presupuesto.
select nombre, presupuesto from departamento
where presupuesto=(select max(presupuesto) from departamento);
-- 7. Calcula el número total de empleados que hay en la tabla empleado.
select count(id) from empleado;
-- 8. Calcula el número de empleados que no tienen NULL en su segundoapellido.
select count(id) from empleado
where apellido2 is not null;
-- 9. Calcula el número de empleados que hay en cada departamento. Tienes quedevolver dos columnas, una con el nombre del departamento y otra con elnúmero de empleados que tiene asignados.
SELECT d.nombre AS nombre_departamento, COUNT(e.id) AS numero_empleados FROM departamento d
LEFT JOIN empleado e ON d.id = e.id_departamento
GROUP BY d.id;

-- 10. Calcula el nombre de los departamentos que tienen más de 2 empleados. Elresultado debe tener dos columnas, una con el nombre del departamento yotra con el número de empleados que tiene asignados.
SELECT d.nombre AS nombre_departamento, COUNT(e.id) AS numero_empleados FROM departamento d
LEFT JOIN empleado e ON d.id = e.id_departamento
GROUP BY d.id
HAVING COUNT(e.id) > 2;
-- 11. Calcula el número de empleados que trabajan en cada uno de losdepartamentos. El resultado de esta consulta también tiene que incluiraquellos departamentos que no tienen ningún empleado asociado.
SELECT d.nombre AS nombre_departamento, COUNT(e.id) AS numero_empleados FROM departamento d
LEFT JOIN empleado e ON d.id = e.id_departamento
GROUP BY d.nombre;
-- 12. Calcula el número de empleados que trabajan en cada unos de losdepartamentos que tienen un presupuesto mayor a 200000 euros.
SELECT d.nombre AS nombre_departamento, COUNT(e.id) AS numero_empleados FROM departamento d
INNER JOIN empleado e ON d.id = e.id_departamento
WHERE d.presupuesto > 200000
GROUP BY d.nombre;

