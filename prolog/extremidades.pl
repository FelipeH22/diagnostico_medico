main:-
    enfermedades(Enfermedades),
	Enfermedades.

enfermedades(artritis):-artritis,!.
enfermedades(linfedema):-linfedema,!.
enfermedades(endema):-endema,!.
enfermedades('En mi base de conocimientos no figura ninguna enfermedad para la serie de sintomas descritos.').


artritis:-
    tiene_artritis,
    pregunta('¿Tiene dolor en las articulaciones?'),
    pregunta('¿Presenta hinchazon?'),
    pregunta('¿Presenta enrojecimiento?').

linfedema:-
    tiene_linfedema,
    pregunta('Tiene sensacion de pesadez o rigidez?'),
    pregunta('Tiene amplitud de movimiento limitada'),
    pregunta('Tiene dolor o molestia').

endema:-
    tiene_endema,
    pregunta('Tiene la piel estirada o brillante?'),
    pregunta('Piel que retiene un hoyuelo(fovea) despues de presionarla durante varios segundos?'),
    pregunta('Aumento en el tamaño abdominal?').

tiene_artritis:- pregunta('¿Tiene reducción en la amplitud del movimiento por sensación de rigidez?').
tiene_linfedema:-pregunta('Tiene hinchazon de todo o parte del brazo o la pierna, incluso los dedos de los pies o las manos?').
tiene_endema:-pregunta('Tiene hinchazon o inflamacion del tejido que esta directamente debajo de la piel, especialmente, en las piernas o en los brazos?').

preguntar(Problema,X):-
       ((X==si)->assert(si(Problema)); assert(no(Problema)),fail).


pregunta(S):-
    write(S),
    write('(si/no) '),
    read(Answer),
    ((Answer==si)->true; (fail;preguntar(S,Answer))).



