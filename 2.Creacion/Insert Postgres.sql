
INGREDIENTES

insert into INGREDIENTES values ('F','nata','lacteo');
insert into INGREDIENTES values ('A','agua','otro');
insert into INGREDIENTES values ('B','pimiento verde','fruta');
insert into INGREDIENTES values ('C','leche','lacteo');
insert into INGREDIENTES values ('D','chalota','hortaliza');

insert into INGREDIENTES values ('E','cebollino','verdura');
insert into INGREDIENTES values ('G','gelatina','otro');
insert into INGREDIENTES values ('H','azucar','aditivo');
insert into INGREDIENTES values ('I','azucar glass','aditivo');
insert into INGREDIENTES values ('J','nata montada','lacteo');

insert into INGREDIENTES values ('K','cigala','marisco');
insert into INGREDIENTES values ('L','limon','fruta');
insert into INGREDIENTES values ('M','zumo de limon','zumo');
insert into INGREDIENTES values ('N', 'yema pasteurizada', 'huevo');
insert into INGREDIENTES values ('O','vinagre de sidra','vinagre');

insert into INGREDIENTES values ('P','sal','aditivo');
insert into INGREDIENTES values ('Q','aceite de oliva V.E.','aceite');
insert into INGREDIENTES values ('R','mayonesa','salsa');
insert into INGREDIENTES values ('S','perla de tapioca','otro');
insert into INGREDIENTES values ('T','remolacha','hortaliza');

insert into INGREDIENTES values ('U','zumo de remolacha','zumo');
insert into INGREDIENTES values ('V','harina de tapioca','harina');
insert into INGREDIENTES values ('W','crujiente de tapioca','guarnicion');
insert into INGREDIENTES values ('X','seta de cultivo','seta');
insert into INGREDIENTES values ('Y','pasta philo','pasta');

insert into INGREDIENTES values ('Z','harina de trigo','harina');
insert into INGREDIENTES values ('AA','huevo de gallina','huevo');
insert into INGREDIENTES values ('AB','jamon serrano','carne');
insert into INGREDIENTES values ('AC','tocineta','carne');
insert into INGREDIENTES values ('AD','zanahoria','verdura');

insert into INGREDIENTES values ('AE','esparrago blanco','verdura');
insert into INGREDIENTES values ('AF','ajo tierno','hortaliza');
insert into INGREDIENTES values ('AG','mantequilla','lacteo');
insert into INGREDIENTES values ('AH','vinagre de modena','vinagre');
insert into INGREDIENTES values ('AI','pimienta','especia');

insert into INGREDIENTES values ('AJ','semilla de amapola','semilla');
insert into INGREDIENTES values ('AK','perejil','especia');
insert into INGREDIENTES values ('AL','perejil picado','especia');
insert into INGREDIENTES values ('AM','torta extremeña','lacteo');
insert into INGREDIENTES values ('AN','oporto rojo','vino');

insert into INGREDIENTES values ('AP','naranja','fruta');
insert into INGREDIENTES values ('AQ','zumo de naranja','zumo');
insert into INGREDIENTES values ('AR','granizado de oporto','granizado');
insert into INGREDIENTES values ('AS','chocolate 66%','lacteo');
insert into INGREDIENTES values ('AT','leche de coco','fruta');

#añadido
insert into INGREDIENTES values ('AU', 'plátano','fruta');
insert into INGREDIENTES values ('AV', 'pure de plátano','fruta');




COMPOSICION_ING_PREPARADOS

insert into COMPOSICION_ING_PREPARADOS values ('A','F','0.06L');
insert into COMPOSICION_ING_PREPARADOS values ('G','F','10G');
insert into COMPOSICION_ING_PREPARADOS values ('H','F','75G');
insert into COMPOSICION_ING_PREPARADOS values ('F','J','0.5L');

insert into COMPOSICION_ING_PREPARADOS values ('I','J','10G');
insert into COMPOSICION_ING_PREPARADOS values ('L','M', '1U');
insert into COMPOSICION_ING_PREPARADOS values ('N','R','50G');
insert into COMPOSICION_ING_PREPARADOS values ('O','R','15G');
insert into COMPOSICION_ING_PREPARADOS values ('P','R','1G');

insert into COMPOSICION_ING_PREPARADOS values ('Q','R','20G');
insert into COMPOSICION_ING_PREPARADOS values ('T','U', '1U');
insert into COMPOSICION_ING_PREPARADOS values ('S','W','50G');
insert into COMPOSICION_ING_PREPARADOS values ('U','W','30G');
insert into COMPOSICION_ING_PREPARADOS values ('V','W','18G');

insert into COMPOSICION_ING_PREPARADOS values ('Z','Y','50G');
insert into COMPOSICION_ING_PREPARADOS values ('Q','Y','75G');
insert into COMPOSICION_ING_PREPARADOS values ('AA','Y', '1U');
insert into COMPOSICION_ING_PREPARADOS values ('P','Y', '10G');
insert into COMPOSICION_ING_PREPARADOS values ('A','Y', '1L');

insert into COMPOSICION_ING_PREPARADOS values ('AK','AL', '1U');
insert into COMPOSICION_ING_PREPARADOS values ('AP','AQ', '1U');
insert into COMPOSICION_ING_PREPARADOS values ('AN','AR','0.25L');
insert into COMPOSICION_ING_PREPARADOS values ('AQ','AR','0.25L');
insert into COMPOSICION_ING_PREPARADOS values ('H','AR','50G');

insert into COMPOSICION_ING_PREPARADOS values ('A','AR','10G');
insert into COMPOSICION_ING_PREPARADOS values ('G','AR','1U');


#añadido
insert into COMPOSICION_ING_PREPARADOS values ('AU','AV','1U');



INVESTIGADORES

insert into INVESTIGADORES values ('X3024293T', 'Francisco', 'Varela', 'C/ Magnolia, nº 15, 1A. Sevilla', '654948520', 'Setas');
insert into INVESTIGADORES values ('49090698G', 'Fernando', 'Tirado', 'Av/ Reyes Catolicos, nº 4. Dos Hermanas, Sevilla', '692474858', 'Pescado');
insert into INVESTIGADORES values ('49129431M', 'Paloma R.', 'Garcia', 'C/ Pino, nº 2, 1º A. Dos Hermanas, Sevilla', '652147489', 'Pasta');
insert into INVESTIGADORES values ('49131465S', 'Maria', 'Garcia', 'C/ Real, nº 5. Dos Hermanas, Sevilla', '632548787', 'Reposteria');
insert into INVESTIGADORES values ('28724783Z', 'Susana', 'Perez', 'C/ Amapola, nº 34. Dos Hermanas, Sevilla', '687875414', 'Cocina oriental');




EXPERIMENTOS

insert into EXPERIMENTOS values ('A1234-B','X3024293T','Setas Rellenas De Bacalao', '01/03/2019','01/05/2019');
insert into EXPERIMENTOS values ('A1234-A','49090698G','Tartar De Cigala', '01/02/2019','01/04/2019');
insert into EXPERIMENTOS values ('A1234-C','49129431M','Templo De Queso', '01/04/2019','01/06/2019');
insert into EXPERIMENTOS values ('A1234-D','49131465S','Chocolate Frio', '01/05/2019','01/07/2019');




VERSIONES

insert into VERSIONES values ('1.2','A1234-B', '06/04/2019 11:00');
insert into VERSIONES values ('1.1','A1234-A', '16/02/2019 11:00');
insert into VERSIONES values ('1.2','A1234-A', '02/03/2019 11:00');
insert into VERSIONES values ('1.3','A1234-A', '16/03/2019 11:00');
insert into VERSIONES values ('1.1','A1234-B', '16/03/2019 11:00');

insert into VERSIONES values ('1.3','A1234-B', '20/04/2019 11:00');
insert into VERSIONES values ('1.1','A1234-C', '20/04/2019 11:00');
insert into VERSIONES values ('1.2','A1234-C', '04/05/2019 11:00');
insert into VERSIONES values ('1.1','A1234-D', '04/05/2019 11:00');

insert into VERSIONES values ('0.1','A1234-D', '04/05/2019 11:00');
insert into VERSIONES values ('3.7.1','A1234-D', '04/05/2019 11:00');



COLABORACIONES

insert into COLABORACIONES values ('A1234-B', '1.2', '49090698G');
insert into COLABORACIONES values ('A1234-B', '1.1', '49090698G');
insert into COLABORACIONES values ('A1234-B', '1.3', '49090698G');
insert into COLABORACIONES values ('A1234-A', '1.1', 'X3024293T');
insert into COLABORACIONES values ('A1234-A', '1.2', 'X3024293T');

insert into COLABORACIONES values ('A1234-A', '1.3', 'X3024293T');
insert into COLABORACIONES values ('A1234-C', '1.1', '49090698G');
insert into COLABORACIONES values ('A1234-C', '1.2', '49090698G');
insert into COLABORACIONES values ('A1234-C', '1.1', 'X3024293T');
insert into COLABORACIONES values ('A1234-C', '1.2', 'X3024293T');

insert into COLABORACIONES values ('A1234-D', '1.1', '49090698G');
insert into COLABORACIONES values ('A1234-D', '1.1', 'X3024293T');
insert into COLABORACIONES values ('A1234-A', '1.1', '49129431M');
insert into COLABORACIONES values ('A1234-A', '1.2', '49129431M');
insert into COLABORACIONES values ('A1234-A', '1.3', '49129431M');

#añadidas
insert into COLABORACIONES values ('A1234-A', '1.1', '49090698G');
insert into COLABORACIONES values ('A1234-B', '1.1', '49131465S');



INGREDIENTES_POR_VERSION

insert into INGREDIENTES_POR_VERSION values ('F', 'A1234-B','1.2','0.15L');
insert into INGREDIENTES_POR_VERSION values ('B', 'A1234-A','1.1','3G');
insert into INGREDIENTES_POR_VERSION values ('D', 'A1234-A','1.1','3G');
insert into INGREDIENTES_POR_VERSION values ('E', 'A1234-A','1.1','3G');
insert into INGREDIENTES_POR_VERSION values ('K', 'A1234-A','1.1','10G');

insert into INGREDIENTES_POR_VERSION values ('B', 'A1234-A','1.2','3G');
insert into INGREDIENTES_POR_VERSION values ('D', 'A1234-A','1.2','3G');
insert into INGREDIENTES_POR_VERSION values ('E', 'A1234-A','1.2','3G');
insert into INGREDIENTES_POR_VERSION values ('K', 'A1234-A','1.2','10G');
insert into INGREDIENTES_POR_VERSION values ('M', 'A1234-A','1.2','3G');

insert into INGREDIENTES_POR_VERSION values ('R', 'A1234-A','1.2','5G');
insert into INGREDIENTES_POR_VERSION values ('B', 'A1234-A','1.3','3G');
insert into INGREDIENTES_POR_VERSION values ('D', 'A1234-A','1.3','3G');
insert into INGREDIENTES_POR_VERSION values ('E', 'A1234-A','1.3','3G');
insert into INGREDIENTES_POR_VERSION values ('K', 'A1234-A','1.3','10G');

insert into INGREDIENTES_POR_VERSION values ('M', 'A1234-A','1.3','3G');
insert into INGREDIENTES_POR_VERSION values ('R', 'A1234-A','1.3','5G');
insert into INGREDIENTES_POR_VERSION values ('W', 'A1234-A','1.3', '10G');
insert into INGREDIENTES_POR_VERSION values ('X', 'A1234-B','1.1','20G');
insert into INGREDIENTES_POR_VERSION values ('Y', 'A1234-B','1.1','2U');

insert into INGREDIENTES_POR_VERSION values ('AB', 'A1234-B','1.1','2U');
insert into INGREDIENTES_POR_VERSION values ('AC', 'A1234-B','1.1','2U');
insert into INGREDIENTES_POR_VERSION values ('AD', 'A1234-B','1.1','1U');
insert into INGREDIENTES_POR_VERSION values ('AE', 'A1234-B','1.1','2U');
insert into INGREDIENTES_POR_VERSION values ('AF', 'A1234-B','1.1','4U');

insert into INGREDIENTES_POR_VERSION values ('AA', 'A1234-B','1.1','3U');
insert into INGREDIENTES_POR_VERSION values ('AG', 'A1234-B','1.1','30G');
insert into INGREDIENTES_POR_VERSION values ('H', 'A1234-B','1.1','50G');
insert into INGREDIENTES_POR_VERSION values ('AH', 'A1234-B','1.1','0.1L');
insert into INGREDIENTES_POR_VERSION values ('A', 'A1234-B','1.1', '0.5L');

insert into INGREDIENTES_POR_VERSION values ('Q', 'A1234-B','1.1', '0.20L');
insert into INGREDIENTES_POR_VERSION values ('P', 'A1234-B','1.1', '0.03L');
insert into INGREDIENTES_POR_VERSION values ('AI', 'A1234-B','1.1', '0.15G');
insert into INGREDIENTES_POR_VERSION values ('AL', 'A1234-B','1.1', '0.03G');
insert into INGREDIENTES_POR_VERSION values ('X', 'A1234-B','1.2','20G');

insert into INGREDIENTES_POR_VERSION values ('Y', 'A1234-B','1.2','2U');
insert into INGREDIENTES_POR_VERSION values ('AB', 'A1234-B','1.2','2U');
insert into INGREDIENTES_POR_VERSION values ('AC', 'A1234-B','1.2','2U');
insert into INGREDIENTES_POR_VERSION values ('AD', 'A1234-B','1.2','1U');
insert into INGREDIENTES_POR_VERSION values ('AE', 'A1234-B','1.2','2U');

insert into INGREDIENTES_POR_VERSION values ('AF', 'A1234-B','1.2','4U');
insert into INGREDIENTES_POR_VERSION values ('AA', 'A1234-B','1.2','3U');
insert into INGREDIENTES_POR_VERSION values ('AG', 'A1234-B','1.2','30G');
insert into INGREDIENTES_POR_VERSION values ('H', 'A1234-B','1.2','50G');
insert into INGREDIENTES_POR_VERSION values ('AH', 'A1234-B','1.2','0.1L');

insert into INGREDIENTES_POR_VERSION values ('A', 'A1234-B','1.2', '0.5L');
insert into INGREDIENTES_POR_VERSION values ('Q', 'A1234-B','1.2', '0.20L');
insert into INGREDIENTES_POR_VERSION values ('P', 'A1234-B','1.2', '0.03G');
insert into INGREDIENTES_POR_VERSION values ('AI', 'A1234-B','1.2', '0.15G');
insert into INGREDIENTES_POR_VERSION values ('AL', 'A1234-B','1.2', '0.03G');

insert into INGREDIENTES_POR_VERSION values ('X', 'A1234-B','1.3','20G');
insert into INGREDIENTES_POR_VERSION values ('Y', 'A1234-B','1.3','2U');
insert into INGREDIENTES_POR_VERSION values ('AB', 'A1234-B','1.3','2U');
insert into INGREDIENTES_POR_VERSION values ('AC', 'A1234-B','1.3','2U');
insert into INGREDIENTES_POR_VERSION values ('AD', 'A1234-B','1.3','1U');

insert into INGREDIENTES_POR_VERSION values ('AE', 'A1234-B','1.3','2U');
insert into INGREDIENTES_POR_VERSION values ('AF', 'A1234-B','1.3','4U');
insert into INGREDIENTES_POR_VERSION values ('AA', 'A1234-B','1.3','3U');
insert into INGREDIENTES_POR_VERSION values ('AG', 'A1234-B','1.3','30G');
insert into INGREDIENTES_POR_VERSION values ('H', 'A1234-B','1.3','50G');

insert into INGREDIENTES_POR_VERSION values ('AH', 'A1234-B','1.3','0.1L');
insert into INGREDIENTES_POR_VERSION values ('A', 'A1234-B','1.3', '0.5L');
insert into INGREDIENTES_POR_VERSION values ('Q', 'A1234-B','1.3', '0.20L');
insert into INGREDIENTES_POR_VERSION values ('P', 'A1234-B','1.3', '0.03G');
insert into INGREDIENTES_POR_VERSION values ('AI', 'A1234-B','1.3', '0.15G');

insert into INGREDIENTES_POR_VERSION values ('AL', 'A1234-B','1.3', '0.03G');
insert into INGREDIENTES_POR_VERSION values ('F', 'A1234-B','1.3','0.15L');
insert into INGREDIENTES_POR_VERSION values ('AJ', 'A1234-B','1.3', '0.05G');
insert into INGREDIENTES_POR_VERSION values ('G', 'A1234-C','1.1','3U');
insert into INGREDIENTES_POR_VERSION values ('C', 'A1234-C','1.1','3U');

insert into INGREDIENTES_POR_VERSION values ('F', 'A1234-C','1.1','30G');
insert into INGREDIENTES_POR_VERSION values ('Q', 'A1234-C','1.1', '0.20L');
insert into INGREDIENTES_POR_VERSION values ('P', 'A1234-C','1.1', '0.03G');
insert into INGREDIENTES_POR_VERSION values ('AM', 'A1234-C','1.1','17G');
insert into INGREDIENTES_POR_VERSION values ('G', 'A1234-C','1.2','3U');

insert into INGREDIENTES_POR_VERSION values ('C', 'A1234-C','1.2','3U');
insert into INGREDIENTES_POR_VERSION values ('F', 'A1234-C','1.2','30G');
insert into INGREDIENTES_POR_VERSION values ('Q', 'A1234-C','1.2', '0.20L');
insert into INGREDIENTES_POR_VERSION values ('P', 'A1234-C','1.2', '0.03G');
insert into INGREDIENTES_POR_VERSION values ('AM', 'A1234-C','1.2','17G');

insert into INGREDIENTES_POR_VERSION values ('AR', 'A1234-C','1.2', '0.2L');
insert into INGREDIENTES_POR_VERSION values ('A', 'A1234-D','1.1','70G');
insert into INGREDIENTES_POR_VERSION values ('AS', 'A1234-D','1.1','12G');
insert into INGREDIENTES_POR_VERSION values ('H', 'A1234-D','1.1','50G');
insert into INGREDIENTES_POR_VERSION values ('AT', 'A1234-D','1.1','15G');





CATADORES

insert into CATADORES values ('49032981V', 'Rosa', 'Martinez', 'C/ Peral, nº 8. Dos Hermanas, Sevilla', '97584502');
insert into CATADORES values ('29538519X', 'Pedro', 'Gutierrez', 'C/ Real Utrera, nº 70. Dos Hermanas, Sevilla', '695747484');
insert into CATADORES values ('49091857J', 'Ana', 'Lopez', 'C/ Perito en Luna, nº 3, 2B. Sevilla', '654987373');
insert into CATADORES values ('49130297C', 'Adri', 'Martin', 'C/ Platero y yo, nº 5, 4C. Sevilla', '621212154');
insert into CATADORES values ('48960408D', 'Jose', 'Perez', 'C/ Reina de la Paz, nº 9, BA. Sevilla', '698232511');
insert into CATADORES values ('30235748V', 'Javi', 'Rodriguez', 'C/ Reina de los profetas, nº 6, 3C. Sevilla', '644775145');

#añadido
insert into CATADORES values ('Y1234567X','Ana','Fernandez','C/ Utopía, nº 4, Sevilla', '687545427');



ASPECTOS

insert into ASPECTOS values ('SAB', 'Sabor.', 'Muy alta');
insert into ASPECTOS values ('COL', 'Color', 'Baja');
insert into ASPECTOS values ('TEX', 'Textura', 'Alta');
insert into ASPECTOS values ('VOL', 'Volumen', 'Media');
insert into ASPECTOS values ('CAN', 'Cantidad', 'Alta');
insert into ASPECTOS values ('PRE', 'Presentacion', 'Alta');

insert into ASPECTOS values ('TEC', 'Tecnica', 'Media');
insert into ASPECTOS values ('ORI', 'Originalidad', 'media');








PUNTUACIONES

insert into PUNTUACIONES values ('49032981V', 'SAB', 'A1234-B', '1.2', 2.3);
insert into PUNTUACIONES values ('49032981V', 'SAB', 'A1234-A', '1.1', 3);
insert into PUNTUACIONES values ('49032981V', 'COL', 'A1234-A', '1.1', 4);
insert into PUNTUACIONES values ('49032981V', 'TEX', 'A1234-A', '1.1', 5.65);
insert into PUNTUACIONES values ('49032981V', 'VOL', 'A1234-A', '1.1', 6);

insert into PUNTUACIONES values ('49032981V', 'CAN', 'A1234-A', '1.1', 7);
insert into PUNTUACIONES values ('49032981V', 'PRE', 'A1234-A', '1.1', 8);
insert into PUNTUACIONES values ('49032981V', 'TEC', 'A1234-A', '1.1', 9.43);
insert into PUNTUACIONES values ('49032981V', 'ORI', 'A1234-A', '1.1', 2);
insert into PUNTUACIONES values ('29538519X', 'SAB', 'A1234-A', '1.1', 3);

insert into PUNTUACIONES values ('29538519X', 'COL', 'A1234-A', '1.1', 5.55);
insert into PUNTUACIONES values ('29538519X', 'TEX', 'A1234-A', '1.1', 6);
insert into PUNTUACIONES values ('29538519X', 'VOL', 'A1234-A', '1.1', 7);
insert into PUNTUACIONES values ('29538519X', 'CAN', 'A1234-A', '1.1', 8);
insert into PUNTUACIONES values ('29538519X', 'PRE', 'A1234-A', '1.1', 9);

insert into PUNTUACIONES values ('29538519X', 'TEC', 'A1234-A', '1.1', 2);
insert into PUNTUACIONES values ('29538519X', 'ORI', 'A1234-A', '1.1', 3.09);
insert into PUNTUACIONES values ('49091857J', 'SAB', 'A1234-A', '1.1', 4);
insert into PUNTUACIONES values ('49091857J', 'COL', 'A1234-A', '1.1', 5);
insert into PUNTUACIONES values ('49091857J', 'TEX', 'A1234-A', '1.1', 6);

insert into PUNTUACIONES values ('49091857J', 'VOL', 'A1234-A', '1.1', 7);
insert into PUNTUACIONES values ('49091857J', 'CAN', 'A1234-A', '1.1', 8);
insert into PUNTUACIONES values ('49091857J', 'PRE', 'A1234-A', '1.1', 9);
insert into PUNTUACIONES values ('49091857J', 'TEC', 'A1234-A', '1.1', 5);
insert into PUNTUACIONES values ('49091857J', 'ORI', 'A1234-A', '1.1', 2);

#añadido
insert into PUNTUACIONES values ('49091857J', 'ORI', 'A1234-C', '1.1', 7);
insert into PUNTUACIONES values ('29538519X', 'TEC', 'A1234-D', '1.1', 8);
insert into PUNTUACIONES values ('49091857J', 'ORI', 'A1234-C', '1.2', 9);
insert into PUNTUACIONES values ('49091857J', 'TEC', 'A1234-A', '1.2', 5);
insert into PUNTUACIONES values ('49091857J', 'ORI', 'A1234-A', '1.2', 2);
#
insert into PUNTUACIONES values ('49130297C', 'TEC', 'A1234-A', '1.1', 10);
delete from PUNTUACIONES where NIF_CAT='49130297C';
