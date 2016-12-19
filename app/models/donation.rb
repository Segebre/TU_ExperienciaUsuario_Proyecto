class Donation < ApplicationRecord
  belongs_to :campaign

  validates :amount, numericality: { greater_than: 0 }
end
