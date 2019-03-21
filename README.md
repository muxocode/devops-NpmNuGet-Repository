# NpmServer y NuGetServer

## URLs y repositorios
### Eviroment
Se puedes configurar los puertos y volúmenes según el archivo .env
### Urls
- *NuGet* está configurado para levantarse en el puerto 5001. Por lo que la URL sería <IPMáquina>:5001, es decir localhost:5001
- *Verdaccio* está configurado para levantarse ne el puerto 5002. Por lo que la URL sería <IPMáquina>:5002, es decir localhost:5002
### Volúmenes
Para la persistencia de datos, se ha enlazado con volúmenes NFS(Windows), que se han situado en *C:/docker_volumes*, de no existir las carpetas, el proceso de arranque las crea.
## Para amantes de Windows :-)
### Arrancar
Para arrancar basta con ejecutar el script *Up.bat* de la carpeta raíz.
### Parar
Para parar el componente basta con ejecutar el scripr *down.bat* de la carpeta raíz