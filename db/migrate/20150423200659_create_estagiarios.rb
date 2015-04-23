class CreateEstagiarios < ActiveRecord::Migration
  def change
    create_table :estagiarios do |t|
      t.string :especialidade

      t.timestamps null: false
    end
  end
end
