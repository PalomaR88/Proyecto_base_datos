
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
returns ingredientes.codigo%type as '
declare
    v_codIng ingredientes.codigo%type;
begin
    select codigo into v_codIng
    from ingredientes
    where nombre=p_nombreIng;
    if not found then
        raise exception ''No existe ningún ingrediente'';
    end if;
    return v_codIng;
end;
' LANGUAGE 'plpgsql';


create or replace function ComprobarCodExpExiste (p_codExp experimentos.codigo%type)
returns experimentos.codigo%type as '
declare
    v_codigo experimentos.codigo%type;
begin
    select codigo into v_codigo
    from experimentos 
    where codigo=p_codExp;
    if not found then
        raise exception ''No existe experimentos con ese codigo'';
    end if;
    return v_codigo;
end;
' LANGUAGE 'plpgsql';


create or replace function ComprobarCodVersExiste (p_codVers versiones.codigo%type,
                                                   p_codExp experimentos.codigo%type)
returns versiones.codigo%type as '
declare
    v_codigo versiones.codigo%type;
begin
    select codigo into v_codigo
    from versiones
    where codigo=p_codVers
    and cod_exp=p_codExp;
    if not found then
        raise exception ''No existe esa versión para ese experimento'';
    end if;
    return v_codigo;
end;
' LANGUAGE 'plpgsql';


create or replace function EncontrarIng (p_codExp experimentos.codigo%type,
                                         p_codVers versiones.codigo%type,
                                         p_codIng ingredientes.codigo%type)
returns float as $$
declare
    v_cantidadVar varchar(20);
    v_cantidadCort varchar(20);
begin    
    select coalesce(cantidad,'0G') into v_cantidadVar
    from ingredientes_por_version
    where cod_ing=p_codIng
    and cod_vers=p_codVers
    and cod_exp=p_codExp;    
    if not found then
        return -1;
    else
        v_cantidadCort:=substring(v_cantidadVar, 1, length(v_cantidadVar)-1);
        return cast(v_cantidadCort as float);
    end if;
end;
$$ LANGUAGE 'plpgsql';


create or replace function EncontrarIngBasico (p_ingrediente_final ingredientes.codigo%type, 
                                               p_codIng ingredientes.codigo%type)
returns float as $$
declare
    v_cantIngComp varchar(20);
    v_cantCort varchar(20);
begin
    select coalesce(cantidad,'0G') into v_cantIngComp
    from composicion_ing_preparados
    where cod_ing_final=p_ingrediente_final
    and cod_ing_base=p_codIng;
    if found then
        v_cantCort:=substring(v_cantIngComp, 1, length(v_cantIngComp)-1);
        return cast(v_cantCort as float);
    else
        return 0;
    end if;
end;
$$ LANGUAGE 'plpgsql';


create or replace function EncontrarIngCompuesto(p_codExp experimentos.codigo%type, 
                                                 p_codVers versiones.codigo%type, 
                                                 p_codIng ingredientes.codigo%type)
returns float as $$
declare

    c_ingrediente cursor for
    select cod_ing
    from ingredientes_por_version
    where cod_exp=p_codExp
    and cod_vers=p_codVers;
    v_ingrediente ingredientes_por_version%rowtype;
    v_cantIngComp float:=0;
    v_totalcantIngComp float:=0;
begin
    open c_ingrediente;
    fetch c_ingrediente into v_ingrediente;
    while found loop
        v_cantIngComp:=EncontrarIngBasico(v_ingrediente.cod_ing, p_codIng);
        v_totalcantIngComp:=v_cantIngComp+v_totalcantIngComp;
        fetch c_ingrediente into v_ingrediente;
    end loop;
    close c_ingrediente;
    if v_totalcantIngComp>0 then
        return -1;
    else
        return v_totalcantIngComp;
    end if;
end;
$$ LANGUAGE 'plpgsql';


select EncontrarIngCompuesto('A1234-B','1.2', 'agua');


create or replace function SumarCantidades(p_cant1 float,
                                           p_cant2 float)
returns float as $$
begin
    if p_cant1>0 then
        if p_cant2>0 then
            return p_cant2+p_cant1;
        else
            return p_cant1;
        end if;
    else
        if p_cant2>0 then
            return p_cant2;
        else
            return p_cant1;
        end if;
    end if;
end;
$$ LANGUAGE 'plpgsql';


create or replace function IngredientesEnVersiones (p_codExp experimentos.codigo%type,
                                                    p_codVers versiones.codigo%type,
                                                    p_nombreIng ingredientes.nombre%type)
returns float as $$
declare
    v_codIng ingredientes.codigo%type;
    v_cantIngBase float;
    v_cantIngComp float;
    v_total float;
begin
    v_codIng:=DevolverCodIng(p_nombreIng);
    perform ComprobarCodExpExiste(p_codExp);
    perform ComprobarCodVersExiste(p_codVers, p_codExp);
    v_cantIngBase:=EncontrarIng(p_codExp, p_codVers, v_codIng);
    v_cantIngComp:=EncontrarIngCompuesto(p_codExp, p_codVers, v_codIng);
    v_total:=SumarCantidades(v_cantIngBase, v_cantIngComp);
    return v_total;
end;
$$ LANGUAGE 'plpgsql';





3. Realiza un trigger que impida que se pruebe una versión de
un experimento antes de que éste comience o después de que 
termine.

create or replace function ControlarFechasVers() 
returns trigger as $$
declare
    c_fechasExp cursor for
    select fecha_inicio, fecha_fin
    from experimentos
    where codigo=new.cod_exp;
    v_fechasExp record;
begin
    open c_fechasExp;
    fetch c_fechasExp into v_fechasExp;
    while found loop
        if new.fecha_prueba not between v_fechasExp.fecha_inicio and v_fechasExp.fecha_fin then
            raise exception 'Esa fecha de version no es valida';
        end if;
        fetch c_fechasExp into v_fechasExp;    
    end loop;
    close c_fechasExp;
    return new;
end;
$$ LANGUAGE 'plpgsql';

create trigger ControlarFechasVersTrigger
before insert or update on versiones
for each row execute
procedure ControlarFechas();



create or replace function ControlarFechasExp() 
returns trigger as $$
declare
    c_fechaVers cursor for
    select fecha_inicio, fecha_fin
    from versiones
    where cod_exp=new.codigo;
    v_fechaVers record;
begin
    open c_fechaVers;
    fetch c_fechaVers into v_fechaVers;
    while found loop
        if v_fechaVers.fecha_prueba not between new.fecha_inicio and new.fecha_fin then
            raise exception 'Esa fecha de experimento no es valida';
        end if;
        fetch c_fechaVers into v_fechaVers;    
    end loop;
    close c_fechaVers;
    return new;
end;
$$ LANGUAGE 'plpgsql';

create trigger ControlarFechasExpTrigger
before update on experimentos
for each row execute
procedure ControlarFechasExp();


