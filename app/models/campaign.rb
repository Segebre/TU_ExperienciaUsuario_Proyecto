class Campaign < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :donations

  validates :title, :review, presence: true
  validates :review, length: { maximum: 140 }
  validates :goal, numericality: { greater_than: 0 }
  #validates :ended_at, numericality: { greater_than_or_equal_to: Time.now, less_than_or_equal_to: Time.now + 6.months }

  before_save :default_ended_at

  def self.categories
    ["Business", "Charity", "Education", "Emergencies", "Medical", "Other"]
  end

  protected
    def default_ended_at
      if self.ended_at.blank? || self.ended_at > Time.now + 6.months
        self.ended_at = Time.now + 6.months
      end
    end
end
