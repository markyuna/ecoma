class Question < ApplicationRecord
  belongs_to :user
  has_one :answer

  validates :content, presence: true
end
