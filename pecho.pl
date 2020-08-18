main:-
    enfermedades(Enfermedades),
	Enfermedades.

enfermedades(neumonia):-neumonia,!.
enfermedades(bronquitis):-bronquitis,!.
enfermedades(asma):-asma,!.
enfermedades('En mi base de conocimientos no figura ninguna enfermedad para la serie de sintomas descritos.').

bronquitis:-
    tiene_bronquitis,
    pregunta('¿Tiene tos?'),
    pregunta('¿Tiene producción de mucosidad (esputo)?'),
    pregunta('¿Tiene fatiga?').

neumonia:-
    tiene_neumonia,
    pregunta('¿Presenta esputo de color amarillo o con sangre?'),
    pregunta('¿Tiene fiebre?'),
    pregunta('¿Tiene escalofrios con temblores?').

asma:-
    tiene_asma,
    pregunta('¿Siente presión en el pecho (pulmones)?'),
    pregunta('¿Al respirar se escucha una especie de silbido en los pulmones?'),
    pregunta('¿Tiene problemas al dormir o al realizar actividades por falta de aire?').



tiene_bronquitis:- pregunta('¿Siente molestia en la zona de los pulmones?').
tiene_neumonia:- pregunta('¿Tiene dolor en los pulmones y malestar general?').
tiene_asma:- pregunta('¿Presenta falta de aire?').


preguntar(Problema,X):-
       ((X==si)->assert(si(Problema)); assert(no(Problema)),fail).


pregunta(S):-
    write(S),
    write('(si/no) '),
    read(Answer),
    ((Answer==si)->true; (fail;preguntar(S,Answer))).



