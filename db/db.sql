DROP DATABASE IF EXISTS el_mas_perro;
CREATE DATABASE IF NOT EXISTS el_mas_perro;

USE el_mas_perro;

CREATE TABLE clientes (
    id              CHAR(8)         NOT NULL,
    nombre          VARCHAR(255)    NOT NULL,
    email           VARCHAR(255)    NOT NULL,
    telefono        VARCHAR(20)     NOT NULL,
    direccion       VARCHAR(255)    NOT NULL,
    fecha_registro  DATE            NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE mascotas (
    id          CHAR(8)         NOT NULL,
    nombre      VARCHAR(255)    NOT NULL,
    fecha_nac   DATE            NOT NULL,
    espacie     VARCHAR(50)     NOT NULL,
    raza        VARCHAR(50)     NOT NULL,
    sexo        VARCHAR(10)     NOT NULL,
    image       VARCHAR(255)    NOT NULL,
    id_cliente  CHAR(8)         NOT NULL,
    primary key (id),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE membresias (
    id              CHAR(8)         NOT NULL,
    tipo            VARCHAR(50)     NOT NULL,
    fecha_inicio    DATE            NOT NULL,
    fecha_fin       DATE            NOT NULL,
    costo           DECIMAL(10, 2)  NOT NULL,
    id_cliente      CHAR(8),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

DELIMITER $$
CREATE PROCEDURE create_cliente (
    in_nombre          		VARCHAR(255),
    in_email           		VARCHAR(255),
    in_telefono        		VARCHAR(20),
    in_direccion       		VARCHAR(255),
    in_fecha_registro  		DATE,
    in_masc_nombre      	VARCHAR(255),
    in_masc_fecha_nac   	DATE,
    in_masc_espacie     	VARCHAR(50),
    in_masc_raza        	VARCHAR(50),
    in_masc_sexo        	VARCHAR(10),
    in_masc_image       	VARCHAR(255),
    in_mem_tipo            	VARCHAR(50),
    in_mem_fecha_inicio    	DATE,
    in_mem_fecha_fin       	DATE,
    in_mem_costo           	DECIMAL(10, 2)
)
BEGIN
    DECLARE id_cliente CHAR(8) DEFAULT LEFT(UUID(), 8);
    DECLARE id_mascota CHAR(8) DEFAULT LEFT(UUID(), 8);
    DECLARE id_membresia CHAR(8) DEFAULT LEFT(UUID(), 8);

    INSERT INTO clientes
    VALUES (id_cliente, in_nombre, in_email, in_telefono, in_direccion, in_fecha_registro);

    INSERT INTO mascotas
    VALUES (id_mascota, in_masc_nombre, in_masc_fecha_nac, in_masc_espacie, in_masc_raza, in_masc_sexo,in_masc_image, id_cliente);

    INSERT INTO membresias
    VALUES (id_membresia, in_mem_tipo, in_mem_fecha_inicio, in_mem_fecha_fin, in_mem_costo, id_cliente);

END;
$$ DELIMITER ;


SELECT * FROM clientes;
SELECT * FROM membresias;
SELECT * FROM mascotas;

SELECT *
FROM clientes c
JOIN mascotas m ON c.id = m.id_cliente
JOIN membresias me ON c.id = me.id_cliente
WHERE c.id = 1;

CALL create_cliente('Reyna Chavez', 'reynachavezz@gmail.com', '555-1234', 'Av. corea del norte 123', '2023-04-19', 'Fifis', '2019-03-25', 'Perro', 'Chihuahua', 'fifis.jpg', 'Premium', '2023-04-19', '2024-04-19', 500.00);
