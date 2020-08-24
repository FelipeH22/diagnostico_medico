from conexion_db import base

id_usr=0
correo = str()
def nuevo():
    verifica=input("¿Es usuario nuevo? y/n: ")
    if verifica=='y':
        verifica=True
    else: verifica=False
    return registro(verifica)

def registro(verifica):
    if verifica==True:
        print("Bienvenido, para empezar con el diagnóstico necesitamos que nos proporcione unos datos básicos")
        nombre = input("Nombre: ")
        edad = input("Edad: ")
        peso=input("Peso (Kg): ")
        altura=input("Altura (cm): ")
        correo=input("Correo electrónico: ")
        registrar(nombre,edad,peso,altura,correo)
    else:
        correo=input("Digite su correo electrónico: ")
        existente(correo)
    return correo

def existente(correo):
    cursor = base.cursor()
    comando = "SELECT * FROM usuario WHERE correo_usuario= %s"
    cursor.execute(comando, (correo,))
    res = cursor.fetchall()
    if res!=[]:
        print("Bienvenido usuario, sus datos registrados son:\n")
        for x in res:
            print(x)
            global id_usr
            id_usr = x[0]
        print(id_usr)
    else:
        print("No se encontró ningún registro")

def registrar(nombre,edad,peso,altura,correo):
    cursor=base.cursor()
    comando = "INSERT INTO usuario (nombre_usuario, edad_usuario, correo_usuario, peso_usuario, altura_usuario) VALUES (%s, %s, %s, %s, %s)"
    cursor.execute(comando, (nombre,edad,correo,peso,altura))
    base.commit()
    global id_usr
    id_usr =int(cursor.getlastrowid())
