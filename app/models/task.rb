class Task < ApplicationRecord
  belongs_to :answer
  belongs_to :user

  after_create :strip_numbers

  def strip_numbers
    self.content = self.content.gsub(/^\d[\)-\. ]-?/, "").strip.capitalize
    self.save
  end
end
