class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tasks

  # Select *
  # from collaborations c, task t
  # where c.task_id == t.task_id
  #   and u.user_id == self.user_id
  has_many :collaborations, -> {joins(:task).where("tasks.user_id = ?", self.id)}
  has_many :collaborators, through: :collaborations, class_name: "User", source: :user

  def add_collaborator(user)
    puts "user --> #{user.inspect}"
    collaborators << user
  end
end
