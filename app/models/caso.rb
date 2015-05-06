class Caso < ActiveRecord::Base
  belongs_to :cliente
  has_many :relatos
end
