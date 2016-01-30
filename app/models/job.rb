class Job < ActiveRecord::Base
  DAYS_TO_BE_RECENT = 5.days
  DAYS_TO_BE_EXPIRED = 90.days

  belongs_to :company
  belongs_to :category
  belongs_to :contract

  validates :title,:location,:company,:category,:description,:contract, presence:true

  def recent?
     Time.zone.now <= (created_at + DAYS_TO_BE_RECENT)
  end

  def expired?
    DAYS_TO_BE_EXPIRED <= Time.zone.now - created_at
  end
end
