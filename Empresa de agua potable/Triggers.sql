------------------------------------------------Trigger---------------------------------------------------
----------------------------------------------------------------------------------------------------------
-----------Se desea crear un trigger que impida que el cliente se registre con el mismo usuario, ademas---
---------- que de ser ingresado este mismo usuario muestre un mensaje por consola que ya esta en uso.----- 
---------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION impedir_Usuario()
    RETURNS TRIGGER 
    LANGUAGE PLPGSQL
    AS
$$
DECLARE
	-- Cursor EXPLICITO
	cur_usuario CURSOR FOR SELECT cliente_usuario FROM Cliente;
    reg RECORD;
BEGIN
    FOR reg IN cur_usuario
    LOOP
        IF NEW.cliente_usuario = reg.cliente_usuario THEN
            RAISE EXCEPTION 'El correo: % ya está en uso.', reg.cliente_usuario;
        END IF;
    END LOOP;
    RETURN NEW;
END;
$$
CREATE TRIGGER impedir_Usuario
 BEFORE INSERT
  ON Cliente
  FOR EACH ROW
  EXECUTE PROCEDURE impedir_Usuario()


Insert into Cliente values ('21235','Martin','Zamora','135139818-3','3/11/2001','0986845684','Masculino','Calle San Andres AV 15','carloszamORA@gmail.com','carlos2020');
select * from Cliente
 Insert into Cliente values ('21240','Carlos','Zamora','135139818-3','3/11/2001','0986845684','Masculino','Calle San Andres AV 15','carloszamORA@gmail.com','carzam03');

