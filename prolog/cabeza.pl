main:-
    enfermedades(Enfermedades),
	Enfermedades.

enfermedades(migrana):-migrana,!.
enfermedades(cefalea_comun):-cefalea,!.
enfermedades(hemicranea_continua):-hemicranea,!.
enfermedades('En mi base de conocimientos no figura ninguna enfermedad para la serie de sintomas descritos.').

migrana:-
    tiene_migrana,
    pregunta('ï¿½Dolor que palpita o late?'),
    pregunta('ï¿½Tiene sensibilidad a la luz, sonido o al olor de ciertos productos?'),
    pregunta('ï¿½Tiene nauseas?').

cefalea:-
    tiene_cefalea,
    pregunta('Tiene los parpados mas cerrados o caidos?'),
    pregunta('Tiene enrojecimiento en los ojos'),
    pregunta('Tiene lagrimeo').

hemicranea:-
    tiene_hemicranea,
    pregunta('Tiene dolores que pueden volverse intensos con la presencia de sintomas parecidos a la migraña?'),
    pregunta('Tiene ojos enrojecidos y llorosos del lado afectado?'),
    pregunta('Tiene congestion nasal o catarro?').


tiene_migrana:- pregunta('ï¿½Tiene dolor de cabeza intenso?').
tiene_cefalea:- pregunta('ï¿½Tiene dolor de cabeza generalizado?').
tiene_hemicranea:- pregunta('Tiene dolores que afectan un solo lado de la cabeza').

preguntar(Problema,X):-
       ((X==si)->assert(si(Problema)); assert(no(Problema)),fail).


pregunta(S):-
    write(S),
    write('(si/no) '),
    read(Answer),
    ((Answer==si)->true; (fail;preguntar(S,Answer))).
