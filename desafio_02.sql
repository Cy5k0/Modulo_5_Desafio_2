/* Creación base de datos*/

CREATE DATABASE desafio2_Francisco_Colomer_666;

/* Insercion de Usuarios */

CREATE TABLE IF NOT EXISTS inscritos(cantidad INT, fecha DATE, fuente VARCHAR);
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES( 44, '01/01/2021', 'Blog' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES( 56, '01/01/2021', 'Página' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES( 39, '01/02/2021', 'Blog' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES( 81, '01/02/2021', 'Página' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES( 12, '01/03/2021', 'Blog' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES( 91, '01/03/2021', 'Página' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES( 48, '01/04/2021', 'Blog' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES( 45, '01/04/2021', 'Página' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES( 55, '01/05/2021', 'Blog' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES( 33, '01/05/2021', 'Página' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES( 18, '01/06/2021', 'Blog' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES( 12, '01/06/2021', 'Página' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES( 34, '01/07/2021', 'Blog' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES( 24, '01/07/2021', 'Página' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES( 83, '01/08/2021', 'Blog' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES( 99, '01/08/2021', 'Página' );


/* 1. ¿Cuántos registros hay? */

SELECT COUNT(*) FROM inscritos;

-- MUESTRA: 16

/* 2. ¿Cuántos inscritos hay en total? */

SELECT SUM(cantidad) FROM inscritos;

-- MUESTRA: 774

/* 3. ¿Cuál o cuáles son los registros de mayor antigüedad? */

SELECT * FROM inscritos WHERE fecha = (SELECT MIN(fecha) FROM inscritos);


/* MUESTRA : 
cantidad   /    fecha       / fuente
   44      /  2021-01-01    /   Blog
   56      /  2021-01-01    /   Página  */




/* 4. ¿Cuántos inscritos hay por día? (entendiendo un día como una fecha distinta de ahora en adelante) */

SELECT fecha, SUM(cantidad) FROM inscritos GROUP BY fecha;

/* MUESTRA:

fecha        /   sum
2021-01-08   /  182
2021-01-04   /   93
2021-01-02   /  120
2021-01-07   /   58
2021-01-03   /  103
2021-01-05   /   88
2021-01-01   /  100
2021-01-06   /   30   */




/*5. ¿Qué día se inscribieron la mayor cantidad de personas y cuántas personas se inscribieron en ese día? */

-- SELECT fecha, SUM(cantidad) FROM inscritos GROUP BY fecha HAVING SUM(cantidad) = (SELECT SUM(cantidad) FROM inscritos GROUP BY SUM(cantidad) DESC LIMIT 1
SELECT fecha, SUM(cantidad) AS total_inscritos
FROM inscritos
GROUP BY fecha
ORDER BY total_inscritos DESC
LIMIT 1;

-- MUESTRA : 182
