class AddColumnToSolutions < ActiveRecord::Migration[5.1]
  def change
  	add_column :solutions, :describe, :text 
  end
end
