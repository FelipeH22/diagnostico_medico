from conexion_db import base
from datetime import date

id_usr = int()
iddiagnostico=int()

def g_diagnostico(id_enfermedad):
    fecha = date.today()
    cursor=base.cursor()
    comando = "INSERT INTO diagnostico (fecha_diagnostico, idenfermedad) VALUES (%s, %s)"
    cursor.execute(comando, (fecha,id_enfermedad))
    base.commit()
    global iddiagnostico
    iddiagnostico = cursor.getlastrowid()

def g_usr_diag(id_diagnostico,correo):
    global iddiagnostico
    id_diagnostico = iddiagnostico
    cursor = base.cursor()
    comando = "SELECT * FROM usuario WHERE correo_usuario= %s"
    cursor.execute(comando, (correo,))
    res = cursor.fetchall()
    if res != []:
        for x in res:
            global id_usr
            id_usr = x[0]
    comando = "INSERT INTO usuario_diagnostico (idusuario, iddiagnostico) VALUES (%s, %s)"
    cursor.execute(comando, (id_usr ,id_diagnostico))
    base.commit()