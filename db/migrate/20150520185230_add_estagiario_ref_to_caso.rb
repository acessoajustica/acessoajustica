class AddEstagiarioRefToCaso < ActiveRecord::Migration
  def change
    add_reference :casos, :estagiario, index: true
    add_foreign_key :casos, :estagiarios
  end
end
