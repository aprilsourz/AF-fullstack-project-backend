class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :content
      t.references :user, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
