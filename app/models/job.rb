class Job < ActiveRecord::Base
  belongs_to :company
  validates :title,:location,:company,:category,:description, presence:true
end
