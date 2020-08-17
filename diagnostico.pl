main:-
    enfermedades(Enfermedades),
	Enfermedades.

enfermedades(migra�a):-migra�a,!.
enfermedades(cefalea_comun):-cefalea,!.
enfermedades(amigdalitis):-amigdalitis,!.
enfermedades(laringitis):-laringitis,!.
enfermedades(faringitis):-faringitis,!.
enfermedades(gastritis):-gastritis,!.
enfermedades('En mi base de conocimientos no figura ninguna enfermedad para la serie de sintomas descritos.').

migra�a:-
    tiene_migra�a,
    pregunta('�Dolor que palpita o late?'),
    pregunta('�Tiene sensibilidad a la luz, sonido o al olor de ciertos productos?'),
    pregunta('�Tiene nauseas?').

cefalea:-
    tiene_cefalea.

amigdalitis:-
    tiene_amigdalitis,
    pregunta('�Tiene dificultad o dolor al tragar?'),
    pregunta('�Tiene las amigdalas rojas o inflamadas?'),
    pregunta('�Tiene parches amarillos o blancos en la boca o am�gdalas?').

laringitis:-
    tiene_laringitis,
    pregunta('�Tiene perdida de la voz?'),
    pregunta('�Carraspeo frecuente?').

faringitis:-
    tiene_faringitis.

gastritis :-
    tiene_gastritits,
    pregunta('�Tiene acidez estomacal?'),
    pregunta('�Presenta aerofagia?'),
    pregunta('�Tiene ausencia de hambre que en ocasiones puede producir perdida de peso?'),
    pregunta('�Presenta heces de color negro o con sangrado?'),
    pregunta('�Tiene nauseas?').




%desconocido :- se_desconoce_enfermedad.
tiene_migra�a:- pregunta('�Tiene dolor de cabeza intenso?').
tiene_cefalea:- pregunta('�Tiene dolor de cabeza generalizado?').
tiene_gastritits:- pregunta('�Tiene dolor abdominal?').
tiene_amigdalitis:- pregunta('�Tiene dolor en la garganta?').
tiene_laringitis:-  pregunta('�Tiene ronquera?').
tiene_faringitis:- pregunta('�Tiene dolor en la parte baja de la garganta (zona media de la gargante hacia al pecho)?').



preguntar(Problema,X):-
       ((X==si)->assert(si(Problema)); assert(no(Problema)),fail).


pregunta(S):-
    write(S),
    write('(si/no) '),
    read(Answer),
    ((Answer==si)->true; (fail;preguntar(S,Answer))).



