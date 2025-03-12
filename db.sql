CREATE DATABASE IF NOT EXISTS bibliocampus;

USE bibliocampus;

CREATE TABLE IF NOT EXISTS biblioteca(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30),
    direccion VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS editorial(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS generos(
    id INT AUTO_INCREMENT PRIMARY KEY,
    detalle VARCHAR(25)
);

CREATE TABLE IF NOT EXISTS autores(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS miembro(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre  VARCHAR(20),
    direccion VARCHAR(100),
    id_biblioteca INT,
    CONSTRAINT biblio_miembro_fk FOREIGN KEY(id_biblioteca) REFERENCES biblioteca(id)
);

CREATE TABLE IF NOT EXISTS edicion_libro(
    id INT AUTO_INCREMENT PRIMARY KEY,
    detalles VARCHAR(50),
    id_editorial INT,
    fecha_edicion DATE,
    CONSTRAINT editorial_edicion_fk FOREIGN KEY(id_editorial) REFERENCES editorial(id)
);

CREATE TABLE IF NOT EXISTS gen_libro(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_generos INT,
    CONSTRAINT generos_genero_fk FOREIGN KEY (id_generos) REFERENCES generos(id)
);

CREATE TABLE IF NOT EXISTS autores_libro(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_autores INT,
    CONSTRAINT autor_autores_fk FOREIGN KEY (id_autores) REFERENCES autores(id)
);

CREATE TABLE IF NOT EXISTS prestamos(
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha_pres DATE,
    id_miembro INT,
    CONSTRAINT miembro_prestamos_fk FOREIGN KEY (id_miembro) REFERENCES miembro(id)
);

CREATE TABLE IF NOT EXISTS devoluciones(
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha_dev DATE,
    id_miembro INT,
    CONSTRAINT miembro_devolucion_fk FOREIGN KEY (id_miembro) REFERENCES miembro(id)
);

CREATE TABLE IF NOT EXISTS det_prev_dev(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_prestamos INT,
    id_devoluciones INT,
    CONSTRAINT pres_det_fk FOREIGN KEY (id_prestamos) REFERENCES prestamos(id),
    CONSTRAINT dev_det_fk FOREIGN KEY (id_devoluciones) REFERENCES devoluciones(id)
);

CREATE TABLE IF NOT EXISTS transaccion(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_det_pres_dev INT,
    id_miembro INT,
    CONSTRAINT detmov_transaccion_fk FOREIGN KEY (id_det_pres_dev) REFERENCES det_prev_dev(id),
    CONSTRAINT miembro_transaccion_fk FOREIGN KEY (id_miembro) REFERENCES miembro(id)
);

CREATE TABLE IF NOT EXISTS libro(
    isbn VARCHAR(25) PRIMARY KEY,
    nombre VARCHAR(50),
    fecha_publicacion DATE,
    id_gen_libro INT,
    id_biblioteca INT,
    id_det_pres_dev INT,
    id_autores_libro INT,
    CONSTRAINT gen_libro_fk FOREIGN KEY (id_gen_libro) REFERENCES gen_libro(id),
    CONSTRAINT biblio_libro_fk FOREIGN KEY (id_biblioteca) REFERENCES biblioteca(id),
    CONSTRAINT autor_libro_fk FOREIGN KEY (id_autores_libro) REFERENCES autores_libro(id),
    CONSTRAINT detmov_libro_fk FOREIGN KEY (id_det_pres_dev) REFERENCES det_prev_dev(id)
);