require 'twitter'
require './configure'

nombre = String.new ARGV[0] || 'made_503' #Nombre del usuario
cont = ARGV[1] || '2' #Cantidad de amigos que queremos ver
usuario = Hash.new #Hash usuario donde se guardan los followers
amigos = Twitter.friend_ids(nombre) #Guardar los identificadores de los amigos
aux5 = 0 

puts ""
puts "Los amigos mas populares de #{nombre}:"
puts ""

#Recorrer los amigos
amigos.ids.each do |aux|
	aux2 = Twitter.user(aux)
	if(aux2.protected.to_s != "true")  
		usuario[aux2.name] = aux2.followers_count 
	end
end

#Mostrar por pantalla de forma ordenada por los seguidores
usuarios = usuario.sort_by {|aux3, aux4| -aux4}

usuarios.each do |usuario, count|
	if (aux5 > cont.to_i)
		break
	end
		puts "#{usuario}: #{count} seguidores"
		aux5 += 1
end