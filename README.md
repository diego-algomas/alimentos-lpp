# Alimentos

Gema creada por Diego Machín Guardia
Práctica 6 de LPP

## Descripción

En esta gema está creada para almacenar la información relacionada a cada uno de los alimentos. En las pruebas se encuentran distintas pruebas del buen funcionamiento de la clase. Por otro lado esta gema ha sido desarrollada usando el desarrollo por pruebas


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'alimentos'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install alimentos

## Desarrollo

El primer paso de la ejecución consistirá en crear la estructura de los ficheros usando el bundle y aprovechando para crear una gema. Esto se hará ejecutando el siguiente comando:
	bundle gem alimentos
A continuación editaremos el fichero de alimentos.gemspec donde actualizaremos la información para que corresponda con la de la aplicación y se ejecutará el bundle install para instalar todas las dependencias necesarias.

La creación de esta gema ha sido realizada usando la técnica de TDD en la cual primero se crean las pruebas y a continuación se realizará el código necesario para que pase la prueba. Es por ello que cualquier cambio en el código se puede comprobar el buen funcionamiento de la gema gracias a todas las pruebas creadas. Para lanzar todas las pruebas se realiza el `rake` el cual lanza por defecto todas las pruebas. 


# Práctica 7

## Clase List

Para esta tarea se ha implementado dentro del directorio lib/alimentos un modulo donde se incluye la clase Lista. En esta clase se define los métodos de una lista doblemente enlazada en la cual se almacena la longitud la cabeza y además es iterable en toda ella gracias al módulo enumerable. 

En el directorio rspec a continuación de lsa pruebas de la clase alimento se encuentras las pruebas para la clase lista y el resto de las pruebas para comprobar el buen funcionamiento de la clase. Todo esto hecho siguiendo el TDD. 

## Pruebas de las Dietas

Para las pruebas de las emisiones y el espacio dañado por cada una de las dietas se ha procedido a crear una variable dieta donde se alamacenan todos los alimentos que tiene esa dieta. Como cada alimento guarda los datos para 100 g de alimento se han hecho los calculos para aproximar la ingesta de calorías necesarias entre un hombre y una mujer siguiendo cada una de las dietas propuestas: española, vasca, vegetariana,vegetaria y carnívora. Es por ello que cada uno de los alimentos de esta lista respeta los porcentajes de cada una de éstas dietas además de cumplir la ingesta calórica necesaria para un día. 

## P8

Cabe destacar la clase Menu y la clase plato. La clase Menu incluye una lista de platos donde cada plato es una clase que contiene varios alimentos con sus correspondientes cantidades. 
La clase menú es enumerable y comparable así como la clase plato es enumerable. 

## P9 
La documentación de todo el repositorio puede ser consultada en 
    https://diego-algomas.github.io/Documentacion-Alimentos/index.html