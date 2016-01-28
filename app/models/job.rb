class Job < ActiveRecord::Base
  belongs_to :company
  belongs_to :category
  validates :title,:location,:company,:category,:description, presence:true
end
