class CreateDeploys < ActiveRecord::Migration
  def change
    create_table :deploys do |t|
      t.integer :project_id
      t.integer :user_id

      t.timestamps
    end
  end
end
