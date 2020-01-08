RSpec.describe Alimentos do

	before(:all) do
		@pollo = Alimentos::Alimentos.new("pollo",20.6,0.0,5.6,5.7,7.1)
		@vaca = Alimentos::Alimentos.new("vaca",21.1,0.0,3.1,50.0,164.0)
		@tofu = Alimentos::Alimentos.new("tofu",8.0,1.9,4.8,2.0,2.2)
		@chocolate = Alimentos::Alimentos.new("chocolate",5.3,47.0,30.0,2.3,3.4)
		@nuez = Alimentos::Alimentos.new("nuez",20.0,21.0,54.0,0.3,7.9)
		@queso = Alimentos::Alimentos.new("queso",25.0,1.3,33.0,11.0,41.0)
		@lentejas = Alimentos::Alimentos.new("lentejas",23.5,52.0,1.4,0.4,3.4)
	end
    context "#Existencia de clase"
	    it "has a version number" do
			   expect(Alimentos::VERSION).not_to be nil
		end
		it "The elements are a instance of Alimentos" do
		    expect(@pollo).to be_a(Alimentos::Alimentos)
		    expect(@tofu).to be_a(Alimentos::Alimentos)
		end
	context "#Has the atributes"
       	it "Existe nombre para el alimento" do
          expect(@pollo.nombre).to eq('pollo')
          expect(@tofu.nombre).to eq('tofu')
		end 
		it "Existen las emisiones" do 
			expect(@pollo.emisiones).to eq(5.7)
			expect(@tofu.emisiones).to eq(2.0)
		end
		it "Existe los m2 del alimento" do
			expect(@pollo.m2).to eq(7.1)
			expect(@tofu.m2).to eq(2.2)
		end
		it "Existen las proteinas" do
			expect(@pollo.proteinas).to eq(20.6)
			expect(@tofu.proteinas).to eq(8.0)
		end
		it "Existen los carbohidratos" do
			expect(@pollo.carbohidratos).to eq(0.0)
			expect(@tofu.carbohidratos).to eq(1.9)
		end
		it "Existen los lipidos" do 
			expect(@pollo.lipidos).to eq(5.6)
			expect(@tofu.lipidos).to eq(4.8)
		end
	context "#Valor energético"
		it "Calcula correctamente las calorias" do
			expect(@pollo.calorias).to eq(132.8)
			expect(@tofu.calorias).to eq(82.8)
		end
	context "#Impacto ambiental"
		it "Impacto ambiental del hombre" do
			#creo una dieta llena de alimentos que sumen las calorias y hago la suma 
			dietaHombre = [@pollo,@vaca,@chocolate,@nuez,@nuez,@lentejas,@lentejas,@queso]
			suma=0
			huella=0
			metros=0
			dietaHombre.each do |i|
				suma+= i.calorias
				metros+=i.m2
				huella+=i.emisiones
			end
			#calorias
			expect(suma.round(2)).to eq(3055.7)
			#emisiones
			expect(huella.round(2)).to eq(70.4)
			#metros
			expect(metros.round(2)).to eq(238.1)
		end
		it "Impacto ambintal de una mujer" do
			dietaMujer = [@vaca,@chocolate,@nuez,@nuez,@lentejas,@lentejas]
			suma=0
			huella=0
			metros=0
			dietaMujer.each do |i|
				suma+= i.calorias
				metros+= i.m2
				huella+=i.emisiones
			end
			#calorias
			expect(suma).to eq(2520.7)
			#emisiones
			expect(huella.round(2)).to eq(53.7)
			#metros
			expect(metros.round(2)).to eq(190)
		end
	context "#Impresion de alimentos"
		# it "Prueba de to_s" do
		# 	expect(@pollo.to_s).to eq("pollo:\nProteinas: 20.6\nCarbohidratos: 0.0\nLipidos: 5.6\nEmisiones: 5.7\nMetros2: 7.1")
		# end 
	
	context "#Comprobaciones Comparable"
		it "Comprueba <==>" do
			expect(@pollo==@pollo).to eq(true)
			expect(@pollo<@tofu).to eq(false)
			expect(@pollo<=@pollo).to eq(true)
			expect(@pollo>@tofu).to eq(true)
			expect(@pollo>=@tofu).to eq(true)
		end
		it "between?" do
			expect(@pollo.between?(@tofu,@nuez)).to eq(true)
		end
		it "clamp" do 
			expect(@pollo.clamp(@tofu,@nuez)).to eq(@pollo)
			expect(@tofu.clamp(@pollo,@nuez)).to eq(@pollo)
		end
end

RSpec.describe List do
	before(:all) do
		@pollo = Alimentos::Alimentos.new("pollo",20.6,0.0,5.6,5.7,7.1)
		@vaca = Alimentos::Alimentos.new("vaca",21.1,0.0,3.1,50.0,164.0)
		@tofu = Alimentos::Alimentos.new("tofu",8.0,1.9,4.8,2.0,2.2)
		@chocolate = Alimentos::Alimentos.new("chocolate",5.3,47.0,30.0,2.3,3.4)
		@nuez = Alimentos::Alimentos.new("nuez",20.0,21.0,54.0,0.3,7.9)
		@queso = Alimentos::Alimentos.new("queso",25.0,1.3,33.0,11.0,41.0)
		@lentejas = Alimentos::Alimentos.new("lentejas",23.5,52.0,1.4,0.4,3.4)
		@leche = Alimentos::Alimentos.new("leche",3.3,4.8,3.2,3.2,8.9)
		@cerveza = Alimentos::Alimentos.new("cerveza",0.5,3.6,0.0,0.24,0.22)
		@huevos = Alimentos::Alimentos.new("huevos",13.0,1.1,11.0,4.2,5.7)
		@cordero = Alimentos::Alimentos.new("cordero",18.0,0.0,17.0,20.0,185.0)
		@cerdo = Alimentos::Alimentos.new("cerdo",21.5,0.0,6.3,7.6,11.0)

		@dietaEspañola = List::List.new()
		@dietaEspañola.push_array([@vaca,@vaca,@chocolate,@chocolate,@nuez,@lentejas,@lentejas,@lentejas,@tofu])
		@dietaVasca = List::List.new()
		@dietaVasca.push_array([@chocolate,@chocolate,@lentejas,@lentejas,@lentejas,@lentejas,@lentejas,@leche,@leche,@cerveza,@cerveza,@cerveza])
		@dietaVegetaria = List::List.new()
		@dietaVegetaria.push_array([@chocolate,@chocolate,@nuez,@tofu,@lentejas,@lentejas,@lentejas,@leche,@leche,@leche,@huevos])
		@dietaVegetariana = List::List.new()
		@dietaVegetariana.push_array([@chocolate,@nuez,@nuez,@tofu,@lentejas,@lentejas,@lentejas,@cerveza,@cerveza,@cerveza,@cerveza,@cerveza])
		@dietaCarnivora = List::List.new()
		@dietaCarnivora.push_array([@cordero,@cordero,@vaca,@vaca,@lentejas,@lentejas,@cerdo,@cerdo,@chocolate,@chocolate,@nuez])

	end
	
	context "Prueba que existe la clase formada por nodos con atributos"
	it "Existe la clase" do 
		lista = List::List.new()	
	end
	it "Existe un nodo con atributos" do 
		nodo = List::Node.new(1,2,3)
		expect(nodo.value).to eq(1)
		expect(nodo.next).to eq(2)
		expect(nodo.prev).to eq(3)
	end
	it "Existe lista que tiene cabeza y cola" do
		list = List::List.new()
		expect(list.head).to be(nil)
		expect(list.tail).to be(nil)
	end
	context "Funciones de la lista"
	it "Inserta un elemento al final" do
		list = List::List.new()
		list.push(7)
		expect(list.head.value).to be(7)
	end
	it "Inserta en una lista un array" do
		list = List::List.new()
		list.push_array([1,2,3])
		expect(list.tail.value).to be(3)
	end
	it "Extraer la cabeza" do 
		list = List::List.new()
		list.push_array([1,2,3,4])
		expect(list.lenght).to eq(4)
		expect(list.head.value).to eq(1)
		list.pop_head()
		expect(list.lenght).to eq(3)
		expect(list.head.value).to eq(2)
	end
	it "Extraer la cola" do
		list = List::List.new()
		list.push_array([1,2,3,4])
		expect(list.lenght).to eq(4)
		expect(list.tail.value).to eq(4)
		list.pop_tail()
		expect(list.lenght).to eq(3)
		expect(list.tail.value).to eq(3)
	end
	context "Prueba de las dietas"
	it "emisiones diarias de gases" do
		#española
		suma = 0
		@dietaEspañola.each do |elemento|
				suma += elemento.emisiones
		end
		expect(suma.round(0)).to eq(108)
		#vasca
		suma = 0
		@dietaVasca.each do |elemento|
				suma += elemento.emisiones
		end
		expect(suma.round(0)).to eq(14)
		#vegetaria
		suma = 0
		@dietaVegetaria.each do |elemento|
				suma += elemento.emisiones
		end
		expect(suma.round(0)).to eq(22)
		#vegetariana
		suma = 0
		@dietaVegetariana.each do |elemento|
				suma += elemento.emisiones
		end
		expect(suma.round(0)).to eq(7)
		#carnivora
		suma = 0
		@dietaCarnivora.each do |elemento|
				suma += elemento.emisiones
		end
		expect(suma.round(0)).to eq(161)
	end
	it "Emisiones anuales" do
				#española
				suma = 0
				@dietaEspañola.each do |elemento|
						suma += elemento.emisiones
				end
				suma*=365
				expect(suma.round(0)).to eq(39457)
				#vasca
				suma = 0
				@dietaVasca.each do |elemento|
						suma += elemento.emisiones
				end
				suma*=365
				expect(suma.round(0)).to eq(5008)
				#vegetaria
				suma = 0
				@dietaVegetaria.each do |elemento|
						suma += elemento.emisiones
				end
				suma*=365
				expect(suma.round(0)).to eq(7993)
				#vegetariana
				suma = 0
				@dietaVegetariana.each do |elemento|
						suma += elemento.emisiones
				end
				suma*=365
				expect(suma.round(0)).to eq(2665)
				#carnivora
				suma = 0
				@dietaCarnivora.each do |elemento|
						suma += elemento.emisiones
				end
				suma*=365
				expect(suma.round(0)).to eq(58729)
	
	end
	it "Estimar m2 uso del terreno" do
		#española
		suma = 0
		@dietaEspañola.each do |elemento|
				suma += elemento.m2
		end
		expect(suma.round(0)).to eq(355)
		#vasca
		suma = 0
		@dietaVasca.each do |elemento|
				suma += elemento.m2
		end
		expect(suma.round(0)).to eq(42)
		#vegetaria
		suma = 0
		@dietaVegetaria.each do |elemento|
				suma += elemento.m2
		end
		expect(suma.round(0)).to eq(59)
		#vegetariana
		suma = 0
		@dietaVegetariana.each do |elemento|
				suma += elemento.m2
		end
		expect(suma.round(0)).to eq(33)
		
		#carnivora
		suma = 0
		@dietaCarnivora.each do |elemento|
				suma += elemento.m2
		end
		expect(suma.round(0)).to eq(741)
	end
	context "#Pruebas para la listas enumerables"
		it "Prueba definicion de each" do 
			expect(@dietaEspañola).to respond_to(:each)
			expect(@dietaEspañola).to respond_to(:min)
			expect(@dietaEspañola).to respond_to(:sort)
		end
	context "#Enumerar listas de alimentos"
		it "Prueba collect" do
			expect(@dietaEspañola.collect{}).to eq([nil, nil, nil, nil, nil, nil, nil, nil, nil])
		end
		it "Prueba de select" do
			expect(@dietaEspañola.select{|x| x.nombre=="vaca"}).to eq([@vaca,@vaca])
		end
		it "Prueba min max" do
			expect(@dietaEspañola.max).to eq(@nuez)
			expect(@dietaEspañola.min).to eq(@tofu)

		end
		it "sort" do
			expect(@dietaEspañola.sort).to eq([@tofu,@vaca,@vaca,@lentejas,@lentejas,@lentejas,@chocolate,@chocolate,@nuez])
		end
end
RSpec.describe Plato::Plato do 
	before(:all) do
		@pollo = Alimentos::Alimentos.new("pollo",20.6,0.0,5.6,5.7,7.1)
		@vaca = Alimentos::Alimentos.new("vaca",21.1,0.0,3.1,50.0,164.0)
		@tofu = Alimentos::Alimentos.new("tofu",8.0,1.9,4.8,2.0,2.2)
		@chocolate = Alimentos::Alimentos.new("chocolate",5.3,47.0,30.0,2.3,3.4)
		@nuez = Alimentos::Alimentos.new("nuez",20.0,21.0,54.0,0.3,7.9)
		@queso = Alimentos::Alimentos.new("queso",25.0,1.3,33.0,11.0,41.0)
		@lentejas = Alimentos::Alimentos.new("lentejas",23.5,52.0,1.4,0.4,3.4)
		@leche = Alimentos::Alimentos.new("leche",3.3,4.8,3.2,3.2,8.9)
		@cerveza = Alimentos::Alimentos.new("cerveza",0.5,3.6,0.0,0.24,0.22)
		@huevos = Alimentos::Alimentos.new("huevos",13.0,1.1,11.0,4.2,5.7)
		@cordero = Alimentos::Alimentos.new("cordero",18.0,0.0,17.0,20.0,185.0)
		@cerdo = Alimentos::Alimentos.new("cerdo",21.5,0.0,6.3,7.6,11.0)

		@plato = Plato::Plato.new("mechada",[@pollo,@vaca],[150,100])
		@brownie = Plato::Plato.new("brownie",[@chocolate,@leche,@huevos,@nuez],[100,50,50,50])
		@ropavieja = Plato::Plato.new("ropavieja",[@pollo,@vaca,@huevos,@cerdo,@tofu],[100,50,50,50,50])
	end
	context "#Existencia de la clase"
	it "Existe la clase" do
		plat = Plato::Plato.new("pollo",[@pollo],[100])
	end
	it "Tiene un atributo nombre" do
		expect(@plato).to respond_to(:nombre)
	end
	it "Existe un conjunto de alimentos" do
		expect(@plato).to respond_to(:alimentos)
		expect(@plato.alimentos).to be_an_instance_of(List::List)
	end
	it "Existe un conjunto de cantidades en gramos" do
		expect(@plato).to respond_to(:cantidades)
		expect(@plato.cantidades).to be_an_instance_of(List::List)
	end
	context"#metodos de porcentajes"
	it "Porcentaje de proteinas" do 
		expect(@plato.porproteinas()).to eq(66.77)
	end
	it "Porcentaje de lipidos" do 
		expect(@plato.porlipidos()).to eq(33.23)
	end
	it "Porcentaje de carbohidratos" do
		expect(@plato.porcarbohidratos()).to eq(0.0)
	end
	context"#Formateado"
	it "Plato formateado" do
		expect(@plato.to_s).to eq("mechada: pollo,vaca 311.5kcal")
	end
	context"#Comparable"
	it "Prueba <==>" do
		expect(@plato==@plato).to eq(true)
		expect(@plato<@brownie).to eq(true)
		expect(@brownie>@plato).to eq(true)
		expect(@brownie>=@plato).to eq(true)
	end
	it "Between?" do 
		expect(@ropavieja.between?(@plato,@brownie)).to eq(true)
	end

end

RSpec.describe Plato::PlatoAmbiental do
	before(:all) do
		@pollo = Alimentos::Alimentos.new("pollo",20.6,0.0,5.6,5.7,7.1)
		@vaca = Alimentos::Alimentos.new("vaca",21.1,0.0,3.1,50.0,164.0)
		@tofu = Alimentos::Alimentos.new("tofu",8.0,1.9,4.8,2.0,2.2)
		@chocolate = Alimentos::Alimentos.new("chocolate",5.3,47.0,30.0,2.3,3.4)
		@nuez = Alimentos::Alimentos.new("nuez",20.0,21.0,54.0,0.3,7.9)
		@queso = Alimentos::Alimentos.new("queso",25.0,1.3,33.0,11.0,41.0)
		@lentejas = Alimentos::Alimentos.new("lentejas",23.5,52.0,1.4,0.4,3.4)
		@leche = Alimentos::Alimentos.new("leche",3.3,4.8,3.2,3.2,8.9)
		@cerveza = Alimentos::Alimentos.new("cerveza",0.5,3.6,0.0,0.24,0.22)
		@huevos = Alimentos::Alimentos.new("huevos",13.0,1.1,11.0,4.2,5.7)
		@cordero = Alimentos::Alimentos.new("cordero",18.0,0.0,17.0,20.0,185.0)
		@cerdo = Alimentos::Alimentos.new("cerdo",21.5,0.0,6.3,7.6,11.0)

		@plato = Plato::PlatoAmbiental.new("mechada",[@pollo,@vaca],[150,100])
	end
	it "Comprobación de las emisiones" do
		expect(@plato.emisiones).to eq(58.55)
	end
	it "Comprobación de los m2" do
		expect(@plato.m2).to eq(174.65)
	end
	it "Eficiencia formateada" do
		expect(@plato.to_s).to eq("mechada: pollo,vaca 311.5kcal\nEmisiones: 58.55\nM2: 174.65")
	end
	context "#clase, tipo y objeto"
	it "Comprueba que es de una clase" do
		expect(@plato.class).to eq(Plato::PlatoAmbiental)

	end
	it "Comprueba el tipo de un objeto" do
		expect(@plato).to be_an_instance_of(Plato::PlatoAmbiental)
	end
	it "Comprueba que es un elemento de la jerarquía" do
		expect(@plato).to be_a(Plato::Plato)
		expect(@plato).to be_a(Plato::PlatoAmbiental)
	end
end
RSpec.describe Menu::Menu do
	before(:all) do
		@pollo = Alimentos::Alimentos.new("pollo",20.6,0.0,5.6,5.7,7.1)
		@vaca = Alimentos::Alimentos.new("vaca",21.1,0.0,3.1,50.0,164.0)
		@tofu = Alimentos::Alimentos.new("tofu",8.0,1.9,4.8,2.0,2.2)
		@chocolate = Alimentos::Alimentos.new("chocolate",5.3,47.0,30.0,2.3,3.4)
		@nuez = Alimentos::Alimentos.new("nuez",20.0,21.0,54.0,0.3,7.9)
		@queso = Alimentos::Alimentos.new("queso",25.0,1.3,33.0,11.0,41.0)
		@lentejas = Alimentos::Alimentos.new("lentejas",23.5,52.0,1.4,0.4,3.4)
		@leche = Alimentos::Alimentos.new("leche",3.3,4.8,3.2,3.2,8.9)
		@cerveza = Alimentos::Alimentos.new("cerveza",0.5,3.6,0.0,0.24,0.22)
		@huevos = Alimentos::Alimentos.new("huevos",13.0,1.1,11.0,4.2,5.7)
		@cordero = Alimentos::Alimentos.new("cordero",18.0,0.0,17.0,20.0,185.0)
		@cerdo = Alimentos::Alimentos.new("cerdo",21.5,0.0,6.3,7.6,11.0)

		@mechada = Plato::PlatoAmbiental.new("mechada",[@pollo,@vaca],[150,100])
		@ropavieja = Plato::PlatoAmbiental.new("ropavieja",[@pollo,@vaca,@huevos,@cerdo],[100,50,30,50])
		@lata = Plato::PlatoAmbiental.new("LataCerveza",[@cerveza],[300])
		@chocolateLeche = Plato::PlatoAmbiental.new("ChocolateLeche",[@chocolate,@leche],[200,200])
		@lentejasCompuestas = Plato::PlatoAmbiental.new("LentejasCompuestas",[@lentejas,@huevos,@pollo],[450,20,20])
		@lentejasPobres = Plato::PlatoAmbiental.new("LentejasPobres",[@vaca,@tofu,@lentejas],[200,150,300])
		@chocolateNueces = Plato::PlatoAmbiental.new("ChocolateNueces",[@chocolate,@nuez],[200,100])
		@huevosrevueltos = Plato::PlatoAmbiental.new("HuevosRevueltos",[@huevos,@leche],[100,80])
		@lentejasvegetarianas = Plato::PlatoAmbiental.new("LentejasVegetarianas",[@lentejas,@tofu],[300,180])
		@vasoLeche = Plato::PlatoAmbiental.new("VasoLeche",[@leche],[200])
		@parrillada = Plato::PlatoAmbiental.new("Parrillada",[@cordero,@vaca,@cerdo,@lentejas],[80,250,300,160])


		@española = Menu::Menu.new("Española",[@lentejasPobres,@chocolateNueces])
		@vasca = Menu::Menu.new("Vasca",[@lata,@chocolateLeche,@lentejasCompuestas])
		@vegetaria = Menu::Menu.new("Vegetaria",[@chocolateNueces,@vasoLeche,@lentejasvegetarianas,@huevosrevueltos])
		@vegetariana = Menu::Menu.new("Vegetariana",[@lata,@lentejasvegetarianas,@chocolateNueces])
		@carnivora = Menu::Menu.new("Carnivora",[@parrillada,@chocolateNueces])
	end
	context "Comprueba que existe la clase"
	it "Comprueba que se puede crear una dieta" do
		expect(@española).to be_an_instance_of(Menu::Menu)
	end
	it "Crea una clase con nombre y alimentos" do
		expect(@española).to respond_to(:nombre)
		expect(@española).to respond_to(:platos)
	end
	context"#Comparable"
	it "<=>" do
		expect(@española>@vasca).to eq(true)
	end
	context"Eficiencia de la dieta"
	it "Porcentaje lipidos" do
		expect(@vasca).to respond_to(:lipidos)
	end
	it "Porcentaje carbohidratos" do
		expect(@vasca).to respond_to(:carbohidratos)
	end
	it "Porcentaje proteinas" do
		expect(@vasca).to respond_to(:proteinas)
	end
	context"#Formatea el menú"
	it "to_s" do 
		expect(@vasca.to_s).to eq("Menu: Vasca\n Proteinas: 16.37%\nCarbohidratos:63.24%\nLipidos:20.39%\nKcal:2603.34")
	end
	context"#porcentajes de menus"
	it "Española" do
		expect(@española.proteinas).to be_within(10).of(20)
		expect(@española.lipidos).to be_within(10).of(40)
		expect(@española.carbohidratos).to be_within(10).of(40)
	end
	it "Vasca" do
		expect(@vasca.proteinas).to be_within(10).of(15)
		expect(@vasca.lipidos).to be_within(10).of(25)
		expect(@vasca.carbohidratos).to be_within(10).of(60)
	end
	it "Vegetaria" do
		expect(@vegetaria.proteinas).to be_within(10).of(20)
		expect(@vegetaria.lipidos).to be_within(10).of(40)
		expect(@vegetaria.carbohidratos).to be_within(10).of(40)
	end
	context"Comparaciones de menu"
	it "<" do
		expect(@española<@vegetaria).to eq(true)
	end
	it ">" do
		expect(@vegetaria>@vegetariana).to eq(true)
	end
	it ">=" do
		expect(@carnivora>=@española).to eq(true)
	end
	it "<=" do
		expect(@vasca<=@carnivora).to eq(true)
	end
	it "between?" do
		expect(@española.between?(@vegetariana,@carnivora)).to eq(true)
	end
	it "clamp" do 
		expect(@carnivora.clamp(@vegetariana,@española)).to eq(@española)
		expect(@vegetaria.clamp(@vasca,@vegetariana)).to eq(@vegetariana)
	end

	context "#Pruebas para la listas enumerables"
	it "Prueba definicion de each" do 
		expect(@española).to respond_to(:each)
		expect(@española).to respond_to(:min)
		expect(@española).to respond_to(:sort)
	end		
	context "#Enumerar listas de alimentos"
		it "Prueba collect" do
			expect(@española.collect{|x| x.nombre}).to eq(["LentejasPobres","ChocolateNueces"])
			expect(@vasca.collect{|x| x.nombre}).to eq(["LataCerveza","ChocolateLeche","LentejasCompuestas"])
			expect(@vegetaria.collect{|x| x.nombre}).to eq(["ChocolateNueces","VasoLeche","LentejasVegetarianas","HuevosRevueltos"])
			expect(@vegetariana.collect{|x| x.nombre}).to eq(["LataCerveza","LentejasVegetarianas","ChocolateNueces"])
			expect(@carnivora.collect{|x| x.nombre}).to eq(["Parrillada","ChocolateNueces"])
		end
		it "Prueba de select" do
			expect(@española.select{|x| x.nombre=="LentejasPobres"}).to eq([@lentejasPobres])
			expect(@vasca.select{|x| x.nombre=="LataCerveza"}).to eq([@lata])
			expect(@vegetaria.select{|x| x.nombre=="ChocolateNueces"}).to eq([@chocolateNueces])
			expect(@vegetariana.select{|x| x.nombre=="LataCerveza"}).to eq([@lata])
			expect(@carnivora.select{|x| x.nombre=="ChocolateNueces"}).to eq([@chocolateNueces])
		end
		it "Prueba min max" do
			expect(@española.max).to eq(@chocolateNueces)
			expect(@española.min).to eq(@lentejasPobres)
			expect(@vasca.min).to eq(@lata)
			expect(@vegetaria.max).to eq(@chocolateNueces)
			expect(@vegetariana.min).to eq(@lata)
			expect(@carnivora.min).to eq(@parrillada)
		end
		it "sort" do
			expect(@española.sort).to eq([@lentejasPobres,@chocolateNueces])
			expect(@vasca.sort).to eq([@lata,@chocolateLeche,@lentejasCompuestas])
			expect(@vegetaria.sort).to eq([@vasoLeche,@huevosrevueltos,@lentejasvegetarianas,@chocolateNueces])
			expect(@vegetariana.sort).to eq([@lata,@lentejasvegetarianas,@chocolateNueces])
			expect(@carnivora.sort).to eq([@parrillada,@chocolateNueces])
		end
	
end

RSpec.describe Plato::PlatoAmbiental do
	context "Menu dietético"
	before(:all) do
		@pollo = Alimentos::Alimentos.new("pollo",20.6,0.0,5.6,5.7,7.1)
		@vaca = Alimentos::Alimentos.new("vaca",21.1,0.0,3.1,50.0,164.0)
		@tofu = Alimentos::Alimentos.new("tofu",8.0,1.9,4.8,2.0,2.2)
		@chocolate = Alimentos::Alimentos.new("chocolate",5.3,47.0,30.0,2.3,3.4)
		@nuez = Alimentos::Alimentos.new("nuez",20.0,21.0,54.0,0.3,7.9)
		@queso = Alimentos::Alimentos.new("queso",25.0,1.3,33.0,11.0,41.0)
		@lentejas = Alimentos::Alimentos.new("lentejas",23.5,52.0,1.4,0.4,3.4)
		@leche = Alimentos::Alimentos.new("leche",3.3,4.8,3.2,3.2,8.9)
		@cerveza = Alimentos::Alimentos.new("cerveza",0.5,3.6,0.0,0.24,0.22)
		@huevos = Alimentos::Alimentos.new("huevos",13.0,1.1,11.0,4.2,5.7)
		@cordero = Alimentos::Alimentos.new("cordero",18.0,0.0,17.0,20.0,185.0)
		@cerdo = Alimentos::Alimentos.new("cerdo",21.5,0.0,6.3,7.6,11.0)

		@mechada = Plato::PlatoAmbiental.new("mechada",[@pollo,@vaca],[150,100])
		@ropavieja = Plato::PlatoAmbiental.new("ropavieja",[@pollo,@vaca,@huevos,@cerdo],[100,50,30,50])
		@lata = Plato::PlatoAmbiental.new("LataCerveza",[@cerveza],[300])
		@chocolateLeche = Plato::PlatoAmbiental.new("ChocolateLeche",[@chocolate,@leche],[200,200])
		@lentejasCompuestas = Plato::PlatoAmbiental.new("LentejasCompuestas",[@lentejas,@huevos,@pollo],[450,20,20])
		@lentejasPobres = Plato::PlatoAmbiental.new("LentejasPobres",[@vaca,@tofu,@lentejas],[200,150,300])
		@chocolateNueces = Plato::PlatoAmbiental.new("ChocolateNueces",[@chocolate,@nuez],[200,100])
		@huevosrevueltos = Plato::PlatoAmbiental.new("HuevosRevueltos",[@huevos,@leche],[100,80])
		@lentejasvegetarianas = Plato::PlatoAmbiental.new("LentejasVegetarianas",[@lentejas,@tofu],[300,180])
		@vasoLeche = Plato::PlatoAmbiental.new("VasoLeche",[@leche],[200])
		@parrillada = Plato::PlatoAmbiental.new("Parrillada",[@cordero,@vaca,@cerdo,@lentejas],[80,250,300,160])

		@menuEspañol = [@lentejasPobres,@chocolateNueces]
		@precioEspañol = [12.0,4.5] 
		@menuVasco = [@lata,@chocolateLeche,@lentejasCompuestas]
		@precioVasco = [2.0,4.3,10.0]
		@menuVegetario = [@chocolateNueces,@vasoLeche,@lentejasvegetarianas,@huevosrevueltos]
		@precioVegetario = [4.5,2.0,9.0,11.0] 
		@menuVegetariano = [@lata,@lentejasvegetarianas,@chocolateNueces]
		@precioVegetariano = [1.5,9.0,4.5]
		@menuCarnivoro = [@parrillada,@chocolateNueces]
		@precioCarnivoro = [15.0,4.5]

		def huella_nutricional(menu)
			hmenu=0
			menu.collect{ |x|
				hmenu+= x.huella()
			}
			hmenu= hmenu/ menu.length 
			hmenu
		end

	end
	def multiplicadorAmbiental(menu,precios)
		huella=menu.collect{|x| x.huella()}
		huella = huella.sum/menu.length
		precio = huella*precios.sum
	end
	it "Calculo del plato con mayor huella" do
		expect(@menuCarnivoro.max).to eq(@parrillada)
		expect(@menuEspañol.max).to eq(@lentejasPobres)
		expect(@menuVegetario.max).to eq(@lentejasvegetarianas)
		expect(@menuVegetariano.max).to eq(@lentejasvegetarianas)
		expect(@menuVasco.max).to eq(@lentejasPobres)
	end
	it "Aumento del precio en funcion de la contaminacion" do
		expect(multiplicadorAmbiental(@menuEspañol,@precioEspañol)).to eq(33.0)
		expect(multiplicadorAmbiental(@menuCarnivoro,@precioCarnivoro)).to eq(39.0)
		expect(multiplicadorAmbiental(@menuVegetariano,@precioVegetariano)).to eq(15.0)
		expect(multiplicadorAmbiental(@menuVegetario,@precioVegetario)).to eq(26.5)
		expect(multiplicadorAmbiental(@menuVasco,@precioVasco)).to eq(16.3)
	end
end

RSpec.describe Dsl::Platodsl do

	before(:all) do
		@pollo = Alimentos::Alimentos.new("pollo",20.6,0.0,5.6,5.7,7.1)
		@queso = Alimentos::Alimentos.new("queso",25.0,1.3,33.0,11.0,41.0)
	end
	it "Clase con DSL" do
		pollo = Alimentos::Alimentos.new("pollo",20.6,0.0,5.6,5.7,7.1)
		queso = Alimentos::Alimentos.new("queso",25.0,1.3,33.0,11.0,41.0)
		plato = Dsl::Platodsl.new("hamburguesa") do
			alimento pollo, :cantidad => 100
			alimento queso, :cantidad => 20
		end
		expect(plato).to be_an_instance_of(Dsl::Platodsl)
		expect(plato.alimentos.size()).to eq(1)
	end
	it "Prueba de formateio de Menu" do
		pollo = Alimentos::Alimentos.new("pollo",20.6,0.0,5.6,5.7,7.1)
		queso = Alimentos::Alimentos.new("queso",25.0,1.3,33.0,11.0,41.0)
		plato = Dsl::Platodsl.new("hamburguesa") do
			alimento pollo, :cantidad => 100
			alimento queso, :cantidad => 20
		end
		expect(plato.to_s).to eq("hamburguesa:\n\t\tpollo: 100g\n\t\tqueso: 20g\n\t\tValor energético: 213.24kcal\n\t\tHuella: 1")
	end
end
RSpec.describe Dsl::MenuDsl do
	before(:all) do
		pollo = Alimentos::Alimentos.new("pollo",20.6,0.0,5.6,5.7,7.1)
		queso = Alimentos::Alimentos.new("queso",25.0,1.3,33.0,11.0,41.0)
		@hamburguesa = Dsl::Platodsl.new("hamburguesa") do
			alimento pollo, :cantidad => 100
			alimento queso, :cantidad => 20
		end
	end
	it "Clase Menu con Dsl " do
		hamburguesa = @hamburguesa
		menu = Dsl::MenuDsl.new("Plato combinado") do
			plato hamburguesa, :price => 15.5
			plato hamburguesa, :price => 16
		end
		expect(menu).to be_an_instance_of(Dsl::MenuDsl)
		expect(menu.platos.size()).to eq(1)
	end
	it "Prueba de to_s a Menu Dsl"do
		hamburguesa = @hamburguesa
		menu = Dsl::MenuDsl.new("Plato combinado") do
			plato hamburguesa, :price => 15.5
			plato hamburguesa, :price => 16
		end
		puts menu
		expect(menu.to_s).to eq("Plato combinado:\n\thamburguesa:\n\t\tpollo: 100g\n\t\tqueso: 20g\n\t\tValor energético: 213.24kcal\n\t\tHuella: 1\n\thamburguesa:\n\t\tpollo: 100g\n\t\tqueso: 20g\n\t\tValor energético: 213.24kcal\n\t\tHuella: 1\nPrecio: 31.5\nProteinas: 96.04g\nLipidos: 102.98g\nCarbohidratos: 0.98g\nKcal: 426.48\nM2: 30.6\nEmisiones: 15.8\n")
	end

end