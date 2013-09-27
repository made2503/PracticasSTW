require 'twitter'
require './configure'
require 'rack'
require 'thin'
require 'erb'
require 'bootstrap'

class Formulario
	def call env
		req = Rack::Request.new(env)
		res = Rack::Response.new 
		
		binding.pry if ARGV[0]
		
		res['Content-Type'] = 'text/html'
		nombre = (req["name1"] && req["name1"] != '') ? req["name1"] :''
		tweet = Twitter.user_timeline(nombre).first.text 
		numero = req["number"] if req["number"]

		tweet = Twitter.user_timeline(nombre,{:count => numero.to_i})
		aux = tweet.length.to_i - 1
		i = 0


		res.write <<-"EOS"
			<!DOCTYPE HTML>
			<html>
				<head>
					<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
					<title>
						Fomulario Tweets
					</title>
				</head>
				<body>
					<h3>
						<form action="/" method="post">
							Nombre usuario en Twitter: <input type="text" name="name1" value="" size="20" maxlength="20" autofocus></br>

							Numero de Tweets: <input type="text" name="number" value="" size="10" maxlength="10"></br>
							<input type="submit" value="Enviar">
						</form>
					</h3>
					<h4> Tweets </h4>
						for i in(0..aux)
							</br> #{tweet.map {|i| i.text}} </br>
						end
				</body>
			</html>
			EOS
			res.finish
	end
end

if $0 == __FILE__
	require 'rack'
  	require 'rack/showexceptions'
	Rack::Server.start(
  		:app => Formulario.new,
  		:Port => 8080,
  		:server => 'thin'
	)
end
