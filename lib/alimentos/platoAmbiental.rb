
module Plato
    ##
    # Clase de plato ambientales que hereda de plato
    # En ella se tiene en cuenta los valores de contaminación que lleva consigo un plato
    class PlatoAmbiental < Plato
        def initialize(nombre,ingredientes,cantidades)
            super(nombre,ingredientes,cantidades)
        end
        ##
        # Calcula las emisiones asociadas a cada plato
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
        # Serializa el plato ambiental
        def to_s()
            "#{nombre}: #{alimentos.collect{|x| x.nombre}.join(",")} #{@kcal}kcal\nEmisiones: #{emisiones()}\nM2: #{m2()}"
        end
        ##
        # Calcula la huella ambiental de cada uno de los platos
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
        # Sobrecarga propia de la huella para que ordene los platos en función de la huella
        def <=>(other)
            huella()<=>other.huella()
        end
    end
    
end