class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
      t.string :caption
      t.string :image
      #t.references :owner, null: false, foreign_key: true
      t.belongs_to :owner, null: false, foreign_key: { to_table: :users }, index: true
      t.string :address
      t.integer :bedrooms
      t.integer :bathrooms
      t.integer :rent
      t.string :mortgage
      t.string :tenant_name
      t.string :tenant_phone
      t.integer :comments_count

      t.timestamps
    end
  end
end
