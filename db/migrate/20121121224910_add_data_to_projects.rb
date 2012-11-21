class AddDataToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :daily_target, :integer, :default => 40
    add_column :projects, :uuid, :string
  end
end
