main:-
    enfermedades(Enfermedades),
	Enfermedades.

enfermedades(colesterol):- colesterol,!.
enfermedades(diabetes):- diabetes,!.
enfermedades(ebola):-ebola,!.
enfermedades(gastritis):-gastritis,!.
enfermedades(neumonia):-neumonia,!.
enfermedades(parkinson):-parkinson,!.
enfermedades('No estoy entrenado para darte ese diagnostico.').

colesterol :-
	tiene_colesterol,
	pregunta('¿Tiene hinchazon en alguna extremidad?'),
	pregunta('¿Tiene perdida del equilibrio?'),
	pregunta('¿Tiene dolor de cabeza?'),
	pregunta('¿Tiene amarillos los ojos?'),
	pregunta('¿Tiene adormecimiento en alguna extremidad?'),
	pregunta('¿Tiene agitacion,en especial al caminar o al realizar actividades leve?'),
	pregunta('¿Tiene dolor en el pecho?').

diabetes :-
	tiene_diabetes,
	pregunta('¿Padece de orina frecuente?'),
	pregunta('¿Tiene sed constante?'),
	pregunta('¿Tiene hambre excesiva?'),
	pregunta('¿Tiene perdida de peso inexplicable?'),
	pregunta('¿Se siente fatigado?'),
	pregunta('¿Tiene irritabilidad?').

ebola :-
	tiene_ebola,
	pregunta('¿Presenta dolores musculares?'),
	pregunta('¿Tiene vomito y diarrea?'),
	pregunta('¿Presenta erupciones cutaneas?'),
	pregunta('¿Siente debilidad intensa?'),
	pregunta('¿Tiene dolor de garganta?').

gastritis :-
	tiene_gastritits,
	pregunta('¿Tiene acidez estomacal?'),
	pregunta('¿Presenta aerofagia?'),
	pregunta('¿Tiene ausencia de hambre que en ocasiones puede producir perdida de peso?'),
	pregunta('¿Presenta heces de color negro o con sangrado?'),
	pregunta('¿Tiene nauseas?').

neumonia :-
	tiene_neumonia,
	pregunta('¿Tiene dolores articulares?'),
	pregunta('¿Ha tenido tos constate los ultimos dos dias?'),
	pregunta('¿Presenta dificultad para respirar?').

parkinson :-
	tiene_parkinson,
	pregunta('¿Tiene dolores articulares?'),
	pregunta('¿Ha notado algún cambio perdida de movimiento espontaneo y automatico en alguna extremidad?'),
	pregunta('¿Ha presentado rigidez severa en alguna region muscular?'),
	pregunta('¿Sufre de depresión o ha utilizado farmacos para tratar una enfermedad semejante?'),
	pregunta('¿Presenta algun trastorno en el sueño?').


%desconocido :- se_desconoce_enfermedad.

tiene_colesterol:-	pregunta('¿Tiene vision borrosa?').
tiene_diabetes:-	pregunta('¿Tiene vision borrosa?').
tiene_ebola:-		pregunta('¿Tiene fiebre?').
tiene_gastritits:-	pregunta('¿Tiene dolor abdominal?').
tiene_neumonia:-	pregunta('¿Tiene fiebre?').
tiene_parkinson:-	pregunta('¿Presenta temblor en alguna de las extremidades superiores del cuerpo?').

preguntar(Problema,X):-
       ((X==si)->assert(si(Problema)); assert(no(Problema)),fail).


pregunta(S):-
    write(S),
    write('(si/no) '),
    read(Answer),
    ((Answer==si)->true; (fail;preguntar(S,Answer))).



