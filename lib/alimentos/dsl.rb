require "alimentos/list.rb"
module Dsl
    class Platodsl
        include List
        attr_accessor :nombre,:alimentos,:cantidades,:kcal
        ##
        # Esta clase es comparable entre ellas
        include Comparable
        def initialize(nombre,&block)
            @nombre = nombre
            @alimentos = List.new()
            @cantidades = List.new()
            
            if block_given?
                if block.arity == 1
                    yield self
                else
                    instance_eval(&block)
                end
            end
        end
        def alimento(aliment, options={})
            @alimentos.push(aliment)
            @cantidades.push(options[:cantidad]) if options[:cantidad]
            @kcal=calculoCalorico()
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
        def porproteinas()
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
        def emisiones()
            emisiones= @alimentos.collect{ |x| x.emisiones }
            cantidades = @cantidades.collect{|x| x}
            for i in 0...emisiones.size() do
                emisiones[i]=emisiones[i]*cantidades[i]*0.01
            end
            (emisiones.sum).round(2)
        end
        ##
        # Calcula los metros cuadrados que gasta cada plato
        def m2()
            m2= @alimentos.collect{ |x| x.m2}
            cantidades = @cantidades.collect{|x| x}
            for i in 0...m2.size() do
                m2[i]=m2[i]*cantidades[i]*0.01
            end
            (m2.sum).round(2)
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
        def huella()
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
        ##
        # Serializa el plato
        def to_s()
            output = "#{@nombre}:\n"
            @alimentos.zip(@cantidades).each do |aliment,cantidad|
                output<<"\t\t#{aliment}: #{cantidad}g\n"
            end
            output << "\t\tValor energético: #{@kcal}kcal\n"
            output << "\t\tHuella: #{huella()}"
            output
        end
        ##
        # Permite comparar entre distintos platos según las kcal
        def <=>(other)
            @kcal<=>other.kcal
        end
    end
end