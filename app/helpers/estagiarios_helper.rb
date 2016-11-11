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

  # GET /estagiarios
  # GET /estagiarios.json
  def estagiarios_ordenados(estagiarios)
    estagiarios
               .sort_by {|estagiario| estagiario.membro.nome }
               .sort_by {|estagiario| estagiario.membro.user.active? }
               .sort_by {|estagiario| estagiario.membro.user.last_sign_in_at}
  end
end
