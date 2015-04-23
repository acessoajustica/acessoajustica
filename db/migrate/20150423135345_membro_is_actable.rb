class MembroIsActable < ActiveRecord::Migration
  def change
  	change_table :membro do |t|
      t.actable
    end
  end
end
