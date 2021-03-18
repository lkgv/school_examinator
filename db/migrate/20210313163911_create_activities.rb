class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.string     :description,       null: false
      t.integer    :score,             null: false
      t.date       :date,              null: false

      t.belongs_to :exam_item,         index: true
      t.belongs_to :std_activity,      index: true
      t.belongs_to :class_org,         index: true

      t.timestamps
    end
  end
end
