class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.float :rating
      t.integer :votes

      t.timestamps
    end
  end
end
