class Task < ApplicationRecord

  validates :content, presence: true
  validates :label, presence: true

  belongs_to :user
  has_many :collaborations
  has_many :collaborators, through: :collaborations, class_name: "User", source: :user
end
