class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :text
      t.references :commentable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
