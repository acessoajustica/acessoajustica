class Pessoa < ActiveRecord::Base
  actable
  validates :nome,
            :presence => true
end
