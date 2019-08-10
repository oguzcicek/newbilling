class Order < ApplicationRecord
  validates :company_id, presence: true
  validates :quantity, presence: true

  belongs_to :company

  scope :from_this_month , -> { where("created_at > ? AND created_at < ?", Time.now.beginning_of_month, Time.now.end_of_month)}

end
