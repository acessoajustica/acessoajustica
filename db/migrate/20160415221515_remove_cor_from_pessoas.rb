class RemoveCorFromPessoas < ActiveRecord::Migration
  def change
    remove_column :pessoas, :cor, :string
  end
end
