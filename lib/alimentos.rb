
require "alimentos/version"
require "alimentos/alimentos.rb"
require "alimentos/list.rb"
require "alimentos/plato.rb"
require "alimentos/platoAmbiental.rb"
require "alimentos/menu.rb"
require "alimentos/dsl.rb"
require "alimentos/dslmenu.rb"

module Alimentos
  class Error < StandardError; end
  # Your code goes here...
end
module List 
  class Error < StandardError; end
end
module Plato
  class Error < StandardError;end
end
module Menu
  class Error < StandardError;end
end
module Dsl
  class Error < StandardError;end
end



