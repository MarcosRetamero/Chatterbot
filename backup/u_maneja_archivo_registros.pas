UNIT U_MANEJA_ARCHIVO_REGISTROS;
{$ CODEPAGE UTF8}
INTERFACE

USES u_archivo_registros, CRT;

PROCEDURE LEE_R(VAR ARCH:T_ARCHIVO; POS:CARDINAL; VAR R:t_dato);
PROCEDURE GUARDA_R(VAR ARCH:T_ARCHIVO; var POS:CARDINAL; R:t_dato);
PROCEDURE CARGA_R(VAR r: t_dato);
{PROCEDURE LISTADO(VAR ARCH:T_ARCHIVO);}
PROCEDURE LISTADO2 (VAR ARCH:T_ARCHIVO);
PROCEDURE ALTAS (VAR ARCH:T_ARCHIVO);

IMPLEMENTATION

PROCEDURE LEE_R(VAR ARCH:T_ARCHIVO; POS:CARDINAL; VAR R:t_dato);  //PARA MOSTRAR LOS VALORES
BEGIN
SEEK(ARCH, POS);
READ(ARCH, R);
END;

PROCEDURE GUARDA_R(VAR ARCH:T_ARCHIVO; var POS:CARDINAL; R:t_dato);   //PARA GUARDAR LOS VALORES EN EL ARCHIVO
BEGIN
SEEK(ARCH, POS);
WRITE(ARCH, R);
END;

PROCEDURE CARGA_R(VAR r: t_dato);                              //PARA LLENAR LOS REGISTROS
begin
RANDOMIZE;
GOTOXY(45,15);
WRITE('NOMBRE: ');
READLN (R.nombre);
GOTOXY(45,17);
WRITE('TELEFONO: ');
READLN (R.TELEFONO);
R.N_consulta:=RANDOM(10000);

end;

PROCEDURE ALTAS (VAR ARCH:T_ARCHIVO);                           //PARA INGRESAR VALORES, UTILIZA PROCEDURE CARGA_R Y PROCEDURE GUARDA_R
VAR
R:t_dato;
POS:CARDINAL;
RESP:CHAR;
BEGIN
CLRSCR;
GOTOXY(45,10);
WRITE('*******ALTAS******') ;
GOTOXY(45,12);
WRITE('INGRESA? PRESIONE N PARA SALIR: ') ;
READLN (RESP);
WHILE RESP <> 'N' DO
BEGIN
CARGA_R(R);                                             //PROCEDURE CARGA_R(VAR r: t_dato);
POS:=FILESIZE(ARCH);                                    //HACE QUE POS SEA LA ULT POSICION DISPONIBLE
GUARDA_R(ARCH, POS,R);                                  //PROCEDURE GUARDA_R(VAR ARCH:T_ARCHIVO; var POS:CARDINAL; R:t_dato);
clrscr;
GOTOXY(55,25);
WRITE('INGRESA? PRESIONE N PARA SALIR: ') ;
READLN (RESP);
END;
END;

{PROCEDURE LISTADO(VAR ARCH:T_ARCHIVO);
VAR
R:t_dato;
BEGIN
RESET(ARCH);
WHILE NOT(EOF(ARCH)) DO
BEGIN
READ(ARCH, R);
WRITELN(R.nombre);
writeln(r.celu);
END;
END;
  }

PROCEDURE LISTADO2 (VAR ARCH:T_ARCHIVO);
VAR
R:t_dato;
I:CARDINAL;
BEGIN
CLRSCR;
GOTOXY(45,10);
WRITE('*******LISTADO******') ;
FOR I:= 0 TO FILESIZE(ARCH)-1 DO
BEGIN
LEE_R (ARCH,I,R);                                      //SEEK(ARCH,POS); READ(ARCH, R);
GOTOXY(45,12);
WRITELN('Nombre del paciente: ',R.nombre);
GOTOXY(45,14);
WRITE('Número de teléfono: ',R.TELEFONO);
GOTOXY(45,16);
WRITE('Número de la consulta: ',R.N_consulta);
READKEY;
clrscr;
END;
END;

{PROCEDURE BURBUJA1(VAR ARCH:T_ARCHIVO);
VAR
I,J:BYTE;
R:T_DATO;
AUX: T_DATO;
BEGIN
FOR I:=1 TO FILESIZE(ARCH)-1 DO
FOR J:= 1 TO FILESIZE(ARCH)-1 DO
IF R.NOMBRE > R.NOMBRE+1 THEN
BEGIN
AUX:= R.NOMBRE;
R.NOMBRE:= R.NOMBRE+1;
R.NOMBRE+1:= AUX;
END;
END;}




END.
