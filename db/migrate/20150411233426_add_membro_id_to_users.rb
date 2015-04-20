class AddMembroIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :membro_id, :integer
  end
end
