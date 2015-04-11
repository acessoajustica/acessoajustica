class Ability
  include CanCan::Ability

  def initialize( user ) 
    user ||= User.new                          # guest user 

    if user.role? :admin 
      can :manage, :all 
    elsif user.role? :diretor
      can :manage, :all
    elsif user.role? :estagiário
      cannot :create, User
    end 
  end 
end
