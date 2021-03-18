class CreateStdActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :std_activities do |t|
      t.string      :description,        null: false
      t.integer     :score,              null: false
      t.belongs_to  :exam_item,          index: true

      t.timestamps
    end
  end
end
