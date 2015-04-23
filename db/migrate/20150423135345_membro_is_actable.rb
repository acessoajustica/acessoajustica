class MembroIsActable < ActiveRecord::Migration
  def change
  	change_table :membros do |t|
      t.actable
    end
  end
end
