class Task < ApplicationRecord
  belongs_to :answer

  validates :content, presence: true
end
