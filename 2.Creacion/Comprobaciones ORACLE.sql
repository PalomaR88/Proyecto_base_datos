
INGREDIENTES
drop table INGREDIENTES;

insert into INGREDIENTES (NOMBRE,TIPO) values ('agua','otro');
insert into INGREDIENTES values ('A','agua','otro');
insert into INGREDIENTES values ('F','nata','lacteo');





COMPOSICION_ING_PREPARADOS
drop table COMPOSICION_ING_PREPARADOS;

insert into COMPOSICION_ING_PREPARADOS (COD_ING_BASE, CANTIDAD) values ('A','60ml');
insert into COMPOSICION_ING_PREPARADOS (COD_ING_FINAL, CANTIDAD) values ('F','60ml');
insert into COMPOSICION_ING_PREPARADOS values ('AJO','F','60ml');

insert into COMPOSICION_ING_PREPARADOS values ('A','AJO','60ml');
insert into COMPOSICION_ING_PREPARADOS values ('AU','AV','95U');
insert into COMPOSICION_ING_PREPARADOS values ('AU','AV','100U');

insert into COMPOSICION_ING_PREPARADOS values ('AU','AV','444U');
insert into COMPOSICION_ING_PREPARADOS values ('A','F','0.06L');




INVESTIGADORES
drop table INVESTIGADORES;

insert into INVESTIGADORES (NOMBRE, APELLIDOS, DIRECCION, TELEFONO, ESPECIALIDAD) values ('Francisco', 'Varela', 'C/ Magnolia, nº 15, 1A. Sevilla', '654948520', 'Setas');
insert into INVESTIGADORES values ('9090698G', 'Fernando', 'Tirado', 'Av/ Reyes Católicos, nº 4. Dos Hermanas, Sevilla', '692474858','Pescado');
insert into INVESTIGADORES values ('449090698G', 'Fernando', 'Tirado', 'Av/ Reyes Católicos, nº 4. Dos Hermanas, Sevilla', '692474858','Pescado');

insert into INVESTIGADORES values ('4909069GG', 'Fernando', 'Tirado', 'Av/ Reyes Católicos, nº 4. Dos Hermanas, Sevilla', '692474858','Pescado');
insert into INVESTIGADORES values ('4909069G', 'Fernando', 'Tirado', 'Av/ Reyes Católicos, nº 4. Dos Hermanas, Sevilla', '692474858','Pescado');
insert into INVESTIGADORES values ('490906988', 'Fernando', 'Tirado', 'Av/ Reyes Católicos, nº 4. Dos Hermanas, Sevilla', '692474858','Pescado');

insert into INVESTIGADORES values ('3024293T', 'Francisco', 'Varela', 'C/ Magnolia, nº 15, 1A. Sevilla', '654948520', 'Setas');
insert into INVESTIGADORES values ('Z3024293', 'Francisco', 'Varela', 'C/ Magnolia, nº 15, 1A. Sevilla', '654948520', 'Setas');
insert into INVESTIGADORES values ('49090698GG', 'Fernando', 'Tirado', 'Av/ Reyes Católicos, nº 4. Dos Hermanas, Sevilla', '692474858','Pescado');

insert into INVESTIGADORES values ('Z024293T', 'Francisco', 'Varela', 'C/ Magnolia, nº 15, 1A. Sevilla', '654948520', 'Setas');
insert into INVESTIGADORES values ('Z30242935', 'Francisco', 'Varela', 'C/ Magnolia, nº 15, 1A. Sevilla', '654948520', 'Setas');
insert into INVESTIGADORES values ('Z302429TT', 'Francisco', 'Varela', 'C/ Magnolia, nº 15, 1A. Sevilla', '654948520', 'Setas');

insert into INVESTIGADORES (NIF, NOMBRE, APELLIDOS, DIRECCION, ESPECIALIDAD) values ('49090698G', 'Fernando', 'Tirado', 'Av/ Reyes Católicos, nº 4. Dos Hermanas, Sevilla','Pescado');
insert into INVESTIGADORES values ('A3024293T', 'Francisco', 'Varela', 'C/ Magnolia, nº 15, 1A. Sevilla', '654948520', 'Setas');
insert into INVESTIGADORES values ('49090698G', 'Fernando', 'Tirado', 'Av/ Reyes Católicos, nº 4. Dos Hermanas, Sevilla', '692474858','Pescado');

insert into INVESTIGADORES values ('X3024293T', 'Francisco', 'Varela', 'C/ Magnolia, nº 15, 1A. Sevilla', '654948520', 'Setas');



EXPERIMENTOS
drop table EXPERIMENTOS;

insert into EXPERIMENTOS (NIF_INV, NOMBRE, FECHA_INICIO, FECHA_FIN) values ('Z3024293T','Setas Rellenas De Bacalao', to_date('01/03/2019', 'DD/MM/YYYY'),to_date('01/05/2019','DD/MM/YYYY'));
insert into EXPERIMENTOS values ('A1234-B','59090698G','Setas Rellenas De Bacalao', to_date('01/03/2019','DD/MM/YYYY'),to_date('01/05/2019','DD/MM/YYYY'));
insert into EXPERIMENTOS values ('1234-B','X3024293T','Setas Rellenas De Bacalao', to_date('01/03/2019','DD/MM/YYYY'), to_date('01/05/2019', 'DD/MM/YYYY'));

insert into EXPERIMENTOS values ('AA1234-B','X3024293T','Setas Rellenas De Bacalao', to_date('01/03/2019','DD/MM/YYYY'), to_date('01/05/2019', 'DD/MM/YYYY'));
insert into EXPERIMENTOS values ('A1234B','X3024293T','Setas Rellenas De Bacalao', to_date('01/03/2019','DD/MM/YYYY'), to_date('01/05/2019', 'DD/MM/YYYY'));
insert into EXPERIMENTOS values ('A1234-BB','X3024293T','Setas Rellenas De Bacalao', to_date('01/03/2019','DD/MM/YYYY'), to_date('01/05/2019', 'DD/MM/YYYY'));

insert into EXPERIMENTOS values ('A1234-7','X3024293T','Setas Rellenas De Bacalao', to_date('01/03/2019','DD/MM/YYYY'), to_date('01/05/2019', 'DD/MM/YYYY'));
insert into EXPERIMENTOS values ('AA234-B','X3024293T','Setas Rellenas De Bacalao', to_date('01/03/2019','DD/MM/YYYY'), to_date('01/05/2019', 'DD/MM/YYYY'));
insert into EXPERIMENTOS values ('A1234BB','X3024293T','Setas Rellenas De Bacalao', to_date('01/03/2019','DD/MM/YYYY'), to_date('01/05/2019', 'DD/MM/YYYY'));

insert into EXPERIMENTOS values ('A12345B','X3024293T','Setas Rellenas De Bacalao', to_date('01/03/2019','DD/MM/YYYY'), to_date('01/05/2019', 'DD/MM/YYYY'));
insert into EXPERIMENTOS values ('A1234-B','X3024293T','Setas Rellenas De Bacalao', to_date('08/03/2019','DD/MM/YYYY'), to_date('01/05/2019', 'DD/MM/YYYY'));
insert into EXPERIMENTOS values ('A1234-B','X3024293T','setas Rellenas De Bacalao', to_date('01/03/2019','DD/MM/YYYY'), to_date('01/05/2019', 'DD/MM/YYYY'));

insert into EXPERIMENTOS values ('A1234-B','X3024293T','setas rellenas de bacalao', to_date('01/03/2019','DD/MM/YYYY'), to_date('01/05/2019', 'DD/MM/YYYY'));
insert into EXPERIMENTOS values ('A1234-B','X3024293T','Setas Rellenas De Bacalao', to_date('01/03/2019','DD/MM/YYYY'), to_date('01/05/2019', 'DD/MM/YYYY'));



VERSIONES
drop table VERSIONES;

insert into VERSIONES (COD_EXP, FECHA_PRUEBA) values ('A1234-A', to_date('06/04/2019 11:00','DD/MM/YYYY HH24:MI'));
insert into VERSIONES values ('1.2','A5678-B', to_date('06/04/2019 11,00','DD/MM/YYYY HH24:MI'));
insert into VERSIONES values ('0','A1234-B', to_date('06/04/2019 11:00', 'DD/MM/YYYYHH24:MI'));

insert into VERSIONES values ('.','A1234-B', to_date('06/04/2019 11:00', 'DD/MM/YYYYHH24:MI'));
insert into VERSIONES values ('.2','A1234-B', to_date('06/04/2019 11:00', 'DD/MM/YYYYHH24:MI'));
insert into VERSIONES values ('1.','A1234-B', to_date('06/04/2019 11:00', 'DD/MM/YYYYHH24:MI'));
insert into VERSIONES values ('.2.1','A1234-B', to_date('06/04/2019 11:00', 'DD/MM/YYYYHH24:MI'));

insert into VERSIONES values ('1..1','A1234-B', to_date('06/04/2019 11:00', 'DD/MM/YYYYHH24:MI'));

#las siguientes tiene que aceptarlas
insert into VERSIONES values ('0.1','A1234-B', to_date('06/04/2019 11:00', 'DD/MM/YYYYHH24:MI'));
insert into VERSIONES values ('0.0','A1234-B', to_date('06/04/2019 11:00', 'DD/MM/YYYYHH24:MI'));

insert into VERSIONES values ('10.0','A1234-B', to_date('06/04/2019 11:00', 'DD/MM/YYYYHH24:MI'));

#la siguiente tiene que aceptarla
insert into VERSIONES values ('10.10','A1234-B', to_date('06/04/2019 11:00', 'DD/MM/YYYY HH24:MI'));

insert into VERSIONES values ('1.2','A1234-B', to_date('05/04/2019 11:00', 'DD/MM/YYYY HH24:MI'));
insert into VERSIONES values ('1.2','A1234-B', to_date('07/04/2019 11:00', 'DD/MM/YYYY HH24:MI'));
insert into VERSIONES values ('1.2','A1234-B', to_date('06/04/2019 14:01', 'DD/MM/YYYY HH24:MI'));

insert into VERSIONES values ('1.2','A1234-B', to_date('06/04/2019 10:59', 'DD/MM/YYYY HH24:MI'));
insert into VERSIONES values ('1.2','A1234-B', to_date('06/04/2019 15:00', 'DD/MM/YYYY HH24:MI'));
insert into VERSIONES values ('1,2','A1234-B', to_date('06/04/2019 11:00', 'DD/MM/YYYY HH24:MI'));

insert into VERSIONES values ('1-2','A1234-B', to_date('06/04/2019 11:00', 'DD/MM/YYYY HH24:MI'));
insert into VERSIONES values ('5', 'A1234-B', to_date('06/04/2019 11:00', 'DD/MM/YYYY HH24:MI'))
insert into VERSIONES values ('1.2','A1234-B', to_date('06/04/2019 11:00', 'DD/MM/YYYY HH24:MI'));

COLABORACIONES
drop table COLABORACIONES;

insert into COLABORACIONES (COD_VERS, NIF_INV) values ('1.2', 'X3024293T');
insert into COLABORACIONES (COD_EXP, NIF_INV) values ('A1234-B', 'X3024293T');
insert into COLABORACIONES (COD_EXP, COD_VERS) values ('A1234-B', '1.2');

insert into COLABORACIONES values ('A4567-B', '1.2', 'X3024293T');
insert into COLABORACIONES values ('A1234-B', '10.1', 'X3024293T');
insert into COLABORACIONES values ('A1234-B', '1.2', 'X3024200T');

insert into COLABORACIONES values ('A1234-B', '1.2', 'X3024293T');


INGREDIENTES_POR_VERSION
drop table INGREDIENTES_POR_VERSION;

insert into INGREDIENTES_POR_VERSION (COD_EXP, COD_VERS, CANTIDAD) values ('A1234-B','1.2','0.15L');
insert into INGREDIENTES_POR_VERSION (COD_ING, COD_VERS, CANTIDAD) values ('F','1.2','0.15L');
insert into INGREDIENTES_POR_VERSION (COD_ING, COD_EXP, CANTIDAD) values ('F', 'A1234-B','0.15L');

insert into INGREDIENTES_POR_VERSION values ('P', 'A1234-B','1.2','0.15L');
insert into INGREDIENTES_POR_VERSION values ('F', 'A1234-P','1.2','0.15L');
insert into INGREDIENTES_POR_VERSION values ('F', 'A1234-B','4.4','0.15L');

insert into INGREDIENTES_POR_VERSION values ('F', 'A1234-B','1.2','150');
insert into INGREDIENTES_POR_VERSION values ('F', 'A1234-B','1.2','A150L');
insert into INGREDIENTES_POR_VERSION values ('F', 'A1234-B','1.2','150ml');

insert into INGREDIENTES_POR_VERSION values ('F', 'A1234-B','1.2','15.L');
insert into INGREDIENTES_POR_VERSION values ('F', 'A1234-B','1.2','.15L');
insert into INGREDIENTES_POR_VERSION values ('F', 'A1234-B','1.2','0.15P');

insert into INGREDIENTES_POR_VERSION values ('F', 'A1234-B','1.2','0.15L');


CATADORES
drop table CATADORES;

insert into CATADORES (NOMBRE, APELLIDOS, DIRECCION, TELEFONO) values ('Rosa', 'Martinez', 'C/ Peral, nº 8. Dos Hermanas, Sevilla', '97584502');
insert into CATADORES values ('4903298V', 'Rosa', 'Martinez', 'C/ Peral, nº 8. Dos Hermanas, Sevilla', '97584502');
insert into CATADORES values ('49032981V', 'Rosa', 'Martinez', 'C/ Peral, nº 8. Dos Hermanas, Sevilla', '97584502');


ASPECTOS
drop table ASPECTOS

insert into ASPECTOS (DESCRIPCION, IMPORTANCIA) values ('Sabor.', 'Muy alta');
insert into ASPECTOS values ('SAB', 'Sabor.', 'Regular');
insert into ASPECTOS values ('SAB', 'Sabor.', 'Muy alta');


PUNTUACIONES
drop table PUNTUACIONES

insert into PUNTUACIONES (COD_ASP, COD_EXP, COD_VERS, VALOR) values ('SAB', 'A1234-B', '1.2', 5);
insert into PUNTUACIONES (NIF_CAT, COD_EXP, COD_VERS, VALOR) values ('49032981V', 'A1234-B', '1.2', 5);
insert into PUNTUACIONES (NIF_CAT, COD_ASP, COD_VERS, VALOR) values ('49032981V', 'SAB', '1.2', 5);

insert into PUNTUACIONES (NIF_CAT, COD_ASP, COD_EXP, VALOR) values ('49032981V', 'SAB', 'A1234-B', 5);
insert into PUNTUACIONES values ('49032900V', 'SAB', 'A1234-B', '1.2', 5);
insert into PUNTUACIONES values ('49032981V', 'MIR', 'A1234-B', '1.2', 5);

insert into PUNTUACIONES values ('49032981V', 'SAB', 'A5678-B', '1.2', 5);
insert into PUNTUACIONES values ('49032981V', 'SAB', 'A1234-B', '8.2', 5);

insert into PUNTUACIONES values ('49032981V', 'SAB', 'A1234-B', '1.2', 5);
