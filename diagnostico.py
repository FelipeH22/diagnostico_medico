from pyswip import *
prolog = Prolog()
prolog.consult('diagnostico.pl')
print('Bienvenidos')
print('Segun la respuestas dadas tendra su resultado:')
for result in prolog.query("enfermedades(Enfermedad)"):
	resultado = result['Enfermedad']
if resultado!="En mi base de conocimientos no figura ninguna enfermedad para la serie de sintomas descritos.":
	print('De acuerdo con sus respuestas,usted puede padecer de: '+resultado)
else:
	print(resultado)
print('Tenga presente que este diagnóstico no equivale a un diagnóstico profesional. Por tanto, se recomienda acudir al médico en caso de presentar complicaciones')
