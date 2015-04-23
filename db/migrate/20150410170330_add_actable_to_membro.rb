class AddActableToMembro < ActiveRecord::Migration
  def change
    change_table :pessoas do |t|
      t.actable
    end
  end
end
