INSERT INTO biblioteca (nombre, direccion) VALUES('bibliocampus', 'zona franca');

INSERT INTO editorial (nombre) VALUES('santillana');

INSERT INTO generos (detalle) VALUES('terror');

INSERT INTO autores (nombre) VALUES('franco');

INSERT INTO miembro (nombre, direccion, id_biblioteca) VALUES('camila', 'mi casa', 1);

INSERT INTO edicion_libro (detalles, id_editorial, fecha_edicion) VALUES('primera edicion', 1, NOW());

INSERT INTO gen_libro (id_generos) VALUES(1);

INSERT INTO autores_libro (id_autores) VALUES(1);

INSERT INTO libro (isbn, nombre, fecha_publicacion, id_gen_libro, id_biblioteca, id_det_pres_dev, id_autores_libro) VALUES('gkjshghbghba', 'idk', NOW(), 1, 1, 1,1);

INSERT INTO det_prev_dev(id_prestamos, id_devoluciones) VALUES(1,1);

