--#############################
--########EJERCICIO 4##############
--#################################


--Creacion y uso de la bd
--

Create database colegio;
use colegio;

create table pais(
	id int(10) primary key,
	nombre varchar(20),
	continente varchar(50),
	poblacion int
);

create table ciudad(
	id int primary key,
	nombre varchar(20),
	id_pais int(10),
	foreign key(id_pais) references pais(id)
);
CREATE  table idioma(
	id int(10) primary key,
	idioma varchar(50)
);

CREATE TABLE idioma_pais (
    idIdioma INT(10),
    idPais INT(10),
    es_oficial TINYINT(1),
    PRIMARY KEY (idIdioma, idPais),
    FOREIGN KEY (idIdioma) REFERENCES idioma(id),
    FOREIGN KEY (idPais) REFERENCES pais(id)
);

INSERT INTO pais (id, nombre, continente, poblacion) 
VALUES 
(1, 'Colombia', 'America del sur', 1000222),
(2, 'Peru', 'America del sur', 39828292),
(3, 'canada', 'America del norte', 203939392),
(4, 'Estados Unidos', 'America del norte', 331002651),
(5, 'China', 'Asia', 1439323776),
(6, 'India', 'Asia', 1380004385),
(7, 'Rusia', 'Europa/Asia', 145934462),
(8, 'Australia', 'Oceania', 25499884),
(9, 'alaska', 'America del norte', 37742154),
(10, 'Argentina', 'America del sur', 45195777);

INSERT INTO idioma (id, idioma)
VALUES
(1, 'ESPAÑOL'),
(2, 'Aleman'),
(3, 'Inglés'),
(4, 'Francés'),
(5, 'Portugués'),
(6, 'Italiano'),
(7, 'Chino'),
(8, 'Japonés'),
(9, 'Árabe'),
(10, 'Ruso');

INSERT INTO ciudad (id, nombre, id_pais)
VALUES
(1,'Bogota',1),
(2,'Medellin',1),
(3,'lima',2),
(4,'ontario',3),
(5,'Toronto',3),
(6,'Chicago',4),
(7,'new york',4),
(8,'Buenos Aires',10),
(9,'Perth',8),
(10,'Melbourne',8);

INSERT INTO idioma_pais (idIdioma, idPais, es_oficial)
VALUES 
(1,1,1),
(1,2,1),
(3,3,1),
(4,3,1),
(9,5,0),
(1,10,1),
(10,7,1),
(7,7,1),
(6,2,0),
(4,8,1);

ALTER DATABASE colegio RENAME TO paises;




--Desarrollado por: Olfer Olaya