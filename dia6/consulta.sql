use ensayoPrueba;

-- 1. Devuelve un listado con los nombres de todos los profesores y los departamentos que tienen vinculados. El listado también debe mostrar aquellos profesores que no tienen ningún departamento asociado. El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor. El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y el nombre.
select p.nombre ,p.apellido1 ,p.apellido2, d.nombre  from departamento d
inner join profesor p on p.id_departamento =d.id;

-- 2. Devuelve un listado con los profesores que no están asociados a un departamento.
select nombre from profesor where id_departamento like '';

-- 3. Devuelve un listado con los departamentos que no tienen profesores asociados.
select p.nombre  from departamento d
inner join profesor p on p.id_departamento =d.id
where id_departamento like '' ;

-- 4. Devuelve un listado con los profesores que no imparten ninguna asignatura.
select * from asignatura;

-- 5. Devuelve un listado con las asignaturas que no tienen un profesor asignado.
select a.nombre from asignatura a
inner join profesor p on p.id= a.id_profesor
where id_profesor like '%%';
select * from asignatura;
select * from profesor;

-- 6. Devuelve un listado con todos los departamentos que tienen alguna asignatura que no se haya impartido en ningún curso escolar. El resultado debe mostrar el nombre del departamento y el nombre de la asignatura que no se haya impartido nunca.

-- 7. Devuelve el número total de alumnas que hay.

select sum (sexo)  from alumno; where sexo like 'M%';

-- 8. calcula cuantos alumnos nacieron en 1999
select sum (id) from alumno where fecha_nacimiento like '1999%';

-- 9. Calcula cuántos profesores hay en cada departamento. El resultado sólo debe mostrar dos columnas, una con el nombre del departamento y otra con el número de profesores que hay en ese departamento. El resultado sólo debe incluir los departamentos que tienen profesores asociados y deberá estar ordenado de mayor a menor por el número de profesores.

-- 10. Devuelve un listado con todos los departamentos y el número de profesores que hay en cada uno de ellos. Tenga en cuenta que pueden existir departamentos que no tienen profesores asociados. Estos departamentos también tienen que aparecer en el listado.


 
 
 e 