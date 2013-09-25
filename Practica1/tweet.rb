require 'twitter'
require './configure'

screen_name = String.new ARGV[0] || 'made_503' #Nombre del usuario
usuario = Twitter.user(screen_name)

#Datos de dicho usuario
puts "Nombre usuario 	: #{usuario.screen_name}"
puts "Nombre  	: #{usuario.name}"
puts "Followers	: #{usuario.followers_count}"
puts "Localizacion 	: #{usuario.location}"
puts "URL 		: #{usuario.url}" if usuario.url
puts "Verificando 	: #{usuario.verified}\n\n"

tweet = Twitter.user_timeline(screen_name).first #El tweet más reciente

if tweet
	puts "Tweet : #{tweet.text}"
	puts "Fecha : #{tweet.created_at}"
	puts "ID    : #{tweet.id}"
end