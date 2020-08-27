main:-
    enfermedades(Enfermedades),
	Enfermedades.

enfermedades(gastritis):-gastritis,!.
enfermedades(apendicitis):-apendicitis,!.
enfermedades(estre�imiento):-estre�imiento,!.
enfermedades('En mi base de conocimientos no figura ninguna enfermedad para la serie de sintomas descritos.').


gastritis :-
    tiene_gastritits,
    pregunta('�Presenta aerofagia (Molestia estomacal por ingesti�n de aire)?'),
    pregunta('�Tiene falta de apetito?'),
    pregunta('�Tiene nauseas?').

apendicitis:-
    tiene_apendicitis,
    pregunta('Tiene dolor repentino alrededor del ombligo y, a menudo, se desplaza hacia la parte inferior derecha del abdomen?'),
    pregunta('Tiene dolor que empeora cuando toses, caminas o realizas otros movimientos bruscos?'),
    pregunta('Tiene nauseas o vomitos?').

estre�imiento:-
    tiene_estre�imiento,
    pregunta('Tiene heces grumosas o duras?'),
    pregunta('Tiene que hacer un gran esfuerzo para tener evacuaciones intestinales?'),
    pregunta('Siente como si hubiera una obstruccion en el recto que impite las evacuaciones intestinales?').

tiene_gastritits:- pregunta('�Tiene sensaci�n de ardor en el est�mago?').
tiene_apendicitis:-pregunta('Tiene dolor repentino que comienza en el lado derecho de la parte inferior del abdomen?').
tiene_estre�imiento:-pregunta('Tiene menos de tres evacuaciones por semana?').
preguntar(Problema,X):-
       ((X==si)->assert(si(Problema)); assert(no(Problema)),fail).


pregunta(S):-
    write(S),
    write('(si/no) '),
    read(Answer),
    ((Answer==si)->true; (fail;preguntar(S,Answer))).



