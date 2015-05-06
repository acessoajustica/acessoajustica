module UsersHelper
  def get_roles_helper
    return Role.all.select {|role| role.name != "admin" && role.name != "diretor"}.collect {|role| [role.name, role.id]}
  end
end