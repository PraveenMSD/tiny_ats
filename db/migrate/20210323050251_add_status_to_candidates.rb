class AddStatusToCandidates < ActiveRecord::Migration[6.1]
  def change
    add_column :candidates, :status, :string, default: "", null: false
    add_column :jobs, :employment_type, :string, default: "", null: false
    add_column :jobs, :joining_type, :string, default: "",  null: false
    add_column :jobs, :priority, :string, default: "",  null: false
  end
end
