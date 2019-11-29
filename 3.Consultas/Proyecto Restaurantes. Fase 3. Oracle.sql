1. El catador cuyo DNI comienza por una letra ha otorgado una puntuación de 9.4 al aspecto de importancia 'Baja' tras su cata de la última 
versión del experimento en el que han colaborado más investigadores. Añade esta información a la base de datos mediante una consulta de 
datos anexados.

insert into PUNTUACIONES values((select NIF
                                 from CATADORES 
                                 where substr(NIF, 1, 1) in ('K','L','M','X','Y','Z')), 
(select CODIGO
from ASPECTOS 
where IMPORTANCIA='Baja'), (select COD_EXP
                            from COLABORACIONES
                            group by COD_EXP
                            having count(NIF_INV)=(select max(count(NIF_INV))
                                                   from COLABORACIONES
                                                   group by COD_EXP)),
(select CODIGO
from VERSIONES 
where FECHA_PRUEBA=(select max(FECHA_PRUEBA)
                    from VERSIONES
                    where COD_EXP=(select COD_EXP
                                   from COLABORACIONES
                                   group by COD_EXP
                                   having count(NIF_INV)=(select max(count(NIF_INV))
                                                          from COLABORACIONES
                                                          group by COD_EXP)))
and COD_EXP=(select COD_EXP
             from COLABORACIONES
             group by COD_EXP
             having count(NIF_INV)=(select max(count(NIF_INV))
                                    from COLABORACIONES
                                    group by COD_EXP))), 9.4);



2. Se ha pospuesto dos meses la prueba de la última versión del experimento del que es responsable el investigador especialista en 
vegetales.

alter table VERSIONES drop constraint FECHA_PRUEBA_SABADO;


update VERSIONES
set FECHA_PRUEBA=add_months(FECHA_PRUEBA,2)
where COD_EXP=(select CODIGO
               from EXPERIMENTOS 
               where NIF_INV=(select NIF
                              from INVESTIGADORES 
                              where ESPECIALIDAD='Vegetales'))
and FECHA_PRUEBA=(select max(FECHA_PRUEBA)
                  from VERSIONES
                  where COD_EXP=(select CODIGO
                                 from EXPERIMENTOS 
                                 where NIF_INV=(select NIF
                                                from INVESTIGADORES 
                                                where ESPECIALIDAD='Vegetales')));



3. Muestra los nombres de los experimentos en los que han colaborado más de tres investigadores para alguna de sus versiones.

select NOMBRE 
from EXPERIMENTOS
where CODIGO in (select distinct COD_EXP
                 from colaboraciones
                 group by COD_EXP, COD_VERS
                 having count(*)>3);



4. Muestra aquellos ingredientes preparados a partir de más de dos ingredientes básicos y que han sido utilizados en más de una versión de 
un mismo experimento.

select NOMBRE
from INGREDIENTES
where CODIGO in (select distinct COD_ING_FINAL
                 from COMPOSICION_ING_PREPARADOS
                 where COD_ING_BASE not in (select distinct COD_ING_FINAL
                                            from COMPOSICION_ING_PREPARADOS)
                 group by COD_ING_FINAL
                 having count(*)>1
                 and COD_ING_FINAL in (select distinct COD_ING
                                       from INGREDIENTES_POR_VERSION
                                       group by COD_ING, COD_EXP
                                       having count(*)>1));



5. Muestra los nombres de los catadores que han evaluado algún aspecto de alguna versión de algún experimento tanto en mayo como en junio 
como en septiembre.

select NOMBRE
from CATADORES
where NIF in (select distinct NIF_CAT
              from PUNTUACIONES
              where (COD_VERS, COD_EXP) in (select CODIGO, COD_EXP
                                            from VERSIONES
                                            where to_char(FECHA_PRUEBA, 'MM') in ('05', '06', '09')));



6. Muestra el número de experimentos que han sido responsabilidad de cada investigador, incluyendo aquellos investigadores que no han 
dirigido ningún experimento.

select i.NOMBRE, count(e.CODIGO)
from INVESTIGADORES i, EXPERIMENTOS e
where i.NIF=e.NIF_INV
group by i.NIF, i.NOMBRE
UNION
select NOMBRE, 0
from INVESTIGADORES
where NIF not in (select NIF_INV
                  from EXPERIMENTOS);



7. Muestra la mejor puntuación de cada una de las versiones probadas, junto con el nombre del experimento correspondiente, el número de 
versión y el aspecto en el que ha logrado dicha puntuación.

select p.COD_EXP, p.COD_VERS, a.DESCRIPCION, p.VALOR
from PUNTUACIONES p, ASPECTOS a
where p.COD_ASP=a.CODIGO 
and (p.COD_EXP, p.COD_VERS, p.VALOR) in(select COD_EXP, COD_VERS, max(VALOR)           
                                        from PUNTUACIONES
                                        group by COD_VERS, COD_EXP);



8. Muestra la versión de cada uno de los experimentos que ha conseguido la mejor puntuación media en el total de las evaluaciones 
realizadas por los catadores.

create or replace view mediaVersiones as
select COD_EXP, COD_VERS, AVG(VALOR) as media
from PUNTUACIONES
group by COD_EXP, COD_VERS;

select COD_EXP, COD_VERS, AVG(VALOR)
from PUNTUACIONES
group by COD_EXP, COD_VERS
having (COD_EXP, AVG(VALOR)) in (select COD_EXP, max(media)
                                 from mediaVersiones
                                 group by COD_EXP);



9. Muestra los ingredientes que no se han usado ni han sido parte de otro ingrediente en ninguna versión de ningún experimento en los 
últimos cuatro meses.

select distinct NOMBRE
from INGREDIENTES 
where CODIGO not in (select distinct iv.COD_ING
                        from INGREDIENTES_POR_VERSION iv, EXPERIMENTOS e
                        where iv.COD_EXP=e.CODIGO
                        and months_between(e.FECHA_FIN, sysdate)<4)
and CODIGO not in (select COD_ING_BASE
              from COMPOSICION_ING_PREPARADOS
              start with COD_ING_FINAL in (select distinct iv.COD_ING
                        from INGREDIENTES_POR_VERSION iv, EXPERIMENTOS e
                        where iv.COD_EXP=e.CODIGO
                        and months_between(e.FECHA_FIN, sysdate)<4)
              connect by COD_ING_FINAL = prior COD_ING_BASE);



10. Crea una vista con la siguiente información acerca de los investigadores: Nombre, Apellidos y Nombre del Experimento en el que han 
participado que ha obtenido mejorpuntuación media en aspectos de importancia Alta o Muy Alta.

create or replace view puntosAltoMuyAlto as
select COD_EXP, AVG(VALOR) as media
from PUNTUACIONES
where COD_ASP in (select CODIGO
                  from ASPECTOS
                  where IMPORTANCIA in ('Alta', 'Muy alta'))
group by COD_EXP;


create or replace view infoInvestigadores as         
select i2.NOMBRE, i2.APELLIDOS, e2.NOMBRE as NOM_EXP
from INVESTIGADORES i2, EXPERIMENTOS e2
where (i2.NIF, e2.CODIGO) in (select i.NIF, v.COD_EXP
                              from INVESTIGADORES i, puntosAltoMuyAlto v
                              where v.media in (select max(v2.media)
                                                from puntosAltoMuyAlto v2, EXPERIMENTOS e, COLABORACIONES c
                                                where (v2.COD_EXP=e.CODIGO
                                                       and e.NIF_INV=i.NIF)
                                                or (v2.COD_EXP=c.COD_EXP
                                                    and c.NIF_INV=i.NIF)));
