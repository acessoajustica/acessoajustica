class Vareiro < ActiveRecord::Base
  acts_as :membro

  validates :forum, presence: true
end
