# Examen-Mysql1
Listar todos los libros disponibles
```sql
SELECT isbn, nombre
FROM libro;
```
Buscar libros por género
```sql
SELECT libro.isbn, libro.nombre
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
SELECT nombre
FROM autores;
```
Buscar autores por nombre
```sql
SELECT nombre
FROM autores
WHERE autores.name='jose';
```
Obtener todos los libros de un autor específico
```sql
SELECT libro.isbn, libro.nombre
FROM libro,autores_libro, autores
WHERE libro.id_autores_libro=autores_libro.id AND autores_libro.id_autores=autores.id AND autores.id='pablo';
```
Listar todas las ediciones de un libro
```sql
# Introduce aquí las consultas.
```
Obtener la última edición de un libro
```sql
# Introduce aquí las consultas.
```
Contar cuántas ediciones hay de un libro específico
```sql
# Introduce aquí las consultas.
```
Listar todas las transacciones de préstamo
```sql
# Introduce aquí las consultas.
```
Obtener los libros prestados actualmente
```sql
# Introduce aquí las consultas.
```
Contar el número de transacciones de un miembro específico
```sql
# Introduce aquí las consultas.
```
Listar todos los miembros de la biblioteca
```sql
# Introduce aquí las consultas.
```
Buscar un miembro por nombre:
```sql
# Introduce aquí las consultas.
```
Obtener las transacciones de un miembro específico
```sql
# Introduce aquí las consultas.
```
Listar todos los libros y sus autores
```sql
# Introduce aquí las consultas.
```
Obtener el historial de préstamos de un libro específico
```sql
# Introduce aquí las consultas.
```
Contar cuántos libros han sido prestados en total
```sql
# Introduce aquí las consultas.
```
Listar todos los libros junto con su última edición y estado de disponibilidad
```sql
# Introduce aquí las consultas.
```
