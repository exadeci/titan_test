class CreateListItems < ActiveRecord::Migration[8.1]
  def change
    create_table :list_items do |t|
      t.references :list, null: false, foreign_key: { on_delete: :cascade }
      t.references :content, null: false, foreign_key: { to_table: :contents, on_delete: :cascade }
      t.integer :position, null: false

      t.timestamps
    end

    add_index :list_items, [ :list_id, :position ], unique: true
    add_index :list_items, [ :list_id, :content_id ], unique: true
  end
end
