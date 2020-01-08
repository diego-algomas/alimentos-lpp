    ##
    # Modulo donde se encuentra la clase menú (practica 8)
    # Actualemente en desuso
module Menu
    ##
    # Clase Menu donde se almacenaban una lista con los platos y la suma calórica de os mismos
    class Menu
        attr_reader :nombre,:platos,:kcal,:proteinas,:lipidos,:carbohidratos
        include Comparable,Enumerable
        def initialize(nombre,platos)
            @platos = List::List.new()
            @platos.push_array(platos)
            @nombre = nombre
            @proteinas = getProteinas()
            @lipidos = getLipidos()
            @carbohidratos = getCarbohidratos()
            @kcal = getKcal()
        end
        ##
        # calcula las Kcal del menú
        def getKcal()
            kalorias = @platos.collect{|x| x.kcal}
            (kalorias.sum).round(2)
        end
        ##
        # Calcula la cantidad de lípidos
        def getLipidos()
            lipids = @platos.collect{|x| x.porlipidos()}
            (lipids.sum/lipids.size()).round(2)
        end
        ##
        # calcula la cantidad de proteinas
        def getProteinas()
            proteins = @platos.collect{|x| x.porproteinas()}
            (proteins.sum/proteins.size()).round(2)
        end
        ##
        # calcula la cantidad de carbohidratos
        def getCarbohidratos()
            carbs = @platos.collect{|x| x.porcarbohidratos()}
            (carbs.sum/carbs.size()).round(2)
        end        
            ##
            # Compara entre distintos menus por las kcal
        def <=>(other)
            kcal<=>other.kcal
        end
             ## Transforma en un strig el menú
        def to_s
            "Menu: #{@nombre}\n Proteinas: #{@proteinas}%\nCarbohidratos:#{@carbohidratos}%\nLipidos:#{@lipidos}%\nKcal:#{@kcal}"
        end
            ##
            #Implementa el enumerable del menu
        def each
            aux = @platos.head
            while(!aux.nil?)
                yield aux.value
                aux = aux.next
            end
        end
    end
end