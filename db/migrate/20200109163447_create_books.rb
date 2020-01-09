class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :year
      t.boolean :avaliable, default: true
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end
