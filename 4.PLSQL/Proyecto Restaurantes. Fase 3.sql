
1. Realiza una función que reciba un código de experimento, 
un código de versión y el nombre de un ingrediente y muestre 
la cantidad total del ingrediente necesario para una versión. 
Debes tener en cuenta que el ingrediente puede usarse como 
base de otros ingredientes preparados y/o directamente en la 
versión del experimento. Debes contemplar las siguientes 
excepciones: Experimento inexistente, Versión inexistente 
para ese experimento e Ingrediente no empleado en dicha 
versión.

create or replace function DevolverCodIng (p_nombreIng ingredientes.nombre%type)
return ingredientes.codigo%type
is
    v_codIng ingredientes.codigo%type;
begin
    select codigo into v_codIng
    from ingredientes
    where nombre=p_nombreIng;
    return v_codIng;
exception
    when NO_DATA_FOUND then
        dbms_output.put_line('No existe ningún ingrediente con ese nombre en la base de datos');
        return '-1';
end DevolverCodIng;
/

create or replace procedure ComprobarCodExpExiste (p_codExp experimentos.codigo%type,
                                                   p_excepComp in out number)
is
    v_codigo experimentos.codigo%type;
begin
    select codigo into v_codigo
    from experimentos
    where codigo=p_codExp;
exception
    when NO_DATA_FOUND then
        dbms_output.put_line('No existe experimentos con ese codigo');
        p_excepComp:=-1;
end ComprobarCodExpExiste;
/

create or replace procedure ComprobarCodVersExiste (p_codVers versiones.codigo%type,
                                                    p_codExp experimentos.codigo%type,
                                                    p_excepComp in out number)
is
    v_codigo versiones.codigo%type;
begin
    select codigo into v_codigo
    from versiones
    where codigo=p_codVers
    and cod_exp=p_codExp;
exception
    when NO_DATA_FOUND then
        dbms_output.put_line('No existe esa versión para ese experimento');
        p_excepComp:=-1;
end ComprobarCodVersExiste;
/

create or replace procedure ComprobarExcepIngVers (p_codExp experimentos.codigo%type,
                                                   p_codVers versiones.codigo%type,
                                                   p_codIng ingredientes.codigo%type,
                                                   p_excepComp in out number)
is
begin
    ComprobarCodExpExiste (p_codExp, p_excepComp);
    ComprobarCodVersExiste (p_codVers, p_codExp, p_excepComp);
end ComprobarExcepIngVers;
/

create or replace function EncontrarIng (p_codExp experimentos.codigo%type,
                                          p_codVers versiones.codigo%type,
                                          p_codIng ingredientes.codigo%type)
return number
is
    v_cantidadVar varchar2(20);
    v_cantNum number;
begin    
    select replace(substr(nvl(cantidad,'0G'), 1, length(cantidad)-1), '.',',') into v_cantidadVar
    from ingredientes_por_version
    where cod_ing=p_codIng
    and cod_vers=p_codVers
    and cod_exp=p_codExp;
    v_cantNum:=to_number(v_cantidadVar);
    return v_cantNum;
exception
    when NO_DATA_FOUND then
        return -1;
end EncontrarIng;
/

create or replace function EncontrarIngBasico (p_ingrediente_final ingredientes.codigo%type, 
                                                p_codIng ingredientes.codigo%type)
return number
is
    v_cantIngComp varchar2(20);
    v_cantNum number;
begin
    select replace(substr(nvl(cantidad, '0G'), 1, length(cantidad)-1), '.', ',') into v_cantIngComp
    from composicion_ing_preparados
    where cod_ing_final=p_ingrediente_final
    and cod_ing_base=p_codIng;
    v_cantNum:= to_number(v_cantIngComp);
    return v_cantNum;
exception
    when NO_DATA_FOUND then
        return -1;
end EncontrarIngBasico;
/

create or replace function EncontrarIngCompuesto(p_codExp experimentos.codigo%type, 
                                                  p_codVers versiones.codigo%type, 
                                                  p_codIng ingredientes.codigo%type)
return number
is
    cursor c_ingrediente is
    select cod_ing
    from ingredientes_por_version
    where cod_exp=p_codExp
    and cod_vers=p_codVers;
    v_ingrediente c_ingrediente%rowtype;
    v_cantIngComp number:=0;
    v_totalcantIngComp number:=0;
begin
    for v_ingrediente in c_ingrediente loop
        v_cantIngComp:=EncontrarIngBasico(v_ingrediente.cod_ing, p_codIng);
        if v_cantIngComp!=-1 then
            v_totalcantIngComp:=v_cantIngComp+v_totalcantIngComp;
        end if;
    end loop;
    return v_totalcantIngComp;
end EncontrarIngCompuesto;
/

create or replace function SumarCantidades(p_cant1 number,
                                           p_cant2 number)
return number
is
begin
    if p_cant1!=-1 then
        if p_cant2!=-1 then
            return p_cant2+p_cant1;
        else
            return p_cant1;
        end if;
    else
        if p_cant2!=-1 then
            return p_cant2;
        else
            return p_cant1;
        end if;
    end if;
end SumarCantidades;
/

create or replace function IngredientesEnVersiones (p_codExp experimentos.codigo%type,
                                                    p_codVers versiones.codigo%type,
                                                    p_nombreIng ingredientes.nombre%type)
return number
is 
    v_codIng ingredientes.codigo%type;
    v_excepComp number:=0;
    v_cantIngBase number:=0;
    v_cantIngComp number:=0;
    v_total number:=0;
begin
    v_codIng:=DevolverCodIng(p_nombreIng);
    if v_codIng!='-1' then
        ComprobarExcepIngVers (p_codExp, p_codVers, v_codIng, v_excepComp);
        if v_excepComp=0 then
            v_cantIngBase:=EncontrarIng(p_codExp, p_codVers, v_codIng);
            v_cantIngComp:=EncontrarIngCompuesto(p_codExp, p_codVers, v_codIng);
            v_total:=SumarCantidades(v_cantIngBase, v_cantIngComp);
        else
        v_total:=-1;
        end if;
    end if;
    return v_total;
end IngredientesEnVersiones;
/

create or replace procedure probar(p_codExp experimentos.codigo%type,
                                                    p_codVers versiones.codigo%type,
                                                    p_nombreIng ingredientes.nombre%type)
is
    total number:=0;
begin
    total:=IngredientesEnVersiones(p_codExp, p_codVers, p_nombreIng);
    dbms_output.put_line(total);
end probar;



2. Deseamos realizar, con el menor número posible de 
consultas a la base de datos, un procedimiento llamado
MostrarInformes que reciba cuatro parámetros. El primero será 
el tipo de informe, el segundo un código de experimento y los 
dos últimos dependerán del tipo de informe.

Informe Tipo 1: Los dos últimos parámetros estarán en blanco. 
Este informe mostrará todas las puntuaciones que ha recibido 
un experimento, mostrando sus versiones ordenadas 
cronológicamente, los aspectos de mayor a menor importancia y 
las puntuaciones de mayor a menor. El formato del informe 
será el siguiente:

Código Experimento: xxxxxxxxxxx Investigador Responsable: xxxxxxxxxxxxxx
Versión1: xxxxxxxxxxxxxx    Fecha Prueba: xx/xx/xxxx
    Código Aspecto1: xxxxxxxxxxx1   Importancia: xxxxxxxxxxxx
        NombreCatador1  Puntuación
        ...
        NombreCatadorN              Puntuación
    Nota Media Aspecto xxxxxxxxxx1: n.nn
    ...
    Código AspectoN: xxxxxxxxxxxN   Importancia: xxxxxxxxxxxx
        NombreCatador1  Puntuación
        ...
        NombreCatadorN  Puntuación
    Nota Media Aspecto xxxxxxxxxxN: n.nn
Puntuación Media Versión1: n.nn
...
Versión2:
....


Informe Tipo 2: El tercer parámetro será un código de versión. 
Este informe mostrará todas las puntuaciones que ha recibido 
una versión de un experimento, mostrando los aspectos de 
mayor a menor importancia y las puntuaciones de mayor a menor. 
El formato del informe será el siguiente:

Código Experimento: xxxxxxxxxxx Investigador Responsable: xxxxxxxxxxxxxx
Versión: xxxxxxxxxxxxxx     Fecha Prueba: xx/xx/xxxx
    Código Aspecto1: xxxxxxxxxxx1   Importancia: xxxxxxxxxxxxNombreCatador1
        NombreCatador1                  Puntuación
        ...
        NombreCatadorN                  Puntuación
    Nota Media Aspecto xxxxxxxxxx1: n.nn
    ...
    Código AspectoN: xxxxxxxxxxxN   Importancia: xxxxxxxxxxxx
        NombreCatador1                  Puntuación
        ...
        NombreCatadorN                  Puntuación
    Nota Media Aspecto xxxxxxxxxxN: n.nn
Puntuación Media Versión: n.nn


Informe Tipo 3: El tercer parámetro será un código de versión. El cuarto será un código de aspecto Este informe
mostrará todas las puntuaciones que ha recibido un aspecto de una versión de un experimento, mostrando las
puntuaciones de mayor a menor. El formato del informe será el siguiente:

Código Experimento: xxxxxxxxxxx Investigador Responsable: xxxxxxxxxxxxxx
Versión: xxxxxxxxxxxxxx         Fecha Prueba: xx/xx/xxxx
Código Aspecto1: xxxxxxxxxxx1   Importancia: xxxxxxxxxxxx 
    NombreCatador1  Puntuación
    ...
    NombreCatadorN  Puntuación
Nota Media Aspecto xxxxxxxxxx1: n.nn

create or replace function ContarExpEnPuntuaciones(p_codExp experimentos.codigo%type)
return number
is
    v_apariciones number;
begin
    select count(*) into v_apariciones
    from puntuaciones
    where cod_exp=p_codExp;
    return v_apariciones;
end ContarExpEnPuntuaciones;
/

create or replace procedure ComprobarEnBlanco(p_parametro varchar2, 
                                              p_excep in out number)
is 
begin
    if p_parametro!=' ' then
        p_excep:=-1;
        dbms_output.put_line('Los últimos dos parámetros deben estar en blanco');
    end if;
end ComprobarEnBlanco;
/
exec ComprobarEnBlanco(' ',0)

create or replace procedure ExcepcionesTipo1(p_codExp experimentos.codigo%type,
                                             p_3 varchar2,
                                             p_4 varchar2,
                                             p_excep in out number)
is
    v_apariciones number;
begin
    v_apariciones:=ContarExpEnPuntuaciones(p_codExp);
    if v_apariciones>0 then
        ComprobarEnBlanco(p_3, p_excep);
        ComprobarEnBlanco(p_4, p_excep);
    else
        p_excep:=-1;
        dbms_output.put_line('No hay puntuaciones con ese codigo de experimento');
    end if;
end ExcepcionesTipo1;
/

create or replace procedure SeleccionarPuntuacion(p_codAsp aspectos.codigo%type, 
                                                  p_codExp experimentos.codigo%type, 
                                                  p_codVers versiones.codigo%type, 
                                                  p_notaMediaVers in out number,
                                                  v_contVers in out number)
is
    cursor c_puntuaciones is
    select c.nombre as nom_cat, p.valor as val_punt
    from catadores c, puntuaciones p
    where p.nif_cat=c.nif
    and cod_asp=p_codAsp
    and cod_exp=p_codExp
    and cod_vers=p_codVers;
    v_puntuaciones c_puntuaciones%rowtype;
    v_contAsp number:=0;
    v_notaMediaAsp number:=0;
begin
    for v_puntuaciones in c_puntuaciones loop
        dbms_output.put_line('      Nombre Catador: '||v_puntuaciones.nom_cat||' '||v_puntuaciones.val_punt);
        v_notaMediaAsp:=v_notaMediaAsp+v_puntuaciones.val_punt;
        v_contAsp:=v_contAsp+1;
        v_contVers:=v_contVers+1;
    end loop;
    p_notaMediaVers:=p_notaMediaVers+v_notaMediaAsp;
    dbms_output.put_line('  Nota Media Aspecto: '||v_notaMediaAsp/v_contAsp);
end SeleccionarPuntuacion;
/


create or replace procedure SeleccionarAspectos(p_codExp experimentos.codigo%type, 
                                                p_codVers versiones.codigo%type)
is
    cursor c_aspectos is
    select codigo, importancia
    from aspectos
    where codigo in (select cod_asp
                  from puntuaciones
                  where cod_exp=p_codExp
                  and cod_vers=p_codVers);
    v_notaMediaVers number:=0;
    v_contVers number:=0;
    v_aspectos c_aspectos%rowtype;
begin
    for v_aspectos in c_aspectos loop
        dbms_output.put_line('  Código Aspecto: '||v_aspectos.codigo||'  Importancia: '||v_aspectos.importancia);
        SeleccionarPuntuacion(v_aspectos.codigo, p_codExp, p_codVers, v_notaMediaVers, v_contVers);
    end loop;
    dbms_output.put_line('  Nota Media Versión: '||v_notaMediaVers/v_contVers);
end SeleccionarAspectos;
/

create or replace procedure SeleccionarResultado (p_codExp experimentos.codigo%type)
is
    cursor c_datosExp is
    select cod_exp, codigo, fecha_prueba
    from versiones v
    where cod_exp=p_codExp
    and (cod_exp, codigo) in (select cod_exp, cod_vers
                                 from puntuaciones)
    order by codigo;
    v_datosExp c_datosExp%rowtype;
    v_investigador investigadores.nif%type;
begin
    select nif_inv into v_investigador
    from experimentos
    where codigo=p_codExp;
    dbms_output.put_line('Código Experimento: '||p_codExp||'  Investigador Responsable: '||v_investigador);
    for v_datosExp in c_datosExp loop
        dbms_output.put_line('Versión: '||v_datosExp.codigo||'  Fecha Prueba: '||v_datosExp.fecha_prueba);
        SeleccionarAspectos(v_datosExp.cod_exp, v_datosExp.codigo);
    end loop;
end SeleccionarResultado;
/

create or replace procedure RealizarTipo1(p_codExp experimentos.codigo%type,
                                          p_3 varchar2,
                                          p_4 varchar2)
is
    v_excep number:=0;
begin
    ExcepcionesTipo1(p_codExp, p_3, p_4, v_excep);
    if v_excep=0 then
        SeleccionarResultado (p_codExp);
    end if;
end RealizarTipo1;
/

create or replace function ContarExpYVersEnPunt(p_codExp experimentos.codigo%type,
                                                p_codVers versiones.codigo%type)
return number
is
    v_apariciones number;
begin
    select count(*) into v_apariciones
    from puntuaciones
    where cod_exp=p_codExp
    and cod_vers=p_codVers;
    return v_apariciones;
end ContarExpYVersEnPunt;
/

create or replace procedure ExcepcionesTipo2(p_codExp experimentos.codigo%type,
                                             p_codVers varchar2,
                                             p_4 varchar2,
                                             p_excep in out number)
is
    v_apariciones number;
begin
    v_apariciones:=ContarExpYVersEnPunt(p_codExp,p_codVers);
    if v_apariciones>0 then
        ComprobarEnBlanco(p_4, p_excep);
    else
        p_excep:=-1;
        dbms_output.put_line('No hay puntuaciones para esa versión');
    end if;
end ExcepcionesTipo2;
/

create or replace procedure SeleccionarResultadoTipo2(p_codExp experimentos.codigo%type,
                                                      p_codVers versiones.codigo%type)
is
    v_investigador investigadores.nif%type;  
    v_fechaPrueba versiones.fecha_prueba%type;  
begin
    select nif_inv into v_investigador
    from experimentos
    where codigo=p_codExp;
    select fecha_prueba into v_fechaPrueba
    from versiones
    where cod_exp=p_codExp
    and codigo=p_codVers;
    dbms_output.put_line('Código Experimento: '||p_codExp||'  Investigador Responsable: '||v_investigador);
    dbms_output.put_line('Versión: '||p_codExp||'  Fecha Prueba: '||v_fechaPrueba);
    SeleccionarAspectos(p_codExp, p_codVers);
end SeleccionarResultadoTipo2;
/

create or replace procedure RealizarTipo2(p_codExp experimentos.codigo%type, 
                                          p_3 varchar2, 
                                          p_4 varchar2)
is
    v_excep number:=0;
begin
    ExcepcionesTipo2(p_codExp, p_3, p_4, v_excep);
    if v_excep=0 then
        SeleccionarResultadoTipo2(p_codExp, p_3);
    end if;
end RealizarTipo2;
/

create or replace function ContarVersYAspEnPunt(p_codExp experimentos.codigo%type,
                                                p_codVers versiones.codigo%type,
                                                p_codAsp aspectos.codigo%type)
return number
is
    v_apariciones number;
begin
    select count(*) into v_apariciones
    from puntuaciones
    where cod_exp=p_codExp
    and cod_vers=p_codVers
    and cod_asp=p_codAsp;
    return v_apariciones;
end ContarVersYAspEnPunt;
/

create or replace procedure ExcepcionesTipo3 (p_codExp experimentos.codigo%type,
                                              p_codVers varchar2,
                                              p_codAsp varchar2,
                                              p_excep in out number)
is
    v_apariciones number;
begin
    v_apariciones:=ContarVersYAspEnPunt(p_codExp, p_codVers,p_codAsp);
    if v_apariciones<=0 then
        p_excep:=-1;
        dbms_output.put_line('No hay aspectos de esa versión puntuados en la base de datos');
    end if;
end ExcepcionesTipo3;
/

create or replace procedure SeleccionarResultadoTipo3(p_codExp experimentos.codigo%type,
                                            p_codVers versiones.codigo%type,
                                            p_codAsp aspectos.codigo%type)
is
    v_investigador investigadores.nif%type;  
    v_fechaPrueba versiones.fecha_prueba%type;
    v_importancia aspectos.importancia%type; 
    v_notaMedia number:=0;
    v_contVers number:=0;  
begin
    select nif_inv into v_investigador
    from experimentos
    where codigo=p_codExp;
    select fecha_prueba into v_fechaPrueba
    from versiones
    where cod_exp=p_codExp
    and codigo=p_codVers;
    select importancia into v_importancia
    from aspectos
    where codigo=p_codAsp;
    dbms_output.put_line('Código Experimento: '||p_codExp||'  Investigador Responsable: '||v_investigador);
    dbms_output.put_line('Versión: '||p_codExp||'  Fecha Prueba: '||v_fechaPrueba);
    dbms_output.put_line('Código Aspecto: '||p_codAsp||' Importancia: '||v_importancia);
    SeleccionarPuntuacion(p_codAsp, p_codExp, p_codVers, v_notaMedia, v_contVers);
end SeleccionarResultadoTipo3;
/

create or replace procedure RealizarTipo3 (p_codExp experimentos.codigo%type,
                                           p_3 varchar2,
                                           p_4 varchar2)
is
    v_excep number:=0;
begin
    ExcepcionesTipo3(p_codExp, p_3, p_4, v_excep);
    if v_excep=0 then
        SeleccionarResultadoTipo3(p_codExp, p_3, p_4);
    end if;
end RealizarTipo3;
/

create or replace procedure MostrarInformes(p_tipoInforme number,
                                            p_codExp experimentos.codigo%type,
                                            p_3 varchar2,
                                            p_4 varchar2)
is
    v_excepComp number:=0;
begin
    ComprobarCodExpExiste(p_codExp, v_excepComp);
    if v_excepComp!=-1 then
        if p_tipoInforme=1 then
            RealizarTipo1(p_codExp, p_3, p_4);
        elsif p_tipoInforme=2 then
            RealizarTipo2(p_codExp, p_3, p_4);
        elsif p_tipoInforme=3 then
            RealizarTipo3(p_codExp,p_3, p_4);
        else
            dbms_output.put_line('El tipo de informe introducido no es correcto');
        end if;
    end if;
end MostrarInformes;
/



3. Realiza un trigger que impida que se pruebe una versión de
un experimento antes de que éste comience o después de que 
termine.

create or replace trigger ControlFechaPruebaVers
before insert or update of fecha_prueba on versiones
for each row
declare
    cursor c_fechasExp is
    select fecha_inicio, fecha_fin
    from experimentos
    where codigo=:new.cod_exp;
    v_fechasExp c_fechasExp%rowtype;
begin
    for v_fechasExp in c_fechasExp loop
        if :new.fecha_prueba not between v_fechasExp.fecha_inicio and v_fechasExp.fecha_fin then
            raise_application_error(-20100, 'No puedes usar una fecha fuera del periodo de realización del experimento');
        end if;
    end loop;
end ControlFechaPrueba;
/

create or replace trigger ControlFechaPruebaExp
before update on experimentos
for each row
declare
    cursor c_fechaVers is
    select fecha_prueba
    from versiones
    where cod_exp=:new.codigo;
    v_fechaVers c_fechaVers%rowtype;
begin
    for v_fechaVers in c_fechaVers loop
        if v_fechaVers.fecha_prueba not between :new.fecha_inicio and :new.fecha_fin then
            raise_application_error(-20101, 'No puedes modificar las fechas los experimentos porque hay fechas de pruebas de versiones');
        end if;
    end loop;
end ControlFechaPruebaExp;
/


4. Realiza un trigger que cada vez que se inserte una 
puntuación menor de 5, informe de este hecho por correo 
electrónico al investigador responsable del experimento,
incluyendo en el correo la fecha de la prueba, el aspecto 
valorado y donde vive el catador.





5. Añade una columna llamada PuntuaciónMedia a la tabla 
Versiones. Rellénala mediante un procedimiento PL/SQL a 
partir de las notas existentes en la tabla Puntuaciones y 
realiza los módulos de programación necesarios para mantener 
la columna debidamente actualizada cuando la tabla 
Puntuaciones sufra algún cambio con el mínimo consumo de 
recursos posible (esto es, realizando el menor número posible 
de cálculos).

alter table VERSIONES add Puntuacion_Media number(4,2);


create or replace procedure AñadirDatosMedia(p_variable number)
is
    cursor c_versiones is
    select avg(valor) as media, cod_exp, cod_vers
    from puntuaciones
    group by (cod_exp, cod_vers);
    v_versiones c_versiones%rowtype;
begin
    for v_versiones in c_versiones loop
        update VERSIONES set Puntuacion_Media = v_versiones.media 
                         where cod_exp=v_versiones.cod_exp
                         and codigo=v_versiones.cod_vers;
    end loop;
end AñadirDatosMedia;
/

exec AñadirDatosMedia(1);

create or replace package Media
as
    type tRegMedia is record
    (
        codExp versiones.cod_exp%type,
        codVers versiones.codigo%type,
        notaMedia puntuaciones.valor%type
    );
    type tTablaMedia is table of tRegMedia
    index by binary_integer;
    vtablaMedia tTablaMedia;
    procedure EncontrarNotaMedia(p_codExp experimentos.codigo%type,
                                p_codVers versiones.codigo%type);
end Media;
/

create or replace trigger RellenarTablaMedia
before insert or update on puntuaciones
declare
    cursor c_vermedia is
    select avg(valor) as media, cod_exp, cod_vers
    from puntuaciones
    group by (cod_exp, cod_vers);
    i number:=0;
begin
    for v_versiones in c_vermedia loop
        Media.vtablaMedia(i).codExp:=v_versiones.cod_exp;
        Media.vtablaMedia(i).codVers:=v_versiones.cod_vers;
        Media.vtablaMedia(i).notaMedia:=v_versiones.media;
        i:=i+1;
    end loop;
end RellenarTablaMedia;
/

create or replace procedure EncontrarNotaMedia(p_codExp experimentos.codigo%type,
                                              p_codVers versiones.codigo%type,
                                              p_notaMedia in out puntuaciones.valor%type)
is
begin
    for i in Media.vtablaMedia.FIRST..Media.vtablaMedia.LAST loop
        if p_codExp=Media.vtablaMedia(i).codExp and p_codVers=Media.vtablaMedia(i).codVers then
            p_notaMedia:=Media.vtablaMedia(i).notaMedia;
        end if;
    end loop;
end EncontrarNotaMedia;
/

create or replace procedure ModificarVersiones(p_codExp experimentos.codigo%type,
                                              p_codVers versiones.codigo%type,
                                              p_notaMedia in out puntuaciones.valor%type)
is
begin
    update versiones set Puntuacion_Media=p_notaMedia
                    where cod_exp=p_codExp
                    and codigo=p_codVers;
end ModificarVersiones;
/

create or replace trigger RellenarPuntMedia
after insert or update on puntuaciones
for each row
declare
    v_notaMedia puntuaciones.valor%type;
begin
    EncontrarNotaMedia(:new.cod_exp, :new.cod_vers, v_notaMedia);
    ModificarVersiones(:new.cod_exp, :new.cod_vers, v_notaMedia);
end ControlFechaPruebaExp;
/



6. Realiza los módulos de programación necesarios para evitar 
que un catador puntue más de tres aspectos de una misma 
versión de un experimento.

create or replace package NumCatadores
as
    type tRegNum is record
    (
        NumCat number,
        codExp experimentos.codigo%type,
        codVers versiones.codigo%type,
        nifCat catadores.nif%type
    );
    type tTablaNum is table of tRegNum
    index by binary_integer;
    vtablaNum tTablaNum;
    procedure ContarCat(p_NumCat number,
                        p_codExp experimentos.codigo%type,
                        p_codVers versiones.codigo%type,
                        p_nifCat in out catadores.nif%type);
    procedure sumarCat (p_codExp experimentos.codigo%type,
                        p_codVers versiones.codigo%type,
                        p_nifCat catadores.nif%type);
end NumCatadores;
/


create or replace trigger RellenarTablaNumCat
after insert or update on puntuaciones
declare
    cursor c_numcat is
    select count(*) as num, cod_exp, cod_vers, nif_cat
    from puntuaciones
    group by (cod_exp, cod_vers, nif_cat);
    i number:=0;
begin
    for v_numcat in c_numcat loop
        NumCatadores.vtablaNum(i).NumCat:=v_numcat.num;
        NumCatadores.vtablaNum(i).codExp:=v_numcat.cod_exp;
        NumCatadores.vtablaNum(i).codVers:=v_numcat.cod_vers;
        NumCatadores.vtablaNum(i).nifCat:=v_numcat.nif_cat;
        i:=i+1;
    end loop;
end RellenarTablaNumCat;
/

create or replace procedure ContarCat(p_NumCat in out number,
                                      p_codExp experimentos.codigo%type,
                                      p_codVers versiones.codigo%type,
                                      p_nifCat catadores.nif%type)
is
begin
    for i in NumCatadores.vtablaNum.FIRST..NumCatadores.vtablaNum.LAST loop
        if p_codExp=NumCatadores.vtablaNum(i).codExp and p_codVers=NumCatadores.vtablaNum(i).codVers and p_nifCat=NumCatadores.vtablaNum(i).nifCat then
            p_NumCat:=NumCatadores.vtablaNum(i).NumCat;
        end if;
    end loop;
end ContarCat;
/

create or replace procedure sumarCat (p_codExp experimentos.codigo%type,
                                      p_codVers versiones.codigo%type,
                                      p_nifCat catadores.nif%type)
is
begin
    for i in NumCatadores.vtablaNum.FIRST..NumCatadores.vtablaNum.LAST loop
        if NumCatadores.vtablaNum(i).codExp=p_codExp and NumCatadores.vtablaNum(i).codVers=p_codVers and NumCatadores.vtablaNum(i).nifCat=p_nifCat then
            NumCatadores.vtablaNum(i).NumCat:=NumCatadores.vtablaNum(i).NumCat+1;
        end if;
    end loop;
end sumarCat;
/


create or replace trigger ComprobarCatNoMasDe3
after insert or update on puntuaciones
for each row
declare
    v_numcat number;
begin
    ContarCat(v_numcat, :new.cod_exp, :new.cod_vers, :new.nif_cat);
    if v_numcat>=3 then
        raise_application_error(-20001,'Este catador ya ha votado 3 veces');
    else
        sumarCat(:new.cod_exp, :new.cod_vers, :new.nif_cat);   
    end if;
end ComprobarCatNoMasDe3;
/



7. Realiza los módulos de programación necesarios para evitar 
que un investigador figure como colaborador de un experimento 
del que es responsable.

create or replace trigger ComprobarInvestigador
after insert or update on colaboraciones
for each row
declare
    v_inv investigadores.nif%type;
begin
    select nif_inv into v_inv
    from experimentos
    where codigo=:new.cod_exp;
    if v_inv=:new.nif_inv then
        raise_application_error(-20101, 'No puedes añadir a ese investigador como colaborador porque es el responsable del experimento');
    end if;    
end ComprobarInvestigador;
/

create or replace trigger ComprobarResponsableInv
after update on experimentos
for each row
declare
    cursor c_colab is
    select nif_inv
    from colaboraciones
    where cod_exp=:new.codigo;
begin
    for v_colab in c_colab loop
        if v_colab.nif_inv=:new.nif_inv then
            raise_application_error(-20101, 'No puedes modificar al responsable del experimento porque actualmente es colaboradores');
        end if;
    end loop;
end ComprobarResponsableInv;
/



8. Realiza los módulos de programación necesarios para evitar 
que una versión de un experimento tenga colaborando más de 
cinco investigadores si usa menos de tres ingredientes 
elaborados a partir de otros.




