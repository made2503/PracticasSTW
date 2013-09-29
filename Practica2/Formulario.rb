require 'twitter'
require './configure'
require 'rack'
require 'thin'
require 'erb'
require 'bootstrap'

class Formulario

	#Constructor
	def initialize 
		@t_tweet = []
		@nombre = ''
		@numero = 0
	end

	#Template del ERB
	def erb(template)
		template_file = File.open("Formulario.html.erb", 'r')
		ERB.new(File.read(template_file)).result(binding)
	end

	#Método call
	def call env
		req = Rack::Request.new(env)
		@t_tweet = []
		binding.pry if ARGV[0]
		@nombre = (req["name1"] && req["name1"] != '' && Twitter.user?(req["name1"]) == true) ? req["name1"] : ''
 		@numero = (req["number"] && req["number"].to_i > 1) ? req["number"].to_i : 1
		puts "#{@nombre}"

		if @nombre == req["name1"]
			puts "#{@t_tweet}"
			tweet = Twitter.user_timeline(@nombre, {:count => @numero.to_i})
			@t_tweet = (@t_tweet && @t_tweet != '') ? tweet.map{|i| i.text} : ''
		end

		Rack::Response.new(erb('Formulario.html.erb'))
	end
end

if $0 == __FILE__
	require 'rack'
	Rack::Server.start(
  		:app => Formulario.new,
  		:Port => 9999,
  		:server => 'thin'
	)
end
