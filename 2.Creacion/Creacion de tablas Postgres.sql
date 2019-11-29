create table INGREDIENTES
(
	CODIGO varchar(3),
	NOMBRE varchar(40),
	TIPO varchar(20),
	constraint PRI_INGREDIENTES primary key (CODIGO),
    constraint NULO_NOMBRE_ING check (NOMBRE is not null),
    constraint UNICO_NOMBRE_ING unique (NOMBRE)
);

create table COMPOSICION_ING_PREPARADOS
(
	COD_ING_BASE varchar(3),
	COD_ING_FINAL varchar(3),
	CANTIDAD varchar(20),
	constraint PRI_COMPOSICION_ING primary key (COD_ING_BASE, COD_ING_FINAL),
	constraint FK_COMPOSICION_ING_BASE foreign key (COD_ING_BASE) references INGREDIENTES (CODIGO),
	constraint FK_COMPOSICION_ING_FINAL foreign key (COD_ING_FINAL) references INGREDIENTES (CODIGO),
    constraint CANTIDAD_COMP_FORMAT check (CANTIDAD ~ '^[1-8]?[0-9]{1}([\.]([0-9]){0,1}[0-9])?[UGL]$'),
    constraint NULO_CANTIDAD_PREP check (CANTIDAD is not null)
);

create table INVESTIGADORES
(
	NIF varchar(9),
	NOMBRE varchar(20),
	APELLIDOS varchar(50),
	DIRECCION varchar(100),
	TELEFONO varchar(9),
	ESPECIALIDAD varchar(20),
	constraint PRI_INVESTIGADORES primary key (NIF),
	constraint NIF_INV_FORMAT check (NIF ~ '^[0-9]{8}[A-Z]$' or NIF ~ '^[KLMXYZ][0-9]{7}[A-Z]$'),
	constraint NULL_TELEFONO_INV check (TELEFONO is not null),
    constraint NULO_NOMBRE_INV check (NOMBRE is not null),
    constraint NULO_APELLIDOS_INV check (APELLIDOS is not null),
    constraint UNICO_TELEFONO_INV unique (TELEFONO)
);

create table EXPERIMENTOS
(
    CODIGO varchar(7),
    NIF_INV varchar(9),
    NOMBRE varchar(100),
    FECHA_INICIO date,
    FECHA_FIN date,
    constraint PRI_EXPERIMENTOS primary key (CODIGO),
    constraint COD_EXP_FORMAT check (CODIGO ~ '^[A-Z][0-9]{4}-[A-Z]$'),
    constraint FK_EXPERIMENTOS_NIF foreign key (NIF_INV) references INVESTIGADORES (NIF),
    constraint TITLE_NOMBRE check (NOMBRE = initcap(NOMBRE)),
    constraint F_INICIO_PRIMERA_SEMANA check (to_char (FECHA_INICIO, 'W') = '1'),
    constraint NULO_NOMBRE_EXP check (NOMBRE is not null),
    constraint NULO_FECHA_INICIO check(FECHA_INICIO is not null)
);

create table VERSIONES
(
    CODIGO varchar(5),
    COD_EXP varchar(7),
    FECHA_PRUEBA timestamp,
    constraint PRI_VERSIONES primary key (CODIGO, COD_EXP),
    constraint FK_VERS_COD_EXP foreign key (COD_EXP) references EXPERIMENTOS (CODIGO),
    constraint COD_VERS_FORMAT check (CODIGO ~ '^[0-9]{1,2}\.{1}[0-9]{1,2}(\.[0-9]{1,2})*$' and CODIGO not like '%.'),
    constraint FECHA_PRUEBA_SABADO check (to_char(FECHA_PRUEBA, 'D') = '7'),
    constraint HORA_PRUEBA check (to_char(FECHA_PRUEBA, 'HH24:MI') between '11:00' and '14:00')
);

create table COLABORACIONES
(
    COD_EXP varchar(7),
    COD_VERS varchar(5),
    NIF_INV varchar(9),
    constraint PRI_COLABORACIONES primary key (COD_EXP, COD_VERS, NIF_INV),
    constraint FK_COLAB_COD_EXP foreign key (COD_EXP, COD_VERS) references VERSIONES (COD_EXP, CODIGO),
    constraint FK_COLAB_NIF_INV foreign key (NIF_INV) references INVESTIGADORES (NIF)
);


create table INGREDIENTES_POR_VERSION
(
    COD_ING varchar(3),
    COD_EXP varchar(7),
    COD_VERS varchar(5),
    CANTIDAD varchar(10),
    constraint PRI_INGR_POR_VERS primary key (COD_ING, COD_EXP, COD_VERS),
    constraint FK_ING_VERS_ING foreign key (COD_ING) references INGREDIENTES (CODIGO),
    constraint FK_ING_VERS_EXP foreign key (COD_EXP, COD_VERS) references VERSIONES (COD_EXP, CODIGO),
    constraint CANTIDAD_FORMAT check (CANTIDAD ~ '^[1-8]?[0-9]{1}([\.]([0-9]){0,1}[0-9])?[UGL]$'),
    constraint CANTIDAD_NO_EMP_PUNTO check (CANTIDAD not like '.%'),
    constraint NULO_CANTIDAD_POR_VERSION check(CANTIDAD is not null)
);


create table CATADORES
(
    NIF varchar(9),
    NOMBRE varchar(20),
    APELLIDOS varchar(50),
	DIRECCION varchar(100),
	TELEFONO varchar(9),
    constraint PRI_CATADORES primary key (NIF),
    constraint NIF_CAT_FORMAT check (NIF ~ '^[0-9]{8}[A-Z]$' or NIF ~ '^[KLMXYZ][0-9]{7}[A-Z]$'),
    constraint NULL_TELEFONO_CAT check (TELEFONO is not null),
    constraint NULO_NOMBRE_CAT check (NOMBRE is not null),
    constraint NULO_APELLIDOS_CAT check (APELLIDOS is not null),
    constraint UNICO_TELEFONO_CAT unique (TELEFONO)
);


create table ASPECTOS
(
    CODIGO varchar(3),
    DESCRIPCION varchar(50),
    IMPORTANCIA varchar(8),
    constraint PRI_ASPECTOS primary key (CODIGO),
    constraint IMPORTANCIA_FORMAT check (upper(IMPORTANCIA) in ('MUY ALTA', 'ALTA', 'MEDIA', 'BAJA')),
    constraint NULO_DESCRCIPCION_ASP check (DESCRIPCION is not null)
);


create table PUNTUACIONES
(
    NIF_CAT varchar(9),
    COD_ASP varchar(3),
    COD_EXP varchar(7),
    COD_VERS varchar(5),
    VALOR numeric (4,2),
    constraint PRI_PUNTUACIONES primary key (NIF_CAT, COD_ASP, COD_EXP, COD_VERS),
    constraint FK_PUNT_NIF_CAT foreign key (NIF_CAT) references CATADORES (NIF),
    constraint FK_PUNT_ASP foreign key (COD_ASP) references ASPECTOS (CODIGO),
    constraint FK_PUNT_EXP foreign key (COD_EXP, COD_VERS) references VERSIONES (COD_EXP, CODIGO),
    constraint NULO_VALOR_PUN check (VALOR is not null)
);
