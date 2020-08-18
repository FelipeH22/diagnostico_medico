main:-
    enfermedades(Enfermedades),
	Enfermedades.

enfermedades(migra�a):-migra�a,!.
enfermedades(cefalea_comun):-cefalea,!.
enfermedades('En mi base de conocimientos no figura ninguna enfermedad para la serie de sintomas descritos.').

migra�a:-
    tiene_migra�a,
    pregunta('�Dolor que palpita o late?'),
    pregunta('�Tiene sensibilidad a la luz, sonido o al olor de ciertos productos?'),
    pregunta('�Tiene nauseas?').

cefalea:-
    tiene_cefalea.

tiene_migra�a:- pregunta('�Tiene dolor de cabeza intenso?').
tiene_cefalea:- pregunta('�Tiene dolor de cabeza generalizado?').

preguntar(Problema,X):-
       ((X==si)->assert(si(Problema)); assert(no(Problema)),fail).


pregunta(S):-
    write(S),
    write('(si/no) '),
    read(Answer),
    ((Answer==si)->true; (fail;preguntar(S,Answer))).