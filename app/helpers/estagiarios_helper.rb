module EstagiariosHelper
  def get_especialidades_helper(especialidades)
    unless especialidades
      especialidades = Especialidade.all
    end
    return especialidades.  collect {|especialidade| [especialidade.description, especialidade.id]}
  end
  def add_all_especialidades(estagiario, especialidades)
  	if especialidades
      especialidades.each do |id|
        unless id.length  == 0
          estagiario.especialidades << Especialidade.find(id)
        end
      end
    end 
  end
end