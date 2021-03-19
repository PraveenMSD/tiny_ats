class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :title,            null: false, default: ""
      t.string :openings,         null: false, default: ""
      t.string :applied,          null: false, default: ""
      t.string :rejected,         null: false, default: ""
      t.string :remaining,        null: false, default: ""
      t.string :experience,       null: false, default: ""
      t.string :selected,         null: false, default: ""
      t.string :in_progress,      null: false, default: ""

      t.references :user,      null: false, foreign_key: true

      t.timestamps
    end
  end
end
