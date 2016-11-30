class Vareiro < ActiveRecord::Base
  acts_as :membro

  validates :forum, presence: true

  validates_presence_of :created_at
  validates_presence_of :updated_at

end
