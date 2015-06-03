class Ability
  include CanCan::Ability

  def initialize( user ) 
    user ||= User.new                          # guest user 

    if user.role? :admin 
      can :manage, :all 
    elsif user.role? :diretor
      can :manage, Caso
      can :manage, Cliente
      can :manage, User
    elsif user.role? :estagiário
      can :manage, Caso
      can :manage, Cliente
    elsif user.role? :calouro
      can :manage, Cliente
      can :manage, Caso
    end 
  end 
end
