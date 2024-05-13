class Subscription < ApplicationRecord
  belongs_to :customer
  belongs_to :tea

  validates :title, presence: true
  validates :price, presence: true, numericality: true
  validates :frequency, presence: true
  validates :status, presence: true
  validates :tea_id, presence: true
  validates :customer_id, presence: true

  enum frequency: [:once_per_week, :once_per_month, :twice_per_month]
  enum status: [:active, :canceled]
end
