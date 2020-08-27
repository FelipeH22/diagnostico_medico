main:-
    enfermedades(Enfermedades),
	Enfermedades.

enfermedades(amigdalitis):-amigdalitis,!.
enfermedades(laringitis):-laringitis,!.
enfermedades(faringitis):-faringitis,!.
enfermedades('En mi base de conocimientos no figura ninguna enfermedad para la serie de sintomas descritos.').


amigdalitis:-
    tiene_amigdalitis,
    pregunta('¿Tiene dificultad o dolor al tragar?'),
    pregunta('¿Tiene las amigdalas rojas o inflamadas?'),
    pregunta('¿Tiene parches amarillos o blancos en la boca o amígdalas?').

laringitis:-
    tiene_laringitis,
    pregunta('¿Tiene perdida de la voz?'),
    pregunta('¿Carraspeo frecuente?'),
    pregunta('Tiene tos seca?').

faringitis:-
    tiene_faringitis,
    pregunta('Tiene enrojecimiento de la faringe?'),
    pregunta('Tiene dolor de garganta al tragar?'),
    pregunta('Tiene ganglios inflamados en el cuello?').

tiene_amigdalitis:- pregunta('¿Tiene dolor en la parte inicial de la garganta?').
tiene_laringitis:-  pregunta('¿Tiene ronquera?').
tiene_faringitis:- pregunta('¿Tiene dolor en la parte baja de la garganta (zona media de la gargante hacia al pecho)?').



preguntar(Problema,X):-
       ((X==si)->assert(si(Problema)); assert(no(Problema)),fail).


pregunta(S):-
    write(S),
    write('(si/no) '),
    read(Answer),
    ((Answer==si)->true; (fail;preguntar(S,Answer))).

