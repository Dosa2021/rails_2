class CreateMicroposts < ActiveRecord::Migration[7.0]
  def change
    create_table :microposts do |t|
      t.string :name
      t.datetime :completed_at
      t.references :user, null: false, foreign_key: true
      t.references :categorie, null: false, foreign_key: true
      t.timestamps
    end
    add_index :microposts, [:user_id, :created_at]
  end
end
