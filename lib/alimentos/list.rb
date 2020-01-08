    ##
    # Modulo lista donde se encuentra la clase lista y el diseño de un nodo
module List
    Node = Struct.new(:value,:next,:prev)
    ##
    # Clase lista donde se implementa una clase constituida por una lista doblemente enlazada de elementos
    class List
        ##
        # Incluye el modulo enumerable para permitir la iteración sobre la clase
        include Enumerable
        attr_reader :head,:tail,:lenght
        def initialize ()
            @head = nil
            @tail = nil
            @lenght = 0
        end
        ##
        # Permite insertar un valor en la cola
        def push (valor)
            toinsert = Node.new(valor,nil,nil)
            if @lenght == 0
                @lenght= @lenght+1
                toinsert.next = nil
                toinsert.prev = nil
                @head = toinsert
                @tail = toinsert
            else
                @lenght = @lenght+1
                @tail.next = toinsert
                toinsert.prev = @tail
                toinsert.next = nil
                @tail = toinsert
            end
        end
        ##
        # Permite insertar un array de elementos en la cola
        def push_array(values)
            values.each do |item|
                toinsert = Node.new(item,nil,nil)
                if @lenght == 0
                    @lenght= @lenght+1
                    toinsert.next = nil
                    toinsert.prev = nil
                    @head = toinsert
                    @tail = toinsert
                else
                    @lenght = @lenght+1
                    @tail.next = toinsert
                    toinsert.prev = @tail
                    toinsert.next = nil
                    @tail = toinsert
                end
            end
        end
        ##
        # Permite extraer la cabeza y la devuelve
        def pop_head()
            if @lenght == 1
                aux = @head
                @lenght = 0
                @head = nil
                @tail = nil 
                return aux
            elsif @lenght > 1 
                aux = @head
                @lenght = @lenght-1
                @head = aux.next
                return aux
            else
                return nil
            end            
        end
        ##
        # Permite extraer la cola y la devuelve ese elemento
        def pop_tail()
            if @lenght == 1
                aux = @head
                @lenght = 0
                @head = nil
                @tail = nil 
                return aux
            elsif @lenght > 1 
                aux = @tail
                @lenght = @lenght-1
                @tail = aux.prev
                return aux
            else
                return nil
            end  
        end
        def each
            aux = @head
            while(!aux.nil?)
                yield aux.value
                aux = aux.next
            end
        end
        ##
        # Devuelve el tamaño de la lista
        def size()
            @lenght-1
        end
    end
end