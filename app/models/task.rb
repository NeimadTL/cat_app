class Task < ApplicationRecord

  validates :content, presence: true
  validates :label, presence: true
  
  belongs_to :user
end
