/* 1. Crea una tabla llamada "Pedidos" con las columnas: "id" (entero, clave
primaria), "id_usuario" (entero, clave foránea de la tabla "Usuarios") y
"id_producto" (entero, clave foránea de la tabla "Productos"). */

CREATE TABLE Pedidos (
    id SERIAL PRIMARY KEY,
    id_usuario INTEGER REFERENCES Usuarios(id),
    id_producto INTEGER REFERENCES Productos(id)
);

/* 2. Inserta al menos tres registros en la tabla "Pedidos" que relacionen usuarios con
productos. */

INSERT INTO Pedidos (id_usuario, id_producto) VALUES (1, 1);
INSERT INTO Pedidos (id_usuario, id_producto) VALUES (1, 2);
INSERT INTO Pedidos (id_usuario, id_producto) VALUES (2, 3);

/* 3. Realiza una consulta que muestre los nombres de los usuarios y los nombres de
los productos que han comprado, incluidos aquellos que no han realizado
ningún pedido (utiliza LEFT JOIN y COALESCE). */

SELECT u.nombre AS nombre_usuario, COALESCE(p.nombre, 'Ningún pedido') AS nombre_producto
FROM Usuarios u
LEFT JOIN Pedidos pe ON u.id = pe.id_usuario
LEFT JOIN Productos p ON pe.id_producto = p.id;

/* 4. Realiza una consulta que muestre los nombres de los usuarios que han
realizado un pedido, pero también los que no han realizado ningún pedido
(utiliza LEFT JOIN). */

SELECT u.nombre AS nombre_usuario
FROM Usuarios u
LEFT JOIN Pedidos pe ON u.id = pe.id_usuario
WHERE pe.id_usuario IS NOT NULL
UNION
SELECT u.nombre AS nombre_usuario
FROM Usuarios u
WHERE NOT EXISTS (
    SELECT 1
    FROM Pedidos pe
    WHERE pe.id_usuario = u.id
);

/* 5. Agrega una nueva columna llamada "cantidad" a la tabla "Pedidos" y actualiza
los registros existentes con un valor (utiliza ALTER TABLE y UPDATE) */

ALTER TABLE Pedidos
ADD COLUMN cantidad INTEGER;

UPDATE Pedidos
SET cantidad = 1;
