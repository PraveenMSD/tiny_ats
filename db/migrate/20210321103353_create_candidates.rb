class CreateCandidates < ActiveRecord::Migration[6.1]
  def change
    create_table :candidates do |t|
      t.string :name,            null: false, default: ""
      t.string :phone,           null: false, default: ""
      t.string :email,           null: false, default: ""
      t.string :skill,           null: false, default: ""
      t.string :work_experience, null: false, default: ""
      t.string :ctc,             null: false, default: ""
      t.string :notice_period,   null: false, default: ""
      t.references :job, null: false, foreign_key: true

      t.timestamps
    end
  end
end
