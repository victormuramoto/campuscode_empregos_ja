class Category < ActiveRecord::Base
  has_many :jobs
  # has_many :companies, through: :jobs
  # has_many :users, through: :companies
  validates :name, presence: true
end
