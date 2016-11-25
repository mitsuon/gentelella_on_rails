class Espejo < ActiveRecord::Base
  belongs_to :mirror, :class_name => 'Modulo'
  belongs_to :reflector, :class_name => 'Modulo'
end
