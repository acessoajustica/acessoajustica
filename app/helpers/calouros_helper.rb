module CalourosHelper
	def calouros_ordenados(calouros)
		calouros
				.sort_by {|calouro| calouro.membro.nome }
                .sort_by {|calouro| calouro.membro.user.active? }
                .sort_by {|calouro| calouro.membro.user.last_sign_in_at}
	end
end
