class CreateDemoComments < ActiveRecord::Migration[5.2]
  def change
    create_table :demo_comments do |t|
      t.text :content
    end
  end
end
