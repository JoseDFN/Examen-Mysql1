# Examen-Mysql1
Listar todos los libros disponibles
```sql
SELECT libro.isbn, libro.nombre
FROM libro;
```
Buscar libros por género
```sql
SELECT libro.isbn, libro.nombre, generos.detalle
FROM libro, gen_libro, generos
WHERE libro.id_gen_libro=gen_libro.id AND gen_libro.id=generos.id and generos.detalle='terror';
```
Obtener información de un libro por ISBN
```sql
SELECT libro.isbn, libro.nombre
FROM libro
WHERE libro.isbn='gkjsga';
```
Contar el número de libros en la biblioteca
```sql
SELECT biblioteca.id, biblioteca.nombre, libro.isbn, libro.nombre
FROM libro, biblioteca
WHERE libro.id_biblioteca=biblioteca.id AND biblioteca.id=1;
```
Listar todos los autores
```sql
SELECT autores.nombre
FROM autores;
```
Buscar autores por nombre
```sql
SELECT autores.nombre as Autor_Nombre
FROM autores
WHERE autores.nombre='jose';
```
Obtener todos los libros de un autor específico
```sql
SELECT libro.isbn, libro.nombre, autores.nombre
FROM libro,autores_libro, autores
WHERE libro.id_autores_libro=autores_libro.id AND autores_libro.id_autores=autores.id AND autores.id='jose';
```
Listar todas las ediciones de un libro
```sql
SELECT edicion_libro.id, edicion_libro.detalles, libro.isbn, libro.nombre
FROM edicion_libro, libro
WHERE edicion_libro.id = libro.id_edicion_libro AND libro.isbn='gkjshghbghba';
```
Obtener la última edición de un libro
```sql
SELECT edicion_libro.id,edicion_libro.fecha_edicion, edicion_libro.detalles, libro.isbn, libro.nombre
FROM edicion_libro, libro
WHERE edicion_libro.id = libro.id_edicion_libro AND libro.isbn='gkjshghbghba'
ORDER BY edicion_libro.fecha_edicion DESC;
```
Contar cuántas ediciones hay de un libro específico
```sql
SELECT COUNT(edicion_libro.id),edicion_libro.fecha_edicion, edicion_libro.detalles, libro.isbn, libro.nombre
FROM edicion_libro, libro
WHERE edicion_libro.id = libro.id_edicion_libro AND libro.isbn='gkjshghbghba';
```
Listar todas las transacciones de préstamo
```sql
SELECT prestamos.id, prestamos.fecha_pres, prestamos.id_miembro, miembro.nombre
FROM prestamos, miembro
WHERE prestamos.id_miembro=miembro.id;
```
Obtener los libros prestados actualmente
```sql
SELECT libro.isbn, libro.nombre, prestamos.fecha_pres
FROM libro, det_prev_dev, prestamos
WHERE libro.id_det_pres_dev=det_prev_dev.id AND det_prev_dev.id_prestamos=prestamos.id 
AND det_prev_dev.id_prestamos = (SELECT det_prev_dev.id_prestamos
FROM det_prev_dev
WHERE det_prev_dev.id_prestamos>det_prev_dev.id_devoluciones);
```
Contar el número de transacciones de un miembro específico
```sql
SELECT COUNT(transaccion.id), miembro.nombre
FROM transaccion, miembro
WHERE miembro.id=transaccion.id_miembro AND miembro.id=1;
```
Listar todos los miembros de la biblioteca
```sql
SELECT miembro.id, miembro.nombre, biblioteca.nombre
FROM miembro, biblioteca
WHERE miembro.id_biblioteca=biblioteca.id;
```
Buscar un miembro por nombre:
```sql
SELECT miembro.id, miembro.nombre
FROM miembro
WHERE miembro.nombre='jose';
```
Obtener las transacciones de un miembro específico
```sql
SELECT transaccion.id, miembro.nombre
FROM transaccion, miembro
WHERE miembro.id=transaccion.id_miembro AND miembro.id=1;
```
Listar todos los libros y sus autores
```sql
SELECT libro.isbn, libro.nombre, autores.nombre
FROM libro, autores_libro, autores
WHERE libro.id_autores_libro=autores_libro.id AND autores_libro.id_autores=autores.id;
```
Obtener el historial de préstamos de un libro específico
```sql
SELECT libro.isbn, libro.nombre, prestamos.id, prestamos.fecha_pres
FROM libro, det_prev_dev, prestamos
WHERE libro.id_det_pres_dev=det_prev_dev.id AND det_prev_dev.id_prestamos=prestamos.id AND libro.isbn='AAA462YTAV';
```
Contar cuántos libros han sido prestados en total
```sql
SELECT COUNT(prestamos.id)
FROM prestamos;
```
Listar todos los libros junto con su última edición y estado de disponibilidad
```sql
SELECT libro.isbn, libro.nombre, edicion_libro.detalles, edicion_libro.fecha_edicion
FROM libro, edicion_libro, det_prev_dev
WHERE libro.id_edicion_libro=edicion_libro.id AND libro.id_det_pres_dev = det_prev_dev.id 
ORDER BY edicion_libro.fecha_edicion DESC;
```
