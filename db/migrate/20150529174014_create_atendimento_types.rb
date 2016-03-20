class CreateAtendimentoTypes < ActiveRecord::Migration
  def change
    create_table :atendimento_types do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
