class Company < ApplicationRecord
  has_many :orders
  belongs_to :payment_method ,  foreign_key: "payment_method_id"


end
