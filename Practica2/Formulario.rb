require 'twitter'
require './configure'
require 'rack'

class Formulario
	def call env
		req = Rack::Request.new(env)
		res = Rack::Response.new 
		
		binding.pry if ARGV[0]
		res['Content-Type'] = 'text/html'
		name = (req["name1"] && req["name1"] != '') ? req["name1"] :'made_503'
		
		tweet = Twitter.user_timeline(name).first
		if tweet
			puts "#{tweet.text}"
		end

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
							Nombre usuario: <input type="text" name="fname1" autofocus></br>
							Numero de Tweets: <input type="text" name="number"></br>
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