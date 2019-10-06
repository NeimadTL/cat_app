require 'rails_helper'

RSpec.describe Collaboration, type: :model do

  it { should validate_presence_of :task_id }
  it { should validate_presence_of :user_id }
  it { should belong_to(:user) }
  
end
