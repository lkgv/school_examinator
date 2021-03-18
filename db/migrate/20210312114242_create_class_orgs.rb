class CreateClassOrgs < ActiveRecord::Migration[6.1]
  def change
    create_table :class_orgs do |t|
      t.integer    :grade,              null: false, default: 0
      t.integer    :number,             null: false
      t.integer    :score,              null: false, default: 100

      t.belongs_to :user,               index: true

      t.timestamps                      null: false
    end

    add_index :class_orgs, [:grade, :number], unique: true
    add_index :class_orgs, :number
  end
end
