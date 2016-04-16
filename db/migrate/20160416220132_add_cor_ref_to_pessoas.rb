class AddCorRefToPessoas < ActiveRecord::Migration
  def change
    add_reference :pessoas, :cor, index: true
    add_foreign_key :pessoas, :cors
  end
end
