main:-
    enfermedades(Enfermedades),
	Enfermedades.

enfermedades(calculos_renales):-calculos,!.
enfermedades(insuficiencia_renal):-insuficiencia,!.
enfermedades(escoliosis):-escoliosis,!.
enfermedades('En mi base de conocimientos no figura ninguna enfermedad para la serie de sintomas descritos.').


calculos:-
    tiene_calculos,
    pregunta('¿Tiene dolor en la zona de los riñones?'),
    pregunta('¿Hay presencia de sangre o cambio de color en la orina?'),
    pregunta('¿Tiene dolor al orinar?').

insuficiencia:-
	tiene_insuficiencia,
	pregunta('¿Presenta náuseas?'),
	pregunta('¿Presenta debilidad?'),
	pregunta('¿Presenta falta de aire y/o fatiga?').

escoliosis:-
    tiene_escoliosis,
    pregunta('Tiene curvatura de la columna mas hacia un lado?'),
    pregunta('Tiene debilidad o sensacion de cansancio en la columna despues de pararse o sentarse por mucho tiempo?'),
    pregunta('Hombros o cadera que parecen disparejos(un hombre puede estar mas alto que otro)?').
tiene_calculos:- pregunta('¿Tiene incapacidad de orinar o solo poder orinar una pequeña cantidad?').
tiene_insuficiencia:- pregunta('¿Presenta retención de líquidos (Hinchazon en los tobillos o pies)?').
tiene_escoliosis:-pregunta('Tiene dolor de espalda o lumbago que baja hacia las piernas?').


preguntar(Problema,X):-
       ((X==si)->assert(si(Problema)); assert(no(Problema)),fail).


pregunta(S):-
    write(S),
    write('(si/no) '),
    read(Answer),
    ((Answer==si)->true; (fail;preguntar(S,Answer))).



