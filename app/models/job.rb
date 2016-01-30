class Job < ActiveRecord::Base
  DAYS_TO_BE_RECENT = 5.days.ago
  belongs_to :company
  belongs_to :category

  validates :title,:location,:company,:category,:description, presence:true

  def recent?
    DAYS_TO_BE_RECENT < created_at
  end

end
