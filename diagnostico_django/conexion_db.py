import mysql.connector

base = mysql.connector.connect(
    host="localhost",
    user="root",
    password="toor",
    database="diagnostico_medico"
)
id=int()

def consulta(resultado):
    cursor = base.cursor()
    enfermedad = resultado
    comando="SELECT descripcion_enfermedad FROM enfermedades WHERE nombre_enfermedad = %s"
    cursor.execute(comando,(enfermedad,))
    res = cursor.fetchall()
    print("Descripción de la enfermedad:\n")
    for x in res:
        print(x[0])
    comando = "SELECT tratamiento_enfermedad FROM enfermedades WHERE nombre_enfermedad = %s"
    cursor.execute(comando, (enfermedad,))
    res = cursor.fetchall()
    print("\nTratamiento de la enfermedad:\n")
    for x in res:
        print(x[0])

def get_id(enfermedad):
    cursor = base.cursor()
    comando = "SELECT id_enfermedad FROM enfermedades WHERE nombre_enfermedad = %s"
    cursor.execute(comando, (enfermedad,))
    res = cursor.fetchall()
    for x in res:
        id=x[0]
    return id