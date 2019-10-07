class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tasks
  has_many :collaborations
  has_many :collaborators, through: :collaborations, class_name: "User", source: :user

  def add_collaborator(user)
    puts "user --> #{user.inspect}"
    collaborators << user
  end
end
