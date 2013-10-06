require 'rack/request'
require 'rack/response'
require 'haml'
require 'thin'
require 'rack'

module RockPaperScissors
	class RPS

		def initialize(app = nil)
			@app = app
			@content_type = :html
			@defeat = {'rock' => 'scissors', 'paper' => 'rock', 'scissors' => 'paper'}
			@throws = @defeat.keys
			@choose = @throws.map{|x| 
				%Q{ <li><a=href"/?choice=#{x}">#{x}</a></li> }
			}.join("\n")
			@choose = "<p>\n<ul>\n#{@choose}\n<ul>"
		end

		def call env
			req = Rack::Request.new(env)
			
			computer_throw = @throws.sample
			player_throw = req.GET["choice"]
			anwser = 
				if !@throws.include?(player_throw)
					"Choose one"
				elsif player_throw == computer_throw
					"TIE"
				elsif computer_throw == @defeat[player_throw]
					"PLAYER 1 WIN!"
				else
					"OUCH! PLAYER 2 WIN"
				end

			engine = Haml::Engine.new File.open("views/index.html.haml").read
			res = Rack::Response.new
			res.write engine.render({},
				:anwser => anwser,
				:choose => @choose,
				:throws => @throws,
				:computer_throw => computer_throw,
				:player_throw => player_throw)

			res.finish
		end #call
	end #Clase
end #Modulo
