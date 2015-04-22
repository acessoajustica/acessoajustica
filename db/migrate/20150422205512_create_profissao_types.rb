class CreateProfissaoTypes < ActiveRecord::Migration
  def change
    create_table :profissao_types do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
