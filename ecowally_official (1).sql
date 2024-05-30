CREATE DATABASE ecowally;
USE ecowally;

CREATE TABLE Usuario (
    Usuario VARCHAR(50) Primary key unique,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    CorreoElectronico VARCHAR(50),
    Contrasena VARCHAR(50),
    Confirmar_Contra VARCHAR (50),
    Puntos_Totales INT DEFAULT 0
);

CREATE TABLE Productos (
    ID_Producto INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100),
    Descripcion TEXT,
    Precio DECIMAL(10, 2),
    Stock_Disponible INT
);

CREATE TABLE Detalles_Pedido (
    ID_Detalle_Pedido INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ID_Producto INT,
    ID_Pedido INT,
    Cantidad INT,
    Precio_Unitario DECIMAL(10, 2),
    FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto),
    FOREIGN KEY (ID_Pedido) REFERENCES Pedidos (ID_Pedido),
    Utilizo_Puntos BOOLEAN DEFAULT FALSE,
    Puntos_Utilizados INT DEFAULT 0
);

CREATE TABLE Pedidos (
    ID_Pedido INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Usuario VARCHAR(50),
    Fecha_Pedido DATE,
    Estado_Pedido ENUM('pendiente', 'enviado', 'entregado', 'cancelado'),
    Total_Pedido DECIMAL(10, 2),
    FOREIGN KEY (Usuario) REFERENCES Usuario(Usuario)
);

CREATE TABLE Carrito_Compras (
    ID_Carrito INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Usuario VARCHAR(50),
    ID_Producto INT,
    Cantidad INT,
    Precio_Unitario DECIMAL(10, 2),
    FOREIGN KEY (Usuario) REFERENCES Usuario(Usuario),
    FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto)
);

CREATE TABLE Pagos (
    ID_Pago INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ID_Pedido INT,
    Metodo_Pago VARCHAR(50), 
    Monto_Pagado DECIMAL(10, 2),
    Fecha_Pago DATE,
    FOREIGN KEY (ID_Pedido) REFERENCES Pedidos(ID_Pedido)
);

CREATE TABLE Puntos_Usuario ( 
    ID_Puntos INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Usuario VARCHAR(50),
    Puntos_Disponibles INT,
    FOREIGN KEY (Usuario) REFERENCES Usuario(Usuario)
);

CREATE TABLE Transacciones_Puntos (
    ID_Transaccion INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Usuario VARCHAR(50),
    Tipo_Transaccion ENUM('Reseña', 'Compra', 'Donacion'),
    Puntos_Obtenidos INT,
    Descripcion TEXT,
    Fecha_Transaccion DATE,
    FOREIGN KEY (Usuario) REFERENCES Usuario(Usuario)
);

CREATE TABLE Resenas (
    ID_Reseña INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Usuario VARCHAR(50),
    ID_Lugares INT,
    Calificacion INT,  
    Comentario TEXT,
    Fecha_Reseña DATE,
    FOREIGN KEY (Usuario) REFERENCES Usuario(Usuario)
);

CREATE TABLE Consejos (
ID_Consejo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
Usuario VARCHAR(50),
Consejo TEXT,
Fecha_Entrega DATE,
FOREIGN KEY (Usuario) REFERENCES Usuario(Usuario)
);

show tables;