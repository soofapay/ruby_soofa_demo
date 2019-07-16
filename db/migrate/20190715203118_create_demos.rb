class CreateDemos < ActiveRecord::Migration[5.2]
  def change
    create_table :demos do |t|
      t.text :data

      t.timestamps
    end
  end
end
