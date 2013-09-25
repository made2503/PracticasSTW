Aplicación Twitter Popularidad
================================

**Paso 1.** Instalar la gema twitter

**Paso 2.** Crear la aplicación en https://dev.twitter.com/apps/new con tu nombre de usuario y contraseña.

**Paso 2.1** Rellenar los apartados para crear la aplicación

**Paso 2.2** Cuando creamos la aplicación Twitter devuelve:

1. Una clave de consumidor

2. Un secreto de consumidor

**Paso 2.3** Generaremos entonces el token y tendremos:

1. Un Oauth Token
2. Un secreto Oauth Token

**Paso 3.** Crearemos con la información que tenemos el archivo configure.rb

**Paso 4.** Creamos el archivo tweet.rb donde tendremos toda la información del usuario que le pidamos.

**Paso 5.** Crearemos el archivo popular.rb donde pasaremos como argumento un nombre de usuario y un numero de amigos de ese usuario y nos devolverá en orden de popularidad los amigos de dicho usuario.


## IMPORTANTE ##

1. Para poder ejecutar está aplicación, tendrás que ir a configure.rb y poner tus propiar claves y tokens.


2. Para ejecutar el archivo popular.rb, tendrás que utilizar tu usuario de Twitter ya que no podrías consultar desde la cuenta de otro sus followers, a menos que no esta protegida.


### EJECUCIÓN ###

Tweet.rb

	ruby tweet.rb
	ruby tweet.rb NombreUsuario

Popular.rb

	ruby popular.rb
	ruby popular.rb NombreUsuario
	ruby popular.rb NombreUsuario NºSeguidores
