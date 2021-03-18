class CreateExamItems < ActiveRecord::Migration[6.1]
  def change
    create_table :exam_items do |t|
      t.string :name,                null: false

      t.timestamps
    end
    add_index :exam_items, :name,    unique: true
  end
end
