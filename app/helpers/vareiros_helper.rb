module VareirosHelper
	def vareiros_ordenados(vareiros)
		vareiros
            .sort_by {|vareiro| vareiro.membro.nome }
            .sort_by {|vareiro| vareiro.membro.user.active? }
            .sort_by {|vareiro| vareiro.membro.user.last_sign_in_at}
	end
end
