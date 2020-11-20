###### Programación Multimedia y Dispositivos Móviles. 2º DAM

# Examen 1ª evaluación

### Nombre y apellidos: \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

![Alt text](/assets/images/fuentes.png?raw=true "Capturas de pantalla")

git clone https://github.com/aetxabao/pmdm20f3 fuentes

Partiendo del código fuente del repositorio facilitado se tiene que implementar el código necesario para la aplicación cuyas pantallas se muestran. En la primera pantalla aparecerán dos opciones para saber si el Camino de Santiago que se está consultando es el Francés o el Aragonés. En la siguiente pantalla se mostrará una lista de todas las etapas de ese camino y en la siguiente otra lista con los municipios de cada fuente de esa etapa (en un municipio puede haber varias fuentes y en ese caso aparecería el nombre del municipio repetido). Finalmente, tras seleccionar la fuente deseada se visualizará en un mapa su ubicación.

1. screens/caminos_screen.dart

Crear una pantalla con un Scaffold

    - (0.5) que tenga los elementos centrados como se muestra en la imagen.

    - (0.5) que al pulsar cualquiera de los RaisedButton se acceda a la pantalla: EtapasScreen

    - (0.5) que guarde en el almacenamiento de la aplicación (Storage) la selección ("Francés"/"Aragonés")
    	junto a la clave “camino”.

2. screens/etapas_screen.dart

Crear una pantalla con un Scaffold que tenga un ListView con las etapas del camino seleccionado.

    - (0.5) El nombre del camino que se va a utilizar tiene que ser leído del almacenamiento de la aplicación.

    - (1.5) Las etapas correspondientes se obtendrán utilizando el método del proveedor que hay que implementar:

    	cargarEtapas(camino)

    - (0.5) Mientras se carguen las etapas se mostrará un: CircularProgressIndicator

    - (1) Al pulsar uno de los ListTile del ListView se ha de acceder a la pantalla: FuentesScreen

    - (0.5) guardando en el almacenamiento local la etapa seleccionada asociada a la clave “etapa”.

3. screens/fuentes_screen.dart

Crear otra pantalla con un Scaffold que tenga un ListView con los nombres de los municipios de la etapa seleccionada.

    - (0.5) El nombre de la etapa que se va a utilizar tiene que ser leído del almacenamiento de la aplicación.

    - (0.5) Mientras se carguen las fuentes se mostrará un: CircularProgressIndicator

    - (1.5) Las etapas correspondientes se obtendrán utilizando el método del proveedor que hay que implementar:

    	cargarFuentesFiltradas(etapa)

    - (0.5) Al pulsar uno de los ListTile del ListView se accederá a la pantalla que se llamará: MapaScreen
    pasando como argumentos la fuente seleccionada.

4. screens/mapa_screen.dart

Crear el código del fichero del mapa para que:

    - (0.5) Se recoja la fuente seleccionada pasada desde la anterior pantalla.

    - (0.5) Se haga la transformación de las coordenadas UTM de la fuente a la variable latlon.

    - (0.5) Se represente la posición de la fuente con el icono Icons.location_on

Puntuación: entre paréntesis aparece el valor con que se puntúa cada apartado
