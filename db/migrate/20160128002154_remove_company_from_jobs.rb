class RemoveCompanyFromJobs < ActiveRecord::Migration
  def change
    remove_column :jobs, :company, :string
  end
end
