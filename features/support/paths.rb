module NavigationHelpers
  def path_to(page_name)
    case page_name

    when /my cases/
      '/atendimentos/my-cases'
    when /clientes new/
      '/clientes/new'
  	when /login page/
      '/users/sign_in'
    when /edit atendimento (\d+)/
      '/atendimentos/' + $1 + '/edit'
    when /home\s?page/
      '/'
    when /pessoas page/
      '/pessoas'
    when /new pessoas page/
      '/pessoas/new'
    when /estagiarios page/
      '/estagiarios'
    when /new estagiarios page/
      '/estagiarios/new'
    when /calouros page/
      '/calouros'
    when /new calouros page/
      '/calouros/new'
    when /vareiros page/
      '/vareiros'
    when /new vareiros page/
      '/vareiros/new'
    when /membros page/
      '/membros'
    when /new membros page/
      '/membros/new'
    when /clientes page/
      '/clientes'
    when /new clientes page/
      '/clientes/new'
    when /atendimentos page/
      '/atendimentos'
    when /new atendimentos page/
      '/clientes/new'
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
