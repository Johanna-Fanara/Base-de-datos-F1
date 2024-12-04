CREATE DATABASE BDTPOF1;

USE BDTPOF1;

CREATE PROCEDURE CREARTABLAEQUIPO
AS
BEGIN
CREATE TABLE EQUIPO(
NOMBRE VARCHAR(50) PRIMARY KEY,
PAIS VARCHAR(50),
SPONSOR VARCHAR(50),
CANT_TITULOS INT
);
END;
 

CREATE PROCEDURE CREARTABLAPILOTO
AS
BEGIN
CREATE TABLE PILOTO(
IDPILOTO INT PRIMARY KEY,
NOMBRE VARCHAR(50),
APELLIDO VARCHAR(50),
EDAD INT,
NACIONALIDAD VARCHAR(50),
CARRERAS_GANADAS INT,
CANT_TITULOS INT,
NOMBRE_EQUIPO VARCHAR(50),
CONSTRAINT VERIFICAR_IDPILOTO CHECK (IDPILOTO>=1 AND IDPILOTO<=99)
);
END;



CREATE PROCEDURE CREARTABLAINGENIERO
AS
BEGIN
CREATE TABLE INGENIERO(
NOMBRE VARCHAR(50),
APELLIDO VARCHAR(50),
NACIONALIDAD VARCHAR(50),
NOMBRE_EQUIPO VARCHAR(50),
NOMBRE_PILOTO VARCHAR(50) PRIMARY KEY
);
END;


CREATE PROCEDURE CREARTABLACARRERA
AS
BEGIN
CREATE TABLE CARRERA(
NOMBRE VARCHAR(100) PRIMARY KEY
);
END;


CREATE PROCEDURE CREARTABLACIRCUITO
AS
BEGIN
CREATE TABLE CIRCUITO(
NOMBRE VARCHAR(100) PRIMARY KEY,
CIUDAD VARCHAR(100),
NUM_CURVAS INT,
LONGITUD FLOAT,
CARRERA VARCHAR(100),
FOREIGN KEY (CARRERA) REFERENCES CARRERA(NOMBRE)
);
END;


CREATE PROCEDURE CREARTABLARESULTADOS
AS
BEGIN
CREATE TABLE RESULTADOS(
POSICION INT,
PILOTO VARCHAR(50),
EQUIPO VARCHAR(50),
PUNTOS INT,
CARRERA VARCHAR(100),
FOREIGN KEY (CARRERA) REFERENCES CARRERA(NOMBRE)
);
END;

EXECUTE CREARTABLAEQUIPO;
EXECUTE CREARTABLAPILOTO;
EXECUTE CREARTABLAINGENIERO;
EXECUTE CREARTABLACARRERA;
EXECUTE CREARTABLACIRCUITO;
EXECUTE CREARTABLARESULTADOS;

--------------------------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE INSERTAREQUIPO
@NOMBRE VARCHAR(50),
@PAIS VARCHAR(50),
@SPONSOR VARCHAR(50),
@CANT_TITULOS INT
AS
BEGIN
	BEGIN TRY
	INSERT EQUIPO(NOMBRE,PAIS,SPONSOR,CANT_TITULOS)
	VALUES(@NOMBRE,@PAIS,@SPONSOR,@CANT_TITULOS);

	END TRY

	BEGIN CATCH
	PRINT 'ERROR AL INSERTAR UN EQUIPO'

	END CATCH
END;

EXECUTE INSERTAREQUIPO  "Red Bull", "Austria", "UADE", 6;
EXECUTE INSERTAREQUIPO  "Ferrari", "Italia", "Shell", 16 ;
EXECUTE INSERTAREQUIPO  "Williams", "Reino Unido", "Gulf", 9;
EXECUTE INSERTAREQUIPO  "McLaren", "Reino Unido", "OKX", 8;
EXECUTE INSERTAREQUIPO  "Mercedes", "Reino Unido", "Petronas", 8;
EXECUTE INSERTAREQUIPO  "Aston Martin", "Reino Unido", "Cognizant",0;
EXECUTE INSERTAREQUIPO  "Alpine", "Francia", "BWT",0;
EXECUTE INSERTAREQUIPO  "Alfa Romeo", "Suiza", "Stake",0;
EXECUTE INSERTAREQUIPO  "Alpha Tauri", "Italia", "Red Bull", 0 ; 
EXECUTE INSERTAREQUIPO  "Haas", "Estados Unidos", "MoneyGram",0;

--------------------------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE INSERTARPILOTO
@IDPILOTO INT,
@NOMBRE VARCHAR(50),
@APELLIDO VARCHAR(50),
@EDAD INT,
@NACIONALIDAD VARCHAR(50),
@CARRERAS_GANADAS INT,
@CANT_TITULOS INT,
@NOMBRE_EQUIPO VARCHAR(50)
AS
BEGIN
	BEGIN TRY
	INSERT PILOTO(IDPILOTO,NOMBRE,APELLIDO,EDAD,NACIONALIDAD,CARRERAS_GANADAS,CANT_TITULOS,NOMBRE_EQUIPO)
	VALUES (@IDPILOTO,@NOMBRE,@APELLIDO,@EDAD,@NACIONALIDAD,@CARRERAS_GANADAS,@CANT_TITULOS,@NOMBRE_EQUIPO);

	END TRY

	BEGIN CATCH
	PRINT 'ERROR AL INSERTAR UN PILOTO'

	END CATCH
END;

EXECUTE INSERTARPILOTO 4,"Lando", "Norris", 23 ,"Reino Unido", 0 , 0 , "McLaren";
EXECUTE INSERTARPILOTO 81, "Oscar", "Piastri", 22, "Australia", 0, 0 ,"McLaren";
EXECUTE INSERTARPILOTO 55, "Carlos", "Sainz", 28, "España", 2, 0, "Ferrari";
EXECUTE INSERTARPILOTO 16, "Charles", "Leclerc", 25 , "Monaco", 5,0,"Ferrari";
EXECUTE INSERTARPILOTO 1, "Max", "Verstappen", 26, "Paises Bajos", 54, 3, "Red Bull";
EXECUTE INSERTARPILOTO 11, "Sergio","Perez", 33, "Mexico", 6, 0,"Red Bull";
EXECUTE INSERTARPILOTO 44, "Lewis", "Hamilton", 38, "Reino Unido", 103,7, "Mercedes";
EXECUTE INSERTARPILOTO 63, "George", "Russell", 25, "Reino Unido", 1,0,"Mercedes";
EXECUTE INSERTARPILOTO 22, "Yuki", "Tsunoda", 23, "Japon",0,0,"Alpha Tauri";
EXECUTE INSERTARPILOTO 3, "Daniel", "Ricciardo", 33, "Australia", 8,0,"Alpha Tauri";
EXECUTE INSERTARPILOTO 14, "Fernando", "Alonso", 41, "España", 32, 2, "Aston Martin";
EXECUTE INSERTARPILOTO 18, "Lance", "Stroll", 24, "Canada", 0,0,"Aston Martin";
EXECUTE INSERTARPILOTO 10, "Pierre", "Gasly", 27, "Francia", 1,0,"Alpine";
EXECUTE INSERTARPILOTO 31, "Esteban", "Ocon", 26, "Francia", 1,0,"Alpine";
EXECUTE INSERTARPILOTO 23, "Alexander", "Albon", 27, "Tailandia", 0,0,"Williams";
EXECUTE INSERTARPILOTO 2, "Logan", "Sargeant", 22, "Estados Unidos", 0,0,"Williams";
EXECUTE INSERTARPILOTO 27, "Nico", "Hulkenberg", 35, "Alemania", 0,0,"Haas";
EXECUTE INSERTARPILOTO 20, "Kevin", "Magnussen", 30, "Dinamarca", 0,0,"Haas";
EXECUTE INSERTARPILOTO 77, "Valtteri", "Bottas",33,"Finlandia",10,0,"Alfa Romeo";
EXECUTE INSERTARPILOTO 24, "Zhou", "Guanyu", 24, "China",0,0,"Alfa Romeo";
EXECUTE INSERTARPILOTO 30, "Lionel", "Messi", 37, "Argentina",200,10,"Barcelona";

--------------------------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE INSERTARINGENIERO
@NOMBRE VARCHAR(50),
@APELLIDO VARCHAR(50),
@NACIONALIDAD VARCHAR(50),
@NOMBRE_EQUIPO VARCHAR(50),
@NOMBRE_PILOTO VARCHAR(50)
AS
BEGIN
	BEGIN TRY
	INSERT INGENIERO(NOMBRE,APELLIDO,NACIONALIDAD,NOMBRE_EQUIPO,NOMBRE_PILOTO)
	VALUES (@NOMBRE,@APELLIDO,@NACIONALIDAD,@NOMBRE_EQUIPO,@NOMBRE_PILOTO);

	END TRY

	BEGIN CATCH
	PRINT 'ERROR AL INSERTAR UN INGENIERO'

	END CATCH
END;

EXECUTE INSERTARINGENIERO "Jose Manuel", "Lopez", "Español", "McLaren", "Lando Norris";
EXECUTE INSERTARINGENIERO "Tom", "Stallard", "Británico", "McLaren", "Oscar Piastri";
EXECUTE INSERTARINGENIERO "Ricardo", "Adammi", "Italiano", "Ferrari", "Carlos Sainz";
EXECUTE INSERTARINGENIERO "Xavier Marcos", "Padros", "Español", "Ferrari", "Charles Leclerc";
EXECUTE INSERTARINGENIERO "Gianpero", "Lambiase", "Italiano", "Red Bull", "Max Verstappen";
EXECUTE INSERTARINGENIERO "Hugh", "Bird", "Britanico", "Red Bull", "Sergio Pérez"; 
EXECUTE INSERTARINGENIERO "Peter", "Bonnington", "Británico", "Mercedes", "Lewis Hamilton";
EXECUTE INSERTARINGENIERO "Marcus", "Dudley", "Britanico" ,"Mercedes", "George Rusell";
EXECUTE INSERTARINGENIERO "Mattia", "Spini", "Italiano", "Alpha Tauri", "Yuki Tsunoda";
EXECUTE INSERTARINGENIERO "Pierre", "Hamelin", "Frances", "Alpha Tauri", "Daniel Ricciardo";
EXECUTE INSERTARINGENIERO "Chris", "Cronin", "Británico","Aston Martin", "Fernando Alonso";
EXECUTE INSERTARINGENIERO "Ben", "Michell", "Británico","Aston Martin", "Lance Stroll";
EXECUTE INSERTARINGENIERO "John", "Howard", "Británico", "Alpine", "Pierre Gasly"; 
EXECUTE INSERTARINGENIERO "Josh", "Peckett" , "Británico", "Alpine", "Esteban Ocon"; 
EXECUTE INSERTARINGENIERO "James", "Urwin", "Británico", "Williams", "Alexander Albon"; 
EXECUTE INSERTARINGENIERO "Gaetan", "Jego", "Frances", "Williams", "Logan Sargeant"; 
EXECUTE INSERTARINGENIERO "Gary", "Gannon", "Británico", "Haas", "Nico Hulkenberg";
EXECUTE INSERTARINGENIERO "Mark", "Slade", "Británico", "Haas", "Kevin Magnussen";
EXECUTE INSERTARINGENIERO "Alex", "Chan", "Britanico", "Alfa Romeo", "Valtteri Bottas";
EXECUTE INSERTARINGENIERO "Andrea", "Benisi", "Italiano", "Alfa Romeo", "Zhou Guanyu";

--------------------------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE INSERTARCARRERA
@NOMBRE VARCHAR(100)
AS
BEGIN
	BEGIN TRY
	INSERT CARRERA(NOMBRE)
	VALUES (@NOMBRE);

	END TRY

	BEGIN CATCH
	PRINT 'ERROR AL INSERTAR CARRERA'

	END CATCH
END;

EXECUTE INSERTARCARRERA "Barein";
EXECUTE INSERTARCARRERA "Arabia Saudita";
EXECUTE INSERTARCARRERA "Australia";
EXECUTE INSERTARCARRERA "Azerbaiyan";
EXECUTE INSERTARCARRERA "Miami";
EXECUTE INSERTARCARRERA "Monaco";
EXECUTE INSERTARCARRERA "España";
EXECUTE INSERTARCARRERA "Canada";
EXECUTE INSERTARCARRERA "Austria";
EXECUTE INSERTARCARRERA "Reino Unido";
EXECUTE INSERTARCARRERA "Hungria";
EXECUTE INSERTARCARRERA "Belgica";
EXECUTE INSERTARCARRERA "Paises Bajos";
EXECUTE INSERTARCARRERA "Italia";
EXECUTE INSERTARCARRERA "Singapur";
EXECUTE INSERTARCARRERA "Japon";
EXECUTE INSERTARCARRERA "Qatar";
EXECUTE INSERTARCARRERA "Estados Unidos";
EXECUTE INSERTARCARRERA "Mexico";
EXECUTE INSERTARCARRERA "Brasil"
EXECUTE INSERTARCARRERA "Las Vegas"
EXECUTE INSERTARCARRERA "Abu Dhabi"

--------------------------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE INSERTARCIRCUITO
@NOMBRE VARCHAR(100),
@CIUDAD VARCHAR(100),
@NUM_CURVAS INT,
@LONGITUD FLOAT,
@CARRERA VARCHAR(100)
AS
BEGIN
	BEGIN TRY
	INSERT CIRCUITO(NOMBRE,CIUDAD,NUM_CURVAS,LONGITUD,CARRERA) 
	VALUES (@NOMBRE ,@CIUDAD,@NUM_CURVAS,@LONGITUD,@CARRERA); 

	END TRY

	BEGIN CATCH
	PRINT 'ERROR AL INSERTAR CIRCUITO'

	END CATCH
END;

EXECUTE INSERTARCIRCUITO "Circuito Internacional de Baréin", "Sakhir", 15, 5.412, "Barein"; 
EXECUTE INSERTARCIRCUITO "Circuito de la Corniche de Yeda", "Yeda", 27,  6.175, "Arabia Saudita";
EXECUTE INSERTARCIRCUITO "Circuito de Albert Park", "Melbourne", 16,  5.303, "Australia";
EXECUTE INSERTARCIRCUITO "Circuito callejero de Bakú", "Bakú", 20, 6.003, "Azerbaiyan";
EXECUTE INSERTARCIRCUITO "Autódromo Internacional de Miami", "Miami", 19,  5.41, "Miami";
EXECUTE INSERTARCIRCUITO "Circuito de Barcelona", "Barcelona", 14, 4.657, "España";
EXECUTE INSERTARCIRCUITO "Circuito de Montreal", "Montreal", 14, 4.361, "Canada";
EXECUTE INSERTARCIRCUITO "Red Bull Ring", "Spielberg", 10, 4.318, "Austria";
EXECUTE INSERTARCIRCUITO "Circuito de Silverstone", "Northamptonshire", 18, 5.901, "Reino Unido";
EXECUTE INSERTARCIRCUITO "Hungaroring", "Mogyoród", 14, 4.381, "Hungria"; 
EXECUTE INSERTARCIRCUITO "Circuito de Spa-Francorchamps", "Francorchamps", 20,  7.004, "Belgica";
EXECUTE INSERTARCIRCUITO "Circuito de Zandvoort", "Zandvoort", 14, 4.307, "Paises Bajos";
EXECUTE INSERTARCIRCUITO "Autodromo Nacional de Monza", "Monza", 11, 5.793, "Italia";
EXECUTE INSERTARCIRCUITO "Circuito Urbano Marina Bay", "Singapur", 23, 5.065, "Singapur";
EXECUTE INSERTARCIRCUITO "Circuito de Suzuka", "Suzuka", 18, 5.807, "Japon";
EXECUTE INSERTARCIRCUITO "Circuito Internacional de Lusail", "Lusail",  16, 5.380 , "Qatar";
EXECUTE INSERTARCIRCUITO "Circuito de las Américas" , "Austin", 20,  5.513 , "Estados Unidos";
EXECUTE INSERTARCIRCUITO "Autódromo Hermanos Rodríguez", "Ciudad de México", 17, 4.304, "Mexico";
EXECUTE INSERTARCIRCUITO "Interlagos", "Sao Paulo", 15, 4.309, "Brasil";
EXECUTE INSERTARCIRCUITO "Circuito callejero de Las Vegas", "Las Vegas", 17, 6.201, "Las Vegas";
EXECUTE INSERTARCIRCUITO "Circuito Yas Marina",  "Isla Yas",  16,  5.281, "Abu Dhabi";

--------------------------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE INSERTARRESULTADOS
@POSICION INT,
@PILOTO VARCHAR(50),
@EQUIPO VARCHAR(50),
@PUNTOS INT,
@CARRERA VARCHAR(50)
AS
BEGIN
	BEGIN TRY
	INSERT RESULTADOS(POSICION,PILOTO,EQUIPO,PUNTOS,CARRERA)
	VALUES (@POSICION ,@PILOTO,@EQUIPO,@PUNTOS,@CARRERA);

	END TRY

	BEGIN CATCH
	PRINT 'ERROR AL INSERTAR RESULTADO'

	END CATCH
END;

EXECUTE INSERTARRESULTADOS 1, "Verstappen", "Red Bull", 25,"Barein";
EXECUTE INSERTARRESULTADOS 2, "Perez", "Red Bull", 18, "Barein";
EXECUTE INSERTARRESULTADOS 3, "Alonso", "Aston Martin", 15, "Barein";
EXECUTE INSERTARRESULTADOS 1, "Perez", "Red Bull", 25, "Arabia Saudita";
EXECUTE INSERTARRESULTADOS 2, "Verstappen", "Red Bull", 19, "Arabia Saudita";
EXECUTE INSERTARRESULTADOS 3, "Alonso", "Aston Martin", 15, "Arabia Saudita";
EXECUTE INSERTARRESULTADOS 1, "Verstappen", "Red Bull", 25, "Australia";
EXECUTE INSERTARRESULTADOS 2, "Hamilton", "Mercedes", 18, "Australia";
EXECUTE INSERTARRESULTADOS 3, "Alonso", "Aston Martin", 15, "Australia";
EXECUTE INSERTARRESULTADOS 1, "Perez", "Red Bull", 25, "Azerbaiyan";
EXECUTE INSERTARRESULTADOS 2, "Verstappen","Red Bull", 18,"Azerbaiyan";
EXECUTE INSERTARRESULTADOS 3, "Leclerc", "Ferrari",15,"Azerbaiyan";
EXECUTE INSERTARRESULTADOS 1, "Verstappen", "Red Bull", 26,"Miami";
EXECUTE INSERTARRESULTADOS 2, "Perez", "Red Bull", 18,"Miami";
EXECUTE INSERTARRESULTADOS 3, "Alonso", "Aston Martin", 15,"Miami";
EXECUTE INSERTARRESULTADOS 1, "Verstappen", "Red Bull", 25,"Monaco";
EXECUTE INSERTARRESULTADOS 2, "Alonso", "Aston Martin", 18,"Monaco";
EXECUTE INSERTARRESULTADOS 3, "Ocon", "Alpine", 15, "Monaco";
EXECUTE INSERTARRESULTADOS 1, "Verstappen", "Red Bull", 26,"España";
EXECUTE INSERTARRESULTADOS 2, "Hamilton", "Mercedes", 18, "España";
EXECUTE INSERTARRESULTADOS 3, "Russell", "Mercedes", 15, "España";
EXECUTE INSERTARRESULTADOS 1, "Verstappen", "Red Bull", 25,"Canada";
EXECUTE INSERTARRESULTADOS 2, "Alonso", "Aston Martin", 18,"Canada";
EXECUTE INSERTARRESULTADOS 3, "Hamilton", "Mercedes", 15, "Canada";
EXECUTE INSERTARRESULTADOS 1, "Verstappen", "Red Bull", 26,"Austria";
EXECUTE INSERTARRESULTADOS 2, "Leclerc", "Ferrari",18,"Austria";
EXECUTE INSERTARRESULTADOS 3,"Perez", "Red Bull", 15,"Austria";
EXECUTE INSERTARRESULTADOS 1, "Verstappen", "Red Bull", 26,"Reino Unido";
EXECUTE INSERTARRESULTADOS 2, "Norris","McLaren", 18, "Reino Unido"
EXECUTE INSERTARRESULTADOS 3, "Hamilton", "Mercedes", 15, "Reino Unido";
EXECUTE INSERTARRESULTADOS 1, "Verstappen", "Red Bull", 26,"Hungria";
EXECUTE INSERTARRESULTADOS 2, "Norris","McLaren", 18, "Hungria";
EXECUTE INSERTARRESULTADOS 3,"Perez", "Red Bull", 15,"Hungria";
EXECUTE INSERTARRESULTADOS 1, "Verstappen", "Red Bull", 25,"Belgica";
EXECUTE INSERTARRESULTADOS 2,"Perez", "Red Bull", 18,"Belgica";
EXECUTE INSERTARRESULTADOS 3, "Leclerc", "Ferrari",15,"Belgica";
EXECUTE INSERTARRESULTADOS 1, "Verstappen", "Red Bull", 25,"Paises Bajos";
EXECUTE INSERTARRESULTADOS 2, "Alonso", "Aston Martin", 19,"Paises Bajos";
EXECUTE INSERTARRESULTADOS 3, "Gasly", "Alpine", 15, "Paises Bajos"
EXECUTE INSERTARRESULTADOS 1, "Verstappen", "Red Bull", 25,"Italia";
EXECUTE INSERTARRESULTADOS 2,"Perez", "Red Bull", 18,"Italia";
EXECUTE INSERTARRESULTADOS 3, "Sainz", "Ferrari", 15,"Italia";
EXECUTE INSERTARRESULTADOS 1, "Sainz", "Ferrari", 25,"Singapur";
EXECUTE INSERTARRESULTADOS 2, "Norris","McLaren", 18, "Singapur";
EXECUTE INSERTARRESULTADOS 3, "Hamilton", "Mercedes", 16, "Singapur";
EXECUTE INSERTARRESULTADOS 1, "Verstappen", "Red Bull", 26,"Japon";
EXECUTE INSERTARRESULTADOS 2, "Norris","McLaren", 18, "Japon";
EXECUTE INSERTARRESULTADOS 3, "Piastri", "McLaren", 15,"Japon";
EXECUTE INSERTARRESULTADOS 1, "Verstappen", "Red Bull", 26,"Qatar";
EXECUTE INSERTARRESULTADOS 2, "Piastri", "McLaren", 18,"Qatar";
EXECUTE INSERTARRESULTADOS 3, "Norris","McLaren", 15, "Qatar";
EXECUTE INSERTARRESULTADOS 1, "Verstappen", "Red Bull", 25,"Estados Unidos";
EXECUTE INSERTARRESULTADOS 2, "Norris","McLaren", 18, "Estados Unidos";
EXECUTE INSERTARRESULTADOS 3, "Sainz", "Ferrari", 15,"Estados Unidos";
EXECUTE INSERTARRESULTADOS 1, "Verstappen", "Red Bull", 25,"Mexico";
EXECUTE INSERTARRESULTADOS 2, "Hamilton", "Mercedes", 19, "Mexico";
EXECUTE INSERTARRESULTADOS 3, "Leclerc", "Ferrari",15,"Mexico";
EXECUTE INSERTARRESULTADOS 1, "Verstappen", "Red Bull", 25,"Brasil";
EXECUTE INSERTARRESULTADOS 2, "Norris","McLaren", 19, "Brasil";
EXECUTE INSERTARRESULTADOS 3, "Alonso", "Aston Martin", 15,"Brasil";
EXECUTE INSERTARRESULTADOS 1, "Verstappen", "Red Bull", 25,"Las Vegas";
EXECUTE INSERTARRESULTADOS 2, "Leclerc", "Ferrari",18,"Las Vegas";
EXECUTE INSERTARRESULTADOS 3,"Perez", "Red Bull", 15,"Las Vegas";
EXECUTE INSERTARRESULTADOS 1, "Verstappen", "Red Bull", 26,"Abu Dhabi";
EXECUTE INSERTARRESULTADOS 2, "Leclerc", "Ferrari",18,"Abu Dhabi";
EXECUTE INSERTARRESULTADOS 3, "Russell", "Mercedes", 15, "Abu Dhabi";



--------------------------------------------------------------------------------------------------------------------------------------------


CREATE PROCEDURE ACTUALIZARTITULOEQUIPO
@NOMBRE VARCHAR(50),
@CANT_TITULOS INT
AS
BEGIN
	BEGIN TRY
	UPDATE EQUIPO
	SET CANT_TITULOS=@CANT_TITULOS
	WHERE NOMBRE=@NOMBRE;

	END TRY

	BEGIN CATCH
	PRINT 'ERROR AL ACTUALIZAR TITULOS DEL EQUIPO'

	END CATCH
END;


CREATE PROCEDURE ACTUALIZAREDADPILOTO
@IDPILOTO INT,
@EDAD INT
AS
BEGIN
	BEGIN TRY
	UPDATE PILOTO
	SET EDAD=@EDAD
	WHERE IDPILOTO=@IDPILOTO;

	END TRY

	BEGIN CATCH
	PRINT 'ERROR AL ACTUALIZAR EDAD DEL PILOTO'

	END CATCH
END;


CREATE PROCEDURE ACTUALIZARLONGITUDCIRCUITO
@NOMBRE VARCHAR(50),
@LONGITUD FLOAT
AS
BEGIN
	BEGIN TRY
	UPDATE CIRCUITO
	SET LONGITUD=@LONGITUD
	WHERE NOMBRE=@NOMBRE;

	END TRY

	BEGIN CATCH
	PRINT 'ERROR AL ACTUALIZAR LONGITUD DEL CIRCUITO'

	END CATCH
END;

CREATE PROCEDURE ACTUALIZARRESULTADOS


--------------------------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE ELIMINAREQUIPO
@NOMBRE VARCHAR(50)
AS
BEGIN
	DELETE FROM EQUIPO WHERE NOMBRE=@NOMBRE;
END;


CREATE PROCEDURE ELIMINARPILOTO
@IDPILOTO INT
AS
BEGIN
	DELETE FROM PILOTO WHERE IDPILOTO=@IDPILOTO;
END;


CREATE PROCEDURE ELIMINARINGENIERO
@NOMBRE_PILOTO VARCHAR(50)
AS
BEGIN
	DELETE FROM INGENIERO WHERE NOMBRE_PILOTO=@NOMBRE_PILOTO;
END;

CREATE PROCEDURE ELIMINARCIRCUITO
@NOMBRE VARCHAR(50)
AS
BEGIN
	DELETE FROM CIRCUITO WHERE NOMBRE=@NOMBRE;
END;






























































