main:-
    enfermedades(Enfermedades),
	Enfermedades.

enfermedades(gastritis):-gastritis,!.
enfermedades('En mi base de conocimientos no figura ninguna enfermedad para la serie de sintomas descritos.').


gastritis :-
    tiene_gastritits,
    pregunta('�Presenta aerofagia (Molestia estomacal por ingesti�n de aire)?'),
    pregunta('�Tiene falta de apetito?'),
    pregunta('�Tiene nauseas?').

tiene_gastritits:- pregunta('�Tiene sensaci�n de ardor en el est�mago?').


preguntar(Problema,X):-
       ((X==si)->assert(si(Problema)); assert(no(Problema)),fail).


pregunta(S):-
    write(S),
    write('(si/no) '),
    read(Answer),
    ((Answer==si)->true; (fail;preguntar(S,Answer))).



