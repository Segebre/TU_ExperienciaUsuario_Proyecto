class Comment < ApplicationRecord
  belongs_to :campaign

  validates :author, :message, presence: true
end
