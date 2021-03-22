class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :commenter,          null: false, default: ""
      t.string :body,          null: false, default: ""
      t.references :candidate, null: false, foreign_key: true

      t.timestamps
    end
  end
end
