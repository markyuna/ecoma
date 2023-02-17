class Answer < ApplicationRecord
  belongs_to :question
  has_many :tasks, dependent: :destroy
  
  validates :content, presence: true
end
