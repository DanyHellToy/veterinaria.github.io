# Dist OFFLINE

El contenido de este directorio adjunta 3 archivos.
- Index.html
- Estilos.css
- Validación.js 

El objetivo de estos es observar como es posible que se agreguen datos a una base de datos remota sin tener que acceder al html por medio de un servidor.
¿Cómo se logra esto?
Esto se logra a través del atributo action de la etiqueta form. En este ejemplo se hace uso de una API publica en https://membership.404backup.com/api/cliente

> <form action="https://membership.404backup.com/api/cliente" method="post" enctype="multipart/form-data" onsubmit="return validar()">
