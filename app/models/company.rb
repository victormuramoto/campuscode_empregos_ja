class Company < ActiveRecord::Base
  has_many :jobs
  validates :name,:location,:email,:phone, presence:true
end
