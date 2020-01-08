module Dsl
    class MenuDsl
        attr_accessor :nombre,:platos,:precios
        include List
        def initialize(nombre, &block)
            @nombre = nombre
            @precios = List.new()
            @platos = List.new()
            if block_given?
                if block.arity == 1
                    yield self
                else
                    instance_eval(&block)
                end
            end
        end

        def plato(plate,options={})
            @platos.push(plate)
            @precios.push(options[:price]) if options[:price]
        end
        def precio()
            @precios.collect{|x| x}.sum
        end
        def energetico()
            @platos.collect{|x| x.kcal}.sum
        end
        def porproteinas()
            @platos.collect{|x| x.porproteinas()}.sum
        end
        def porlipidos()
            @platos.collect{|x| x.porlipidos()}.sum
        end
        def porcarbohidratos()
            @platos.collect{|x| x.porcarbohidratos()}.sum
        end
        def m2()
            @platos.collect{|x| x.m2()}.sum
        end
        def emisiones()
            @platos.collect{|x| x.emisiones()}.sum
        end
        def to_s()
            output = "#{@nombre}"
            output << ":\n"
            @platos.zip(@precios).each do |plato,precio|
                output << "\t#{plato}\n"
            end
            output<< "Precio: #{precio()}\n"
            output<< "Proteinas: #{porproteinas()}g\n"
            output<< "Lipidos: #{porlipidos()}g\n"
            output<< "Carbohidratos: #{porcarbohidratos()}g\n"
            output<< "Kcal: #{energetico()}\n"
            output<< "M2: #{m2()}\n"
            output<< "Emisiones: #{emisiones()}\n"
            output
        end

    end
end
