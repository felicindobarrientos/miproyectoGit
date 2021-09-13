CREATE DATABASE bd_comprasventas;

CREATE TABLE empresa(
	id_empresa INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(30) NOT NULL,
	logo_empresa VARCHAR(100) NOT NULL,
	direccion VARCHAR(40) NOT NULL,
	telefono VARCHAR(15) NOT NULL,
	fec_insercion TIMESTAMP NOT NULL,
	fec_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	usuario INT NOT NULL,
	estado CHAR(1) NOT NULL,
	PRIMARY KEY(id_empresa)
)ENGINE=INNODB;

CREATE TABLE proveedores(
	id_proveedor INT NOT NULL AUTO_INCREMENT,
	id_empresa INT NOT NULL,
	nombre VARCHAR(30) NOT NULL,
	direccion VARCHAR(40) NOT NULL,
	telefono VARCHAR(15) NOT NULL,
	fec_insercion TIMESTAMP NOT NULL,
	fec_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	usuario INT NOT NULL,
	estado CHAR(1) NOT NULL,
	PRIMARY KEY(id_proveedor),
	FOREIGN KEY(id_empresa) REFERENCES empresa(id_empresa)
)ENGINE=INNODB;

CREATE TABLE productos(
	id_producto INT NOT NULL AUTO_INCREMENT,
	id_proveedor INT NOT NULL,
	descripcion VARCHAR(60) NOT NULL,
	modelo VARCHAR(30) NOT NULL,
	marca VARCHAR(30) NOT NULL,
	industria_origen VARCHAR(15),
	fec_insercion TIMESTAMP NOT NULL,
	fec_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	usuario INT NOT NULL,
	estado CHAR(1) NOT NULL,
	PRIMARY KEY(id_producto),
	FOREIGN KEY(id_proveedor) REFERENCES proveedores(id_proveedor)
)ENGINE=INNODB;

CREATE TABLE productos_precios(
	id_producto_precio INT NOT NULL AUTO_INCREMENT,
	id_producto INT NOT NULL,
	fecha_prec_compra DATE NOT NULL,
	precio_compra FLOAT NOT NULL,
	precio_venta FLOAT NOT NULL,
	fecha_prec_venta DATE NOT NULL,
	fec_insercion TIMESTAMP NOT NULL,
	fec_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	usuario INT NOT NULL,
	estado CHAR(1) NOT NULL,
	PRIMARY KEY(id_producto_precio),
	FOREIGN KEY(id_producto) REFERENCES productos(id_producto)
)ENGINE=INNODB;

CREATE TABLE compras(
	id_compra INT NOT NULL AUTO_INCREMENT,
	id_proveedor INT NOT NULL,
	nro_compra INT NOT NULL,
	tipo_compra VARCHAR(30) NOT NULL,
	tipo_de_moneda VARCHAR(30) NOT NULL,
	fecha_compra DATETIME NOT NULL,
	monto_total FLOAT NOT NULL,
	fec_insercion TIMESTAMP NOT NULL,
	fec_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	usuario INT NOT NULL,
	estado CHAR(1) NOT NULL,
	PRIMARY KEY(id_compra),
	FOREIGN KEY(id_proveedor) REFERENCES proveedores(id_proveedor)
)ENGINE=INNODB;

CREATE TABLE detalles_compras(
	id_detalle_compra INT NOT NULL AUTO_INCREMENT,
	id_compra INT NOT NULL,
	id_producto_precio INT NOT NULL,
	cantidad_c INT NOT NULL,
	descuento FLOAT NOT NULL,
	monto_parcial FLOAT NOT NULL,
	fec_insercion TIMESTAMP NOT NULL,
	fec_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	usuario INT NOT NULL,
	estado CHAR(1) NOT NULL,
	PRIMARY KEY(id_detalle_compra),
	FOREIGN KEY(id_compra) REFERENCES compras(id_compra),
	FOREIGN KEY(id_producto_precio) REFERENCES productos_precios(id_producto_precio)
)ENGINE=INNODB;

CREATE TABLE clientes(
	id_cliente INT NOT NULL AUTO_INCREMENT,
	id_empresa INT NOT NULL,
	ci VARCHAR(15) NOT NULL,
	nombres VARCHAR(30) NOT NULL,
	apellidos VARCHAR(30),
	telefono VARCHAR(15) NOT NULL,
	fec_insercion TIMESTAMP NOT NULL,
	fec_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	usuario INT NOT NULL,
	estado CHAR(1) NOT NULL,
	PRIMARY KEY(id_cliente),
	FOREIGN KEY(id_empresa) REFERENCES empresa(id_empresa)
)ENGINE=INNODB;

CREATE TABLE ventas(
	id_venta INT NOT NULL AUTO_INCREMENT,
	id_cliente INT NOT NULL,
	nro_venta INT NOT NULL,
	tipo_venta VARCHAR(10) NOT NULL,
	fecha_venta DATETIME NOT NULL,
	monto_final FLOAT NOT NULL,
	fec_insercion TIMESTAMP NOT NULL,
	fec_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	usuario INT NOT NULL,
	estado CHAR(1) NOT NULL,
	PRIMARY KEY(id_venta),
	FOREIGN KEY(id_cliente) REFERENCES clientes(id_cliente)
)ENGINE=INNODB;

CREATE TABLE detalles_ventas(
	id_detalle_venta INT NOT NULL AUTO_INCREMENT,
	id_venta INT NOT NULL,
	id_producto_precio INT NOT NULL,
	cantidad_v INT NOT NULL,
	descuento FLOAT NOT NULL,
	monto_parcial FLOAT NOT NULL,
	fec_insercion TIMESTAMP NOT NULL,
	fec_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	usuario INT NOT NULL,
	estado CHAR(1) NOT NULL,
	PRIMARY KEY(id_detalle_venta),
	FOREIGN KEY(id_venta) REFERENCES ventas(id_venta),
	FOREIGN KEY(id_producto_precio) REFERENCES productos_precios(id_producto_precio)
)ENGINE=INNODB;

CREATE TABLE existencias(
	id_existencia INT NOT NULL AUTO_INCREMENT,
	id_producto INT NOT NULL,
	id_detalle_compra INT NOT NULL,
	id_detalle_venta INT NOT NULL,
	cantidad INT NOT NULL,
	fec_insercion TIMESTAMP NOT NULL,
	fec_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	usuario INT NOT NULL,
	estado CHAR(1) NOT NULL,
	PRIMARY KEY(id_existencia),
	FOREIGN KEY(id_producto) REFERENCES productos(id_producto),
	FOREIGN KEY(id_detalle_compra) REFERENCES detalles_compras(id_detalle_compra),
	FOREIGN KEY(id_detalle_venta) REFERENCES detalles_ventas(id_detalle_venta)
)ENGINE=INNODB;
/*****************************************TABLAS DE SEGURIDAD**********************************************************/
CREATE TABLE _personas(
	id_persona INT NOT NULL AUTO_INCREMENT,
	id_empresa INT NOT NULL,
	ci VARCHAR(15) NOT NULL,
	nombres VARCHAR(30) NOT NULL,
	ap VARCHAR(30),
	am VARCHAR(30),
	telefono VARCHAR(30),
	direccion VARCHAR(30),
	genero CHAR(1) NOT NULL,
	fec_insercion TIMESTAMP NOT NULL,
	fec_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	usuario INT NOT NULL,
	estado CHAR(1) NOT NULL,
	PRIMARY KEY(id_persona),
	FOREIGN KEY(id_empresa) REFERENCES empresa(id_empresa)
)ENGINE=INNODB;

CREATE TABLE _usuarios(
	id_usuario INT NOT NULL AUTO_INCREMENT,
	id_persona INT NOT NULL,
	usuario1 VARCHAR(30) NOT NULL,
	clave VARCHAR(100) NOT NULL,
	fec_insercion TIMESTAMP NOT NULL,
	fec_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	usuario INT NOT NULL,
	estado CHAR(1) NOT NULL,
	PRIMARY KEY(id_usuario),
	FOREIGN KEY(id_persona) REFERENCES _personas(id_persona)
)ENGINE=INNODB;

CREATE TABLE _roles(
	id_rol INT NOT NULL AUTO_INCREMENT,
	rol VARCHAR(30) NOT NULL,
	fec_insercion TIMESTAMP NOT NULL,
	fec_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	usuario INT NOT NULL,
	estado CHAR(1) NOT NULL,
	PRIMARY KEY(id_rol)
)ENGINE=INNODB;

CREATE TABLE _usuarios_roles(
	id_usuario_rol INT NOT NULL AUTO_INCREMENT,
	id_usuario INT NOT NULL,
	id_rol INT NOT NULL,
	fec_insercion TIMESTAMP NOT NULL,
	fec_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	usuario INT NOT NULL,
	estado CHAR(1) NOT NULL,
	PRIMARY KEY(id_usuario_rol),
	FOREIGN KEY(id_usuario) REFERENCES _usuarios(id_usuario)
)ENGINE=INNODB;

CREATE TABLE _grupos(
	id_grupo INT NOT NULL AUTO_INCREMENT,
	grupo VARCHAR(30) NOT NULL,
	fec_insercion TIMESTAMP NOT NULL,
	fec_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	usuario INT NOT NULL,
	estado CHAR(1) NOT NULL,
	PRIMARY KEY(id_grupo)
)ENGINE=INNODB;

CREATE TABLE _opciones(
	id_opcion INT NOT NULL AUTO_INCREMENT,
	id_grupo INT NOT NULL,
	opcion VARCHAR(30) NOT NULL,
	contenido VARCHAR(100) NOT NULL,
	orden VARCHAR(30) NOT NULL,
	fec_insercion TIMESTAMP NOT NULL,
	fec_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	usuario INT NOT NULL,
	estado CHAR(1) NOT NULL,
	PRIMARY KEY(id_opcion),
	FOREIGN KEY(id_grupo) REFERENCES _grupos(id_grupo)
)ENGINE=INNODB;

CREATE TABLE _accesos(
	id_acceso INT NOT NULL AUTO_INCREMENT,
	id_opcion INT NOT NULL,
	id_rol INT NOT NULL,
	fec_insercion TIMESTAMP NOT NULL,
	fec_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	usuario INT NOT NULL,
	estado CHAR(1) NOT NULL,
	PRIMARY KEY(id_acceso),
	FOREIGN KEY(id_opcion) REFERENCES _opciones(id_opcion),
	FOREIGN KEY(id_rol) REFERENCES _roles(id_rol)
)ENGINE=INNODB;
/*****************************************INSERCION DE DATOS**********************************************************/
INSERT INTO empresa VALUES(1, 'MULTIHERRAMIENTAS', 'logo.png', 'Av. Belgrano', '3435450', now(), now(), 1, 1);

INSERT INTO proveedores VALUES(1, 1, 'BAUMANN REP. S.R.L.', 'Av. Brasil esq. Calle #1 - Santa Cruz','3435450', now(), now(), 1, 1);
INSERT INTO proveedores VALUES(2, 1, 'ELECTRO RED BOLIVIA S.R.L.', 'Av. Ismael Montes y Av. Uruguay La Paz','2282428', now(), now(), 1, 1);
INSERT INTO proveedores VALUES(3, 1, 'FERRETERIA AMERICA IMP. & REP.', 'Calle Uruguay #547 Cochabamba','4229019', now(), now(), 1, 1);
INSERT INTO proveedores VALUES(4, 1, 'HANSA LTDA.', 'Av. 6 de Marzo km 3 - La Paz','2811654', now(), now(), 1, 1);
INSERT INTO proveedores VALUES(5, 1, 'HERRACRUZ S.A.', 'Av. Roca y Coronado N°295 - Santa Cruz','3541073', now(), now(), 1, 1);
INSERT INTO proveedores VALUES(6, 1, 'MERCANTIL LEON S.R.L.', 'Av. Viedma N°51 Santa Cruz','3326174', now(), now(), 1, 1);
INSERT INTO proveedores VALUES(7, 1, 'OXICRUZ', 'Av. Uruguay #733','3346036', now(), now(), 1, 1);
INSERT INTO proveedores VALUES(8, 1, 'SALCEDO IMPORTACIONES S.R.L.', 'Av. Villazon km5 carretera Sacaba - Cbba','4231271', now(), now(), 1, 1);
INSERT INTO proveedores VALUES(9, 1, 'VADIKO S.R.L.', 'Av. Japon #3220 - Santa cruz','3414097', now(), now(), 1, 1);
INSERT INTO proveedores VALUES(10, 1, 'WAKO IMPORTACIONES S.R.L.', 'Av. Pedro Rivera N°3550 - Santa Cruz','3488929', now(), now(), 1, 1);

INSERT INTO productos VALUES(1, 8,'Alicate de corte 5"','TR-17314','TRUPER','MEXICO', now(), now(), 1, 1);
INSERT INTO productos VALUES(2, 8,'Cable c/gancho de stop p/liniero','TR-16023','TRUPER','MEXICO', now(), now(), 1, 1);
INSERT INTO productos VALUES(3, 10,'Compás interno 6"','730-1','GEDORE','BRASIL', now(), now(), 1, 1);
INSERT INTO productos VALUES(4, 5,'Compresimetro','912G1','FORCE','TAIWAN', now(), now(), 1, 1);
INSERT INTO productos VALUES(5, 6,'Escalera extensible 32peld','DXL3020-32','DEWALT','MEXICO', now(), now(), 1, 1);
INSERT INTO productos VALUES(6, 2,'Escalera extensible 28pel','D5028-MX','WERNER','MEXICO', now(), now(), 1, 1);
INSERT INTO productos VALUES(7, 5,'Guantes p/soldador','GSA11470','RINO','BRASIL', now(), now(), 1, 1);
INSERT INTO productos VALUES(8, 4,'Hidrometro p/bateria','79-046','STANLEY','BRASIL', now(), now(), 1, 1);
INSERT INTO productos VALUES(9, 3,'Porta Macho nº6 1/4" - 3/4"','M6-M20','SCK','JAPON', now(), now(), 1, 1);
INSERT INTO productos VALUES(10, 10,'Prensa gatillo 24"','524QCN','IRWIN','BRASIL', now(), now(), 1, 1);
INSERT INTO productos VALUES(11, 10,'Micrometro ext. 125-150mm.','1MXRL-150','STARRETT','BRASIL', now(), now(), 1, 1);
INSERT INTO productos VALUES(12, 10,'Rotomartillo SDS-MAX 1100 W.','HR4013C','MAKITA','JAPON', now(), now(), 1, 1);
INSERT INTO productos VALUES(13, 8,'Alicate para filtro de aceite','TR-18284','TRUPER','MEXICO', now(), now(), 1, 1);

INSERT INTO productos_precios VALUES(1, 4,'2020-01-10',1029.9,965,'2020-02-19', now(), now(), 1, 1);
INSERT INTO productos_precios VALUES(2, 7,'2020-01-10',34.7,32.5,'2020-07-21', now(), now(), 1, 1);
INSERT INTO productos_precios VALUES(3, 8,'2020-01-27',62.6,71.2,'2020-07-21', now(), now(), 1, 1);
INSERT INTO productos_precios VALUES(4, 9,'2020-02-03',92.2,121,'2020-07-21', now(), now(), 1, 1);
INSERT INTO productos_precios VALUES(5, 1,'2020-02-07',28.5,29,'2020-07-21', now(), now(), 1, 1);
INSERT INTO productos_precios VALUES(6, 2,'2020-02-07',427.3,429,'2020-07-21', now(), now(), 1, 1);
INSERT INTO productos_precios VALUES(7, 3,'2020-08-11',118.3,126.6,'2020-07-21', now(), now(), 1, 1);
INSERT INTO productos_precios VALUES(8, 10,'2020-08-11',208.8,223.6,'2020-07-21', now(), now(), 1, 1);
INSERT INTO productos_precios VALUES(9, 5,'2020-08-20',2371.7,3175,'2020-07-21', now(), now(), 1, 1);
INSERT INTO productos_precios VALUES(10, 6,'2020-08-20',2186.3,2936.8,'2020-07-21', now(), now(), 1, 1);
INSERT INTO productos_precios VALUES(11, 13,'2021-07-10',90.3,110,'2020-07-31', now(), now(), 1, 1);

INSERT INTO compras VALUES(1, 5, 1111,'CREDITO','BOLIVIANOS','2020-08-20',2066.5, now(), now(), 1, 1);
INSERT INTO compras VALUES(2, 4, 2222,'CONTADO','DOLARES','2020-01-10',212.8, now(), now(), 1, 1);
INSERT INTO compras VALUES(3, 3, 3333,'CREDITO','BOLIVIANOS','2020-01-10',451.8, now(), now(), 1, 1);
INSERT INTO compras VALUES(4, 8, 4444,'CONTADO','BOLIVIANOS','2020-01-27',1282.1, now(), now(), 1, 1);
INSERT INTO compras VALUES(5, 10, 5555,'CONTADO','DOLARES','2020-02-03',3062.1, now(), now(), 1, 1);
INSERT INTO compras VALUES(6, 6, 6666,'CONTADO','DOLARES','2020-02-07',2371.7, now(), now(), 1, 1);
INSERT INTO compras VALUES(7, 2, 7777,'CREDITO','BOLIVIANOS','2020-02-07',6372.6, now(), now(), 1, 1);
INSERT INTO compras VALUES(8, 1, 000,'CREDITO','BOLIVIANOS','2021-06-07',6372.6, now(), now(), 1, 1);
INSERT INTO compras VALUES(9, 7, 000,'CREDITO','BOLIVIANOS','2021-06-10',6372.6, now(), now(), 1, 1);

INSERT INTO detalles_compras VALUES(1, 1, 1, 2,30, 2059.8, now(), now(), 1, 1);
INSERT INTO detalles_compras VALUES(2, 1, 2, 18,30, 624.6, now(), now(), 1, 1);
INSERT INTO detalles_compras VALUES(3, 2, 3, 4,15, 250.4, now(), now(), 1, 1);
INSERT INTO detalles_compras VALUES(4, 3, 4, 5,2, 461, now(), now(), 1, 1);
INSERT INTO detalles_compras VALUES(5, 4, 5, 15,25, 427.5, now(), now(), 1, 1);
INSERT INTO detalles_compras VALUES(6, 4, 6, 3,25, 1281.9, now(), now(), 1, 1);
INSERT INTO detalles_compras VALUES(7, 5, 7, 20,20, 2366, now(), now(), 1, 1);
INSERT INTO detalles_compras VALUES(8, 5, 8, 7,20, 1461.6, now(), now(), 1, 1);
INSERT INTO detalles_compras VALUES(9, 6, 9, 1,0, 2371.7, now(), now(), 1, 1);
INSERT INTO detalles_compras VALUES(10, 7, 10, 2,0, 2186.3, now(), now(), 1, 1);

INSERT INTO clientes VALUES(1, 1,'1838728017', 'PEDRO', 'SOLIZ','77878334', now(), now(), 1, 1);
INSERT INTO clientes VALUES(2, 1,'5011515', 'EIBER', 'TAPIA','76183790', now(), now(), 1, 1);
INSERT INTO clientes VALUES(3, 1,'3847041012', 'JULIAN', 'ESCOBAR','73498722', now(), now(), 1, 1);
INSERT INTO clientes VALUES(4, 1,'4156502015', 'IBAN', 'FERNANDEZ','72995639', now(), now(), 1, 1);
INSERT INTO clientes VALUES(5, 1,'5013324015', 'JOSE', 'SALGADO','72957775', now(), now(), 1, 1);
INSERT INTO clientes VALUES(6, 1,'7109480017', 'OMAR', 'DONAIRE','75126164', now(), now(), 1, 1);
INSERT INTO clientes VALUES(7, 1,'1842094013', 'DANIEL', 'MAJLUF','70220874', now(), now(), 1, 1);
INSERT INTO clientes VALUES(8, 1,'7170431', 'EMANUEL', 'VALDEZ','72980745', now(), now(), 1, 1);
INSERT INTO clientes VALUES(9, 1,'7179515012', ' JUAN PABLO', 'VEGA','75135366', now(), now(), 1, 1);
INSERT INTO clientes VALUES(10, 1,'4455205013', 'BISMARK', 'MOLINA','60274122', now(), now(), 1, 1);
INSERT INTO clientes VALUES(11, 1,'4015419010', 'MARIEL', 'BARRAGAN','', now(), now(), 1, 1);
INSERT INTO clientes VALUES(12, 1,'1024361027', 'MILCAST CORP. S.R.L.', '','466-42552', now(), now(), 1, 1);

INSERT INTO ventas VALUES(1, 7,1,'CREDITO','2020-04-20', 493, now(), now(), 1, 1);
INSERT INTO ventas VALUES(2, 1,2,'CONTADO','2020-05-15', 1930, now(), now(), 1, 1);
INSERT INTO ventas VALUES(3, 4,3,'CREDITO','2020-06-04', 290, now(), now(), 1, 1);
INSERT INTO ventas VALUES(4, 9,4,'CREDITO','2020-07-10', 1118, now(), now(), 1, 1);
INSERT INTO ventas VALUES(5, 10,5,'CONTADO','2020-08-15', 1861, now(), now(), 1, 1);
INSERT INTO ventas VALUES(6, 2,6,'CREDITO','2020-09-08', 2120, now(), now(), 1, 1);
INSERT INTO ventas VALUES(7, 2,7,'CONTADO','2020-09-11', 3079, now(), now(), 1, 1);
INSERT INTO ventas VALUES(8, 6,8,'CONTADO','2020-09-21', 1118, now(), now(), 1, 1);
/**/
INSERT INTO ventas VALUES(9, 3,9,'CONTADO','2021-01-10', 2019.5, now(), now(), 1, 1);
INSERT INTO ventas VALUES(10, 5,10,'CONTADO','2021-02-15', 500.5, now(), now(), 1, 1);
INSERT INTO ventas VALUES(11, 8,11,'CONTADO','2021-03-05', 987, now(), now(), 1, 1);
INSERT INTO ventas VALUES(12, 10,12,'CONTADO','2021-04-25', 201.6, now(), now(), 1, 1);
INSERT INTO ventas VALUES(13, 1,13,'CONTADO','2021-04-28', 385, now(), now(), 1, 1);
INSERT INTO ventas VALUES(14, 7,14,'CONTADO','2021-05-12', 100, now(), now(), 1, 1);
INSERT INTO ventas VALUES(15, 6,15,'CONTADO','2021-05-19', 999, now(), now(), 1, 1);

INSERT INTO detalles_ventas VALUES(1, 1, 4, 3, 0, 363, now(), now(), 1, 1);
INSERT INTO detalles_ventas VALUES(2, 1, 2, 4, 0, 130, now(), now(), 1, 1);
INSERT INTO detalles_ventas VALUES(3, 2, 1, 2, 0, 1930, now(), now(), 1, 1);
INSERT INTO detalles_ventas VALUES(4, 3, 5, 10, 0, 290, now(), now(), 1, 1);
INSERT INTO detalles_ventas VALUES(5, 4, 2, 8, 0, 260, now(), now(), 1, 1);
INSERT INTO detalles_ventas VALUES(6, 4, 6, 2, 0, 858, now(), now(), 1, 1);
INSERT INTO detalles_ventas VALUES(7, 5, 7, 15, 2, 1899, now(), now(), 1, 1);
INSERT INTO detalles_ventas VALUES(8, 6, 10, 1, 3, 2186.3, now(), now(), 1, 1);
INSERT INTO detalles_ventas VALUES(9, 7, 9, 1, 3, 3175, now(), now(), 1, 1);
INSERT INTO detalles_ventas VALUES(10, 8, 8, 5, 0, 1118, now(), now(), 1, 1);

INSERT INTO existencias VALUES(1, 1, 5, 4, 5, now(), now(), 1, 1);
INSERT INTO existencias VALUES(2, 2, 6, 6, 1, now(), now(), 1, 1);
INSERT INTO existencias VALUES(3, 3, 7, 7, 5, now(), now(), 1, 1);
INSERT INTO existencias VALUES(4, 4, 1, 3, 0, now(), now(), 1, 1);
INSERT INTO existencias VALUES(5, 5, 9, 9, 0, now(), now(), 1, 1);
INSERT INTO existencias VALUES(6, 6, 10, 8, 1, now(), now(), 1, 1);
INSERT INTO existencias VALUES(7, 7, 2, 2, 14, now(), now(), 1, 1);
INSERT INTO existencias VALUES(8, 8, 2, 5, 10, now(), now(), 1, 1);
INSERT INTO existencias VALUES(9, 9, 3, 1, 1, now(), now(), 1, 1);
INSERT INTO existencias VALUES(10, 10, 4, 1, 2, now(), now(), 1, 1);
INSERT INTO existencias VALUES(11, 11, 8, 10, 2, now(), now(), 1, 1);


/*******************************INSERCION DE DATOS TABLAS DE SEGURIDAD*****************************************************/
INSERT INTO _personas VALUES(1, 1, '10673212', 'FELICINDO', 'BARRIENTOS', 'RODAS', '60266451', 'B.ARTESANAL','M', now(), now(), 1,1);
INSERT INTO _personas VALUES(2, 1, '10652035', 'CAROLINA', 'BARRIENTOS', 'URZAGASTE', '75133930', 'B.ARTESANAL','F', now(), now(), 1,1);
INSERT INTO _personas VALUES(3, 1, '75226622', 'ARIEL', 'CASTRO', '', '75133930', 'B.PANOSAS','M', now(), now(), 1,1);
INSERT INTO _personas VALUES(4, 1, '52820023', 'PEPE', 'VARGAS', 'AMADOR', '75569212', 'B.LOMA','M', now(), now(), 1,1);
INSERT INTO _personas VALUES(5, 1, '58236666', 'JUANA', 'LOPEZ', 'ALEMAN', '73695522', 'B.ARANJUEZ','F', now(), now(), 1,1);
INSERT INTO _personas VALUES(6, 1, '95333333', 'JOSE', 'VILLA', '', '796234555', 'B.MORROS BLANCOS','M', now(), now(), 1,1);
INSERT INTO _personas VALUES(7, 1, '86523666', 'ANDRES', 'BRAVO', 'ALBA', '68235522', 'B.SAN BERNARDO','M', now(), now(), 1,1);
INSERT INTO _personas VALUES(8, 1, '526662222', 'ANDREA', 'ROMERO', 'ESCOBAR', '823665533', 'B.ROSEDAL','F', now(), now(), 1,1);
INSERT INTO _personas VALUES(9, 1, '826622233', 'ANDY', 'QUISPE', '', '65233223', 'B.TORRECILLAS','F', now(), now(), 1,1);
INSERT INTO _personas VALUES(10, 1, '952333354', 'MARLENE', 'GUTIERREZ', 'BARRIENTOS', '82212333', 'B.JUAN XXIII','F', now(), now(), 1,1);
INSERT INTO _personas VALUES(11, 1, '322333366', 'BLANCA', 'SANCHEZ', 'GAITE', '8223665566', 'B.SENAC','F', now(), now(), 1,1);
INSERT INTO _personas VALUES(12, 1, '568223333', 'LOLA', 'PEREZ', 'VILTE', '6236545666', 'B.AVAROA','F', now(), now(), 1,1);

INSERT INTO _usuarios VALUES(1, 1, 'admin', '$2y$10$HxB1sZ3p/ok/Aa3cyATcsuGZoUrZzW5.TtmaiYh61S38axFgKVmXK', now(), now(), 1,1);
INSERT INTO _usuarios VALUES(2, 2, 'carito', '$2y$10$27/agqDOgNIXGqtArne6deTX4S7HMe75xvtw9Jj2FvzppcSrMoeMK', now(), now(), 1,1);
INSERT INTO _usuarios VALUES(3, 4, 'pepe', '$2y$10$JXISRixupObqqE/0ax2Tl.OpzBw1E.05IKSwtTmyDMlaBr88.yUTW', now(), now(), 1,1);
INSERT INTO _usuarios VALUES(4, 10, 'marlene', '$2y$10$R6kElho/ntZYhLrUq498meVJWWszEBsEfL4f8YFvfvvCfLynsh56a', now(), now(), 1,1);

INSERT INTO _roles VALUES(1, 'ADMINISTRADOR', now(), now(), 1,1);
INSERT INTO _roles VALUES(2, 'USUARIO PRUEBA 1', now(), now(), 1,1);
INSERT INTO _roles VALUES(3, 'USUARIO PRUEBA 2', now(), now(), 1,1);
INSERT INTO _roles VALUES(4, 'USUARIO PRUEBA 3', now(), now(), 1,1);

INSERT INTO _usuarios_roles VALUES(1, 1, 1, now(), now(), 1,1);
INSERT INTO _usuarios_roles VALUES(2, 2, 2, now(), now(), 1,1);
INSERT INTO _usuarios_roles VALUES(3, 3, 3, now(), now(), 1,1);
INSERT INTO _usuarios_roles VALUES(4, 4, 4, now(), now(), 1,1);

INSERT INTO _grupos VALUES(1, 'HERRAMIENTAS', now(), now(), 1,1);
INSERT INTO _grupos VALUES(2, 'EMPRESA', now(), now(), 1,1);
INSERT INTO _grupos VALUES(3, 'REPORTES', now(), now(), 1,1);

INSERT INTO _opciones VALUES(1, 1, 'Personas', '../privada/personas/personas.php', 10, now(), now(), 1,1);
INSERT INTO _opciones VALUES(2, 1, 'Usuarios', '../privada/usuarios/usuarios.php', 20, now(), now(), 1,1);
INSERT INTO _opciones VALUES(3, 1, 'Grupos', '../privada/grupos/grupos.php', 30, now(), now(), 1,1);
INSERT INTO _opciones VALUES(4, 1, 'Roles', '../privada/roles/roles.php', 40, now(), now(), 1,1);
INSERT INTO _opciones VALUES(5, 1, 'Usuarios Roles', '../privada/usuarios_roles/usuarios_roles.php', 50, now(), now(), 1,1);
INSERT INTO _opciones VALUES(6, 1, 'Opciones', '../privada/opciones/opciones.php', 60, now(), now(), 1,1);
INSERT INTO _opciones VALUES(7, 1, 'Accesos', '../privada/accesos/accesos.php', 70, now(), now(), 1,1);

INSERT INTO _opciones VALUES(8, 2, 'Datos Empresa', '../privada/empresa/empresa.php', 10, now(), now(), 1,1);
INSERT INTO _opciones VALUES(9, 2, 'Proveedores','../privada/proveedores/proveedores.php', 20, now(), now(), 1,1);
INSERT INTO _opciones VALUES(10, 2, 'Productos','../privada/productos/productos.php', 30, now(), now(), 1,1);
INSERT INTO _opciones VALUES(11, 2, 'Productos Precios','../privada/productos_precios/productos_precios.php', 40, now(), now(), 1,1);
INSERT INTO _opciones VALUES(12, 2, 'Compras','../privada/compras/compras.php', 50, now(), now(), 1,1);
INSERT INTO _opciones VALUES(13, 2, 'Clientes','../privada/clientes/clientes.php', 60, now(), now(), 1,1);
INSERT INTO _opciones VALUES(14, 2, 'Ventas','../privada/ventas/ventas.php', 70, now(), now(), 1,1);

INSERT INTO _opciones VALUES(15, 3, 'Rpt de Personas Usuarios','../privada/reportes/personas_usuarios.php', 10, now(), now(), 1,1);
INSERT INTO _opciones VALUES(16, 3, 'Rpt de Personas por Fecha','../privada/reportes/personas_fechas.php', 20, now(), now(), 1,1);
INSERT INTO _opciones VALUES(17, 3, 'Rpt de Productos Precios','../privada/reportes/productos_pre.php', 30, now(), now(), 1,1);
INSERT INTO _opciones VALUES(18, 3, 'Rpt de Ventas','../privada/reportes/ventas_fechas.php', 40, now(), now(), 1,1);
INSERT INTO _opciones VALUES(19, 3, 'Rpt de Proveedores','../privada/reportes/rpt_proveedores.php', 50, now(), now(), 1,1);
INSERT INTO _opciones VALUES(20, 3, 'Rpt de Compras','../privada/reportes/compras_fechas.php', 60, now(), now(), 1,1);
INSERT INTO _opciones VALUES(21, 3, 'Rpt de Clientes','../privada/reportes/rpt_clientes.php', 70, now(), now(), 1,1);
INSERT INTO _opciones VALUES(22, 3, 'Rpt de Existencias por Fecha','../privada/reportes/existencias_fechas.php', 80, now(), now(), 1,1);
INSERT INTO _opciones VALUES(23, 3, 'Rpt de Personas x Genero','../privada/reportes/rpt_personas_genero.php', 90, now(), now(), 1,1);
INSERT INTO _opciones VALUES(24, 3, 'Rpt de Compras x su tipo','../privada/reportes/rpt_tipo_compras.php', 100, now(), now(), 1,1);
INSERT INTO _opciones VALUES(25, 3, 'Ficha Técnica de Personas','../privada/reportes/fichas_tecnicas_personas.php', 110, now(), now(), 1,1);
INSERT INTO _opciones VALUES(26, 3, 'Ficha Técnica de Productos','../privada/reportes/fichas_tecnicas_productos.php', 120, now(), now(), 1,1);
INSERT INTO _opciones VALUES(27, 3, 'Rpt de Ventas x su tipo','../privada/reportes/rpt_tipo_ventas.php', 130, now(), now(), 1,1);
INSERT INTO _opciones VALUES(28, 3, 'Ficha Técnica de Compras','../privada/reportes/fichas_tecnicas_compras.php', 140, now(), now(), 1,1);


INSERT INTO _accesos VALUES(1, 1, 1, now(), now(), 1,1);
INSERT INTO _accesos VALUES(2, 2, 1, now(), now(), 1,1);
INSERT INTO _accesos VALUES(3, 3, 1, now(), now(), 1,1);
INSERT INTO _accesos VALUES(4, 4, 1, now(), now(), 1,1);
INSERT INTO _accesos VALUES(5, 5, 1, now(), now(), 1,1);
INSERT INTO _accesos VALUES(6, 6, 1, now(), now(), 1,1);
INSERT INTO _accesos VALUES(7, 7, 1, now(), now(), 1,1);
INSERT INTO _accesos VALUES(8, 8, 1, now(), now(), 1,1);
INSERT INTO _accesos VALUES(9, 9, 1, now(), now(), 1,1);
INSERT INTO _accesos VALUES(10, 10, 1, now(), now(), 1,1);
INSERT INTO _accesos VALUES(11, 11, 1, now(), now(), 1,1);
INSERT INTO _accesos VALUES(12, 12, 1, now(), now(), 1,1);
INSERT INTO _accesos VALUES(13, 13, 1, now(), now(), 1,1);
INSERT INTO _accesos VALUES(14, 14, 1, now(), now(), 1,1);
INSERT INTO _accesos VALUES(15, 15, 1, now(), now(), 1,1);
INSERT INTO _accesos VALUES(16, 16, 1, now(), now(), 1,1);
INSERT INTO _accesos VALUES(17, 17, 1, now(), now(), 1,1);
INSERT INTO _accesos VALUES(18, 18, 1, now(), now(), 1,1);
INSERT INTO _accesos VALUES(19, 19, 1, now(), now(), 1,1);

INSERT INTO _accesos VALUES(20, 1, 2, now(), now(), 1,1);
INSERT INTO _accesos VALUES(21, 2, 2, now(), now(), 1,1);
INSERT INTO _accesos VALUES(22, 5, 2, now(), now(), 1,1);
INSERT INTO _accesos VALUES(23, 8, 2, now(), now(), 1,1);
INSERT INTO _accesos VALUES(24, 10, 2, now(), now(), 1,1);
INSERT INTO _accesos VALUES(25, 13, 2, now(), now(), 1,1);
INSERT INTO _accesos VALUES(26, 15, 2, now(), now(), 1,1);

INSERT INTO _accesos VALUES(27, 13, 3, now(), now(), 1,1);
INSERT INTO _accesos VALUES(28, 16, 3, now(), now(), 1,1);
INSERT INTO _accesos VALUES(29, 17, 3, now(), now(), 1,1);
INSERT INTO _accesos VALUES(30, 18, 3, now(), now(), 1,1);
INSERT INTO _accesos VALUES(31, 19, 3, now(), now(), 1,1);

INSERT INTO _accesos VALUES(32, 20, 1, now(), now(), 1,1);
INSERT INTO _accesos VALUES(33, 21, 1, now(), now(), 1,1);
INSERT INTO _accesos VALUES(34, 22, 1, now(), now(), 1,1);

INSERT INTO _accesos VALUES(35, 1, 4, now(), now(), 1,1);
INSERT INTO _accesos VALUES(36, 2, 4, now(), now(), 1,1);
INSERT INTO _accesos VALUES(37, 9, 4, now(), now(), 1,1);
INSERT INTO _accesos VALUES(38, 13, 4, now(), now(), 1,1);

INSERT INTO _accesos VALUES(39, 23, 1, now(), now(), 1,1);
INSERT INTO _accesos VALUES(40, 24, 1, now(), now(), 1,1);
INSERT INTO _accesos VALUES(41, 25, 1, now(), now(), 1,1);
INSERT INTO _accesos VALUES(42, 26, 1, now(), now(), 1,1);
INSERT INTO _accesos VALUES(43, 27, 1, now(), now(), 1,1);
INSERT INTO _accesos VALUES(44, 28, 1, now(), now(), 1,1);

/*
SELECT DISTINCT TABLE_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME = 'id_cliente'
AND TABLE_SCHEMA = 'bd_'
*/