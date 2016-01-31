class Company < ActiveRecord::Base
  has_many :jobs
  belongs_to :user
  validates :name,:location,:email,:phone, presence:true

  def premium?
    jobs.count >= 5
  end
end
