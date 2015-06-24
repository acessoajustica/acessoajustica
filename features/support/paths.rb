module NavigationHelpers
  def path_to(page_name)
    case page_name
 
    when /my cases/
      '/casos/my-cases'
    when /clientes new/
      '/clientes/new'
  	when /login page/
      '/users/sign_in'
    when /home\s?page/
      '/'
    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)