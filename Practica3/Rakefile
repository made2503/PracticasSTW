desc "Jugada Piedra, Papel o Tijeras"
task :default do
	sh "rackup"
end

desc "Ejecutar con piedra"
task :rock do
	sh %q{curl -v 'http://localhost:9292?choice=rock'}
end

desc "Ejecutar con papel"
task :paper do
	sh %q{curl -v 'http://localhost:9292?choice=paper'}
end

desc "Ejecutar con tijeras"
task :scissors do
	sh %q{curl -v 'http://localhost:9292?choice=scissors'}
end

desc "Ejecutar servidor"
task :server do
	sh "rackup"
end