class DropExamples < ActiveRecord::Migration[5.0]
  def change
    drop_table :examples do |t|
      t.string :content, null: false
      t.references :user, index: true, foreign_key: true, null: false
      t.timestamps null: false
    end
  end
end
