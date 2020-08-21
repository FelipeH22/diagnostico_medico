from pyswip import *
prolog = Prolog()
opciones = {
	1: "Dolor en la cabeza",
	2: "Dolor en la garganta",
	3: "Dolor en el pecho",
	4: "Dolor en la zona del abdominal",
	5: "Dolor en la espalda baja",
	6: "Dolor en las extremidades"
}
archivos = {
	"Dolor en la cabeza":"cabeza.pl",
	"Dolor en la garganta":"garganta.pl",
	"Dolor en el pecho":"pecho.pl",
	"Dolor en la zona del estómago":"estomago.pl",
	"Dolor en la espalda baja":"espalda.pl",
	"Dolor en las extremidades":"extremidades.pl"
}
print(opciones,"\n")
prolog.consult(archivos[opciones[int(input("Digite el número, según la opción donde siente las molestias \n"))]])

print('Bienvenidos')
print('Segun la respuestas dadas tendra su resultado:')
for result in prolog.query("enfermedades(Enfermedad)"):
	resultado = result['Enfermedad']
if resultado!="En mi base de conocimientos no figura ninguna enfermedad para la serie de sintomas descritos.":
	if '_' in resultado:
		resultado=resultado.replace('_',' ')
	print('De acuerdo con sus respuestas, usted puede padecer de: '+resultado)
else:
	print(resultado)
print('Tenga presente que este diagnóstico no equivale a un diagnóstico profesional. Por tanto, se recomienda acudir al médico en caso de presentar complicaciones')
