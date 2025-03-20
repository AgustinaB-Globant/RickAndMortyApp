# RickAndMortyApp

El objetivo es desarrollar una aplicación iOS que consuma la API pública de Rick and
Morty y muestre un listado de personajes. Utilizarás Swift y SwiftUI, y harás uso de
patrones y prácticas recomendadas de desarrollo de aplicaciones iOS modernas.

## Decisiones Técnicas

### 1. Consumo de Servicios Web

Para obtener datos externos, se implementó una capa de red que interactúa con una API RESTful. Se utilizó `URLSession` para realizar solicitudes HTTP y manejar las respuestas. Los datos en formato JSON se decodificaron utilizando el protocolo `Decodable`, facilitando la conversión a modelos de datos nativos de Swift.

### 2. Arquitectura MVVM

Se adoptó el patrón de diseño Model-View-ViewModel (MVVM) para separar la lógica de negocio de la interfaz de usuario. Los `ViewModel` gestionan los datos y la lógica, mientras que las vistas presentan estos datos. Se emplearon propiedades con el atributo `@StateObject` para mantener el estado de la vista y asegurar que las actualizaciones en el modelo se reflejen automáticamente en la interfaz de usuario.

### 3. Filtrado de Datos

Se implementó una funcionalidad de búsqueda que permite al usuario filtrar la lista de personajes por nombre. Al ingresar texto en el campo de búsqueda, se actualiza el estado de la vista, lo que desencadena un filtrado en tiempo real de la lista mostrada.

### 4. Paginación y Carga Incremental

Para optimizar la carga de datos y mejorar la experiencia del usuario, se implementó una paginación que carga más datos a medida que el usuario se desplaza por la lista. Se añadió un botón "Cargar más" que solicita y carga la siguiente página de datos desde la API al ser presionado.

### 5. Manejo de Errores y Estados de Carga

Se incorporaron indicadores de carga, como `ProgressView`, para informar al usuario cuando los datos están siendo cargados. Además, se manejaron errores de red y de decodificación para proporcionar retroalimentación adecuada al usuario en caso de problemas durante la carga de datos.

### 6. Navegación y Detalles de Personajes

Se utilizó `NavigationLink` para permitir la navegación hacia una vista de detalles de cada personaje. Al seleccionar un personaje de la lista, el usuario es llevado a una nueva vista que muestra información detallada del personaje seleccionado.

## Instalación

Sigue estos pasos para instalar y ejecutar el proyecto en tu entorno local:

1. **Clona el repositorio**: Utiliza el siguiente comando para clonar el repositorio en tu máquina local:

   ```bash
   git clone https://github.com/AgustinaB-Globant/RickAndMortyApp.git

## Uso

Una vez que la aplicación esté instalada y ejecutándose, puedes utilizarla de la siguiente manera:

- **Explorar la lista de personajes**: En la pantalla principal, se muestra una lista de personajes obtenidos de la API. Puedes desplazarte por la lista para ver más personajes.

- **Buscar personajes**: Utiliza el campo de búsqueda en la parte superior para filtrar personajes por nombre. A medida que escribes, la lista se actualizará para mostrar solo los personajes que coincidan con el término de búsqueda.

- **Ver detalles de un personaje**: Toca cualquier personaje en la lista para navegar a una pantalla con información detallada sobre ese personaje, incluyendo su imagen, descripción y otros datos relevantes.

- **Cargar más personajes**: Si hay más personajes disponibles, puedes presionar el botón "Cargar más" al final de la lista para cargar y ver más personajes.
