module UsersHelper
  def get_roles_helper
    return Role.all.select {|x| x.id != 1}.collect {|x| [x.name, x.id]}
  end
end