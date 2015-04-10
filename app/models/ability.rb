class Ability
  include CanCan::Ability

  def initialize( user ) 
    user ||= User.new                          # guest user 

    if user.role :super_admin 
      can :manage, :all 
    elsif user.role :director
      can :manage, :all 
    end 
  end 
end
