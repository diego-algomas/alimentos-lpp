require "alimentos/list.rb"
require "alimentos/alimentos.rb"
##
# Modulo donde se encuentran la clase plato y plato ambiental
module Plato
    ##
    # Clase plato donde se encuentran los platos dormados por sus alimentos y sus cantidades
    class Plato
        include List
        attr_reader :nombre,:alimentos,:cantidades,:kcal
        ##
        # Esta clase es comparable entre ellas
        include Comparable
        def initialize(nombre,alimentos,cantidades)
            @nombre = nombre
            @alimentos = List.new()
            @cantidades = List.new()
            @alimentos.push_array(alimentos)
            @cantidades.push_array(cantidades)
            @kcal = calculoCalorico()

        end
        ##
        # Realiza el calculo de las calorias totales del plato
        def calculoCalorico()
            calorias = @alimentos.collect { |x| x.calorias()}
            cantidades = @cantidades.collect{ |x| x}
            for i in 0...cantidades.size() do
                calorias[i]=calorias[i]*0.01*cantidades[i]
            end
            calorias.sum
        end
        ##
        # Realiza el calculo del porcentaje de proteinas que tiene
        def porproteinas()def huella()
            ienergia=0
            icarbono=0
            if @kcal<670
				ienergia+=1
			elsif @kcal > 830
				ienergia+=3
			else 
				ienergia+=2
			end
			if emisiones()<800
				icarbono+=1
			elsif emisiones()>1200
				icarbono+=3
			else
				icarbono+=2
			end
			huellapropia= (ienergia+icarbono)/2
			huellapropia
        end
            proteinas = @alimentos.collect { |x| x.proteinas}
            cantidades = @cantidades.collect{|x| x}
            for i in 0...proteinas.size() do
                proteinas[i] = proteinas[i]*cantidades[i]*0.01
            end
            ((proteinas.sum*4/@kcal)*100).round(2)
        end
            ##
        # Realiza el calculo del porcentaje de lipidos que tiene
        def porlipidos()
            lipidos = @alimentos.collect { |x| x.lipidos}
            cantidades = @cantidades.collect{|x| x}
            for i in 0...lipidos.size() do
                lipidos[i]=lipidos[i]*cantidades[i]*0.01
            end
            ((lipidos.sum*9/@kcal)*100).round(2)
        end
        ##
        # Realiza el calculo del porcentaje de carbohidratos que tiene
        def porcarbohidratos()
            carbohidratos = @alimentos.collect{ |x| x.carbohidratos }
            cantidades = @cantidades.collect{|x| x}
            for i in 0...carbohidratos.size() do
                carbohidratos[i]=carbohidratos[i]*cantidades[i]*0.01
            end
            ((carbohidratos.sum*4/@kcal)*100).round(2)
        end
        ##
        # Serializa el plato
        def to_s()
            "#{nombre}: #{alimentos.collect{|x| x.nombre}.join(",")} #{@kcal}kcal"
        end
        ##
        # Permite comparar entre distintos platos según las kcal
        def <=>(other)
            @kcal<=>other.kcal
        end
    end
end
