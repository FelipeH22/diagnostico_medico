# Diagnóstico Médico
### Prolog y Django/Python
##### Modelos de programación II - G.020-82
_Programa desarrollado en python, prolog y ambiente web con el fin de realizar un diagnóstico médico aproximado según una serie de sintomas ingresados por el usuario_

#### Diagrama:


#### Descripción
_Programa desarrollado en python, prolog y ambiente web con el fin de realizar un diagnóstico médico aproximado según una serie de sintomas ingresados por el usuario_, el sistema provee una opción de consultar desde consola y otra con ina interfaz web desarrollado en Django consultando una base de datos con la información de los sintomas, tratamiento entre otros.


#### Ejecutar proyecto
Creando un entorno virtual dentro del proyecto.
```
~$ pip install virtualenv
~$ virtualenv env
```
Windows
```
~$ source env/Script/active
~$ cd web
```
Linux
```
~$ source web/bin/active
~$ cd web
```
Instalar librerías
```
~$ pip install -r requirements.txt
```
Ejecutar proyecto
```
~$ python manage.py runserver
```

#### Ejecutar por consola
```
~$ cd web/web
~$ python

```

#### Estructura del proyecto
+ diagnostico_django/
    + diagnostico_django/
    + core/
    + registro/
    + diagnostico/
    + manage.py
    + diagnostico_medico.sql
+ README.md
+ requirements.txt


#### SECRET_KEY
En caso de tener problemas con el SECRET_KEY, para ejecutar el proyecto en Django
ejecutar el siguiente archivo dentro del web/
```
~$

```
copiar el código en el archivo settings.py en del proyecto principal de Django.


#### Equipo de trabajo

Integrante  | Código
------------- | -------------
Juan Esteban Olaya García | 20171020135
Juan Felipe Herrera Poveda | 20181020077
Cristhian Mauricio Yara Pardo | 20181020081