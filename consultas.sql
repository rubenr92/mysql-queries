use tienda;

select nombre from producto;
select nombre,precio from producto;
select * from producto;
select nombre, precio as euros, precio *0.8 as dolares from producto;
select producto.nombre, substr(upper(fabricante.nombre),1,2) from producto, fabricante;
select nombre, round(precio) from producto;
select distinct codigo_fabricante from producto;
select nombre, precio from producto order by nombre, precio; -- comprobar
select * from fabricante limit 5;
select * from fabricante where codigo > 3 limit 2;
select nombre, precio from producto order by precio desc limit 1;
select nombre from producto where codigo_fabricante = 2;
select producto.nombre from producto join fabricante on codigo_fabricante = fabricante.codigo where fabricante.nombre = 'Crucial' && precio > 200;
select * from producto join fabricante on codigo_fabricante = fabricante.codigo where fabricante.nombre = 'Asus' || fabricante.nombre = 'Hewlett-Packard' || fabricante.nombre = 'Seagate';
select producto.nombre from producto left join fabricante on codigo_fabricante = fabricante.codigo where fabricante.nombre in ('Asus', 'Hewlett-Packard', 'Seagate');
select producto.nombre, producto.precio from producto left join fabricante on codigo_fabricante = fabricante.codigo where fabricante.nombre like '%e';
select producto.nombre, producto.precio, fabricante.nombre from producto left join fabricante on codigo_fabricante = fabricante.codigo where producto.precio > 180 order by producto.precio desc, producto.nombre asc;
select nombre from producto where producto.codigo_fabricante = (select codigo from fabricante where fabricante.nombre like 'Lenovo' limit 1);


use universidad;

select apellido1, apellido2, nombre from persona order by apellido1, apellido2, nombre;
select apellido1, apellido2, nombre from persona where telefono is null;
select * from persona where fecha_nacimiento like '1999%';
select * from profesor left join persona on id_profesor = id where telefono is null && persona.nif like '%K';
select * from asignatura where cuatrimestre = 1 && curso=3 && id_grado = 7;
select apellido1, apellido2, persona.nombre, departamento.nombre from profesor left join persona on id_profesor = id left join departamento on id_departamento = departamento.id order by apellido1, apellido2, persona.nombre; 
select asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin from alumno_se_matricula_asignatura left join persona on id_alumno = persona.id left join asignatura on id_asignatura = asignatura.id left join curso_escolar on id_curso_escolar = curso_escolar.id where persona.nif like '26902806M';
select distinct departamento.nombre from asignatura left join grado on id_grado = grado.id left join profesor on asignatura.id_profesor = profesor.id_profesor left join departamento on id_departamento = departamento.id where grado.nombre like 'Grado en Ingeniería Informática (Plan 2015)'; 
select distinct apellido1, apellido2, persona.nombre from alumno_se_matricula_asignatura left join asignatura on id_asignatura = asignatura.id left join curso_escolar on id_curso_escolar = curso_escolar.id left join persona on id_alumno = persona.id where anyo_inicio like 2018;
select apellido1, apellido2, persona.nombre, departamento.nombre from persona right join profesor on id_profesor = persona.id left join departamento on id_departamento = departamento.id;
select apellido1, apellido2, persona.nombre from persona right join profesor on id_profesor = persona.id where id_departamento is null;
select nombre from departamento left join profesor on departamento.id = id_departamento where id_profesor is null;
select apellido1, apellido2, persona.nombre from persona left join asignatura on persona.id = id_profesor where asignatura.id is null;
select departamento.nombre from departamento left join profesor on departamento.id = id_departamento left join asignatura on profesor.id_profesor = asignatura.id_profesor group by departamento.nombre having count(asignatura.id) = 0;
select count(*) from persona where tipo like 'alumno';
select departamento.nombre, count(*) as numero_profesores from departamento left join profesor on departamento.id = id_departamento where id_profesor is not null group by departamento.nombre order by numero_profesores desc;
select departamento.nombre, count(id_profesor) as numero_profesores from departamento left join profesor on departamento.id = id_departamento group by departamento.nombre order by numero_profesores desc;
select grado.nombre, count(asignatura.id) as num_asignaturas from grado left join asignatura on grado.id = id_grado group by grado.nombre having num_asignaturas > 40;
select grado.nombre, asignatura.tipo, sum(asignatura.creditos) from grado left join asignatura on grado.id = id_grado where asignatura.creditos is not null group by grado.nombre, asignatura.tipo; 
select * from persona where fecha_nacimiento = (select max(fecha_nacimiento) from persona);






