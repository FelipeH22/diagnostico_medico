from pyswip import *
from conexion_db import consulta, get_id
from usuario import nuevo
from os import system
from guardar_diagnostico import g_diagnostico, g_usr_diag

correo=str()
correo = nuevo()

prolog = Prolog()
opciones = {
	1: "Dolor en la cabeza",
	2: "Dolor en la garganta",
	3: "Dolor en el pecho",
	4: "Dolor en la zona abdominal",
	5: "Dolor en la espalda baja",
	6: "Dolor en las extremidades"
}
archivos = {
	"Dolor en la cabeza":"prolog/cabeza.pl",
	"Dolor en la garganta":"prolog/garganta.pl",
	"Dolor en el pecho":"prolog/pecho.pl",
	"Dolor en la zona abdominal":"prolog/estomago.pl",
	"Dolor en la espalda baja":"prolog/espalda.pl",
	"Dolor en las extremidades":"prolog/extremidades.pl"
}

print("\n",opciones,"\n")
prolog.consult(archivos[opciones[int(input("Digite el número, según la opción donde siente las molestias \n"))]])
system("cls")
print('\nDiagnóstico:')
print('Segun la respuestas dadas tendra su resultado:')
for result in prolog.query("enfermedades(Enfermedad)"):
	resultado = result['Enfermedad']
system("cls")
if resultado!="En mi base de conocimientos no figura ninguna enfermedad para la serie de sintomas descritos.":
	if '_' in resultado:
		resultado=resultado.replace('_',' ')
	print('De acuerdo con sus respuestas, usted puede padecer de: '+resultado+"\n")
	consulta(resultado)
	g_diagnostico(get_id(resultado))
	g_usr_diag(0,correo)
else:
	print(resultado)
print('\nTenga presente que este diagnóstico no equivale a un diagnóstico profesional. Por tanto, se recomienda acudir al médico en caso de presentar complicaciones y sobre todo no automedicarse')
