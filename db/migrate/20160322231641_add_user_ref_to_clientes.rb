class AddUserRefToClientes < ActiveRecord::Migration
  def change
    add_reference :clientes, :user, index: true
    add_foreign_key :clientes, :users
  end
end
