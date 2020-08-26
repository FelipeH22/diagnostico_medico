    let titulo = document.getElementById(`titulo`);
    let elementoLista = document.getElementById(`elementoLista`);
    let lista = document.getElementById('lista');


    const generarInfo = (element) =>{
        //elementoLista.innerHTML = ''
        titulo.innerHTML = zonas_cuerpo[element].seccion;
        console.log(zonas_cuerpo[element].seccion);
        var list_elementos = zonas_cuerpo[element].sintomas.map( el => {
                //console.log(el)
                //document.querySelector('.elementoLista').append(`${el}`);
                //elementoLista.appendChild(el)
                //lista.appendChild(el)
                return `<li class="list-group-item">
                            <input type="checkbox" class="form-check-input" id="${el}">
                            <label class="form-check-label" for="${el}">
                                ${el}
                            </label>
                        </li>`
            }
        )
        elementoLista.innerHTML = list_elementos
    }

    const generarInfo2 = (el) =>{
        zonas_cuerpo[el].sintomas.forEach((data,index)=>{
            let linew= document.createElement("li");
            let contenido = document.createTextNode(el);
            lista.appendChild(linew);
            linew.appendChild(contenido);
        })
    }

    let zonas_cuerpo = [
        {
            seccion:'Orejas',
            sintomas:[
                'Síntoma 1',
                'Síntoma 1',
                'Síntoma 1',
                ]
        },
        {
            seccion:'Mejillas',
            sintomas:[
                'Síntoma 2',
                'Síntoma 2',
                'Síntoma 2',
                ]
        },
        {
            seccion:'Frente',
            sintomas:[
                'Síntoma 1',
                'Síntoma 2',
                'Síntoma 3',
                ]
        },
        {
            seccion:'Mentón',
            sintomas:[
                'Síntoma 1',
                'Síntoma 2',
                'Síntoma 3',
            ]
        },
        {
            seccion:'Brazos',
            sintomas:[
                'Síntoma 1',
                'Síntoma 2',
                'Síntoma 3',
            ]
        },
        {
            seccion:'Pecho',
            sintomas:[
                'Síntoma 1',
                'Síntoma 2',
                'Síntoma 3',
            ]
        },
        {
            seccion:'Abdomen',
            sintomas:[
                'Síntoma 1',
                'Síntoma 2',
                'Síntoma 3',
            ]
        },
        {
            seccion:'Piernas',
            sintomas:[
                'Síntoma 1',
                'Síntoma 2',
                'Síntoma 3',
            ]
        },
        {
            seccion:'Abdomen bajo',
            sintomas:[
                'Síntoma 1',
                'Síntoma 2',
                'Síntoma 3',
            ]
        },
        {
            seccion:'Cuello',
            sintomas:[
                'Síntoma 1',
                'Síntoma 2',
                'Síntoma 3',
            ]
        },
    ]