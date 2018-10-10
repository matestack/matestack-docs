class CreateDemoUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :demo_users do |t|
      t.string :name
      t.boolean :deleted
    end
  end
end
