class Task < ApplicationRecord
  belongs_to :answer
  belongs_to :user

  validates :content, :status, presence: true
end
