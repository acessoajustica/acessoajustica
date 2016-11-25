module NavigationHelpers
  def path_to(page_name)
    case page_name

    when /^homepage?$/
      '/'
    when /^my cases$/
      '/atendimentos/my-cases'
  	when /^login$/
      '/users/sign_in'
    when /^edit atendimento (\d+)$/
      '/atendimentos/' + $1 + '/edit'
    when /^pessoas$/
      '/pessoas'
    when /^new pessoas$/
      '/pessoas/new'
    when /^estagiarios$/
      '/estagiarios'
    when /^new estagiarios$/
      '/estagiarios/new'
    when /^calouros$/
      '/calouros'
    when /^new calouros$/
      '/calouros/new'
    when /^vareiros$/
      '/vareiros'
    when /^new vareiros$/
      '/vareiros/new'
    when /^membros$/
      '/membros'
    when /^new membros$/
      '/membros/new'
    when /^clientes$/
      '/clientes'
    when /^new clientes$/
      '/clientes/new'
    when /^atendimentos$/
      '/atendimentos'
    when /^new atendimentos$/
      '/clientes/new'
    else
      begin
        page_name =~ /the (.*)/
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
