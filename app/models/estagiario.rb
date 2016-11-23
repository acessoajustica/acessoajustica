class Estagiario < ActiveRecord::Base
  acts_as :membro
  has_and_belongs_to_many :especialidades, :join_table => :estagiarios_especialidades
  validates_presence_of :created_at
  validates_presence_of :updated_at
  

  def is_diretor
    @users = User.all.joins(:roles).joins(:membro).where("roles.name = 'diretor'")
    self.membro.user.id.in?(@users.ids)
  end
end
