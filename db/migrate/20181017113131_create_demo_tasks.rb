class CreateDemoTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :demo_tasks do |t|
      t.string :name
      t.boolean :done, default: false
    end
  end
end
