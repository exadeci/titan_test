class CreateContents < ActiveRecord::Migration[8.1]
  def change
    create_table :contents do |t|
      t.string :type, null: false
      t.string :title, null: false
      t.string :original_title, null: false
      t.integer :year, null: false
      t.integer :number
      t.references :tv_show, foreign_key: { to_table: :contents, on_delete: :cascade }
      t.references :season, foreign_key: { to_table: :contents, on_delete: :cascade }

      t.timestamps
    end
  end
end
