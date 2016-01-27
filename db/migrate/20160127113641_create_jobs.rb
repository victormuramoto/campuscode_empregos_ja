class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :location
      t.string :company
      t.string :category
      t.string :description

      t.timestamps null: false
    end
  end
end
