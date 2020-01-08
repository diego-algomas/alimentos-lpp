##
# Modulo donde se encuentra la clase de alimentos

module Alimentos
	##
	# Clase alimentos donde se guardan las propiedades del mismo 
	class Alimentos
		include Comparable
		attr_reader :nombre,:proteinas,:carbohidratos,:lipidos,:emisiones,:m2
		def initialize (nombre,proteinas,carbohidratos,lipidos,emisiones,m2)
			@nombre = nombre
			@proteinas = proteinas
			@carbohidratos = carbohidratos
			@lipidos = lipidos
			@emisiones = emisiones
			@m2 = m2
			
		end
		##
		# Metodo que calcula las kcal de un alimento
		def calorias()
			kcal = (@proteinas*4)+(@lipidos*9)+(@carbohidratos*4)
			kcal.round(2)
		end
		##
		# Serializador de un alimento
		def to_s()
			"#{@nombre}"
		end
		##
		# Permite comparar entre alimentos
		def <=>(other)
			calorias()<=> other.calorias()
		end
	end
end
