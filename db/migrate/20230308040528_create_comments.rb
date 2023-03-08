class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.belongs_to :author, null: false, foreign_key: { to_table: :users }, index: true
      t.belongs_to :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
