from pyswip import *
prolog = Prolog()
prolog.consult('diagnostico.pl')
print('Bienvenidos')
print('Segun la respuestas dadas tendra su resultado:')
for result in prolog.query("enfermedades(Enfermedad)"):
	resultado = result['Enfermedad']
print('De acuerdo con sus respuestas,usted padece de: '+resultado)
