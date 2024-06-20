/* 1. Crea una tabla llamada "Productos" con las columnas: "id" (entero, clave
primaria), "nombre" (texto) y "precio" (numérico). */

CREATE TABLE Productos (
    id SERIAL PRIMARY KEY,
    nombre TEXT,
    precio NUMERIC
);

/* 2. Inserta al menos cinco registros en la tabla "Productos". */

INSERT INTO Productos (nombre, precio) VALUES ('Camiseta', 20.50);
INSERT INTO Productos (nombre, precio) VALUES ('Pantalón', 35.75);
INSERT INTO Productos (nombre, precio) VALUES ('Zapatos', 50.00);
INSERT INTO Productos (nombre, precio) VALUES ('Sombrero', 15.25);
INSERT INTO Productos (nombre, precio) VALUES ('Bufanda', 10.99);

/* 3. Actualiza el precio de un producto en la tabla "Productos". */

UPDATE Productos
SET precio = 25.00
WHERE nombre = 'Camiseta';

/* 4. Elimina un producto de la tabla "Productos". */

DELETE FROM Productos
WHERE nombre = 'Sombrero';

/* 5. Realiza una consulta que muestre los nombres de los usuarios junto con los
nombres de los productos que han comprado (utiliza un INNER JOIN con la
tabla "Productos"). */

CREATE TABLE Compras (
    id SERIAL PRIMARY KEY,
    usuario_id INTEGER REFERENCES Usuarios(id),
    producto_id INTEGER REFERENCES Productos(id),
    fecha_compra DATE
);

SELECT u.nombre AS nombre_usuario, p.nombre AS nombre_producto
FROM Usuarios u
INNER JOIN Compras c ON u.id = c.usuario_id
INNER JOIN Productos p ON c.producto_id = p.id;
