class AddColumnToHires < ActiveRecord::Migration[5.2]
  def change
    add_column :hires, :hired, :boolean
  end
end
