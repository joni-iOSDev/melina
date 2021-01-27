# MELINA - iOS - MVP + Flow Coordinator

### Descripción
*Melina* es una app iOS que ofrece asesoramiento de imagen a traves de un portfolio de productos  basado en el catalogo de productos de MercadoLibre

### Requerimientos para correr la app.
Se requiere instalar un pod para la capa de networking.

#### MVP
El patron de diseño seleccionado para implementar fue MVP (Model - View - Presenter), que adicionalmente se incluye otro Patron de diseño reconocido como Coordinator o FlowCoordinator.
Con ambos patrones se separan aun mas las responsabilidades haciendo que cada capa conviva con una logica lo mas limpio posible. 

#### Flow-Coordinator
Con este patron se deja la responsabilidad de navigacion entre views al presenter, el VC pasa solo a recibir eventos del usuario ya que no conoce otrra cosa. 

#### View Code
Se elmina Storyboard y se opta por realizar todas las visatas con view code, optimizamos el proyecto a una compilación mas rapida y disminuimos los riegos a posibles conflictos en un PR o MR. 

#### Layer Netwroking
Esta capa usa el framework Alamofire, para su implementacion se opta por una structura manager y routers. Podemos tener multiples routers y consumir distintos EndPoint Fuentes. 

