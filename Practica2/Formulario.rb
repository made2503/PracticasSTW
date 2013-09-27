require 'twitter'
require './configure'
require 'rack'

class Formulario
	def call env
		req = Rack::Request.new(env)
		res = Rack::Response.new 
		
		binding.pry if ARGV[0]
		res['Content-Type'] = 'text/html'
		nombre = (req["name1"] && req["name1"] != '') ? req["name1"] :'made_503'
		
		tweet = Twitter.user_timeline(nombre).first.text 

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
							Nombre usuario en Twitter: <input type="text" name="name1" value="" autofocus></br>
							Ultimo tweet: #{tweet}
						
							Numero de Tweets: <input type="text" name="number" value=""></br>
							<input type="submit" value="Enviar">
						</form>
					</h3>
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
