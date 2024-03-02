class CreateShibas < ActiveRecord::Migration[6.1]
  def change
    create_table :shibas do |t|
      t.string :name
      t.string :genre
      t.text :about
      t.string :image

      t.timestamps
    end
  end
end
