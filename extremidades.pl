main:-
    enfermedades(Enfermedades),
	Enfermedades.

enfermedades(artritis):-artritis,!.
enfermedades('En mi base de conocimientos no figura ninguna enfermedad para la serie de sintomas descritos.').


artritis:-
    tiene_artritis,
    pregunta('¿Tiene dolor en las articulaciones?'),
    pregunta('¿Presenta hinchazon?'),
    pregunta('¿Presenta enrojecimiento?').

tiene_artritis:- pregunta('¿Tiene reducción en la amplitud del movimiento por sensación de rigidez?').


preguntar(Problema,X):-
       ((X==si)->assert(si(Problema)); assert(no(Problema)),fail).


pregunta(S):-
    write(S),
    write('(si/no) '),
    read(Answer),
    ((Answer==si)->true; (fail;preguntar(S,Answer))).



