main:-
    enfermedades(Enfermedades),
	Enfermedades.

enfermedades(calculos_renales):-calculos,!.
enfermedades('En mi base de conocimientos no figura ninguna enfermedad para la serie de sintomas descritos.').


calculos:-
    tiene_calculos,
    pregunta('¿Tiene dolor en la zona de los riñones?'),
    pregunta('¿Hay presencia de sangre o cambio de color en la orina?'),
    pregunta('¿Tiene dolor al orinar?').

tiene_calculos:- pregunta('¿Tiene incapacidad de orinar o solo poder orinar una pequeña cantidad?').


preguntar(Problema,X):-
       ((X==si)->assert(si(Problema)); assert(no(Problema)),fail).


pregunta(S):-
    write(S),
    write('(si/no) '),
    read(Answer),
    ((Answer==si)->true; (fail;preguntar(S,Answer))).



