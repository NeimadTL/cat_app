require 'rails_helper'

RSpec.describe Task, type: :model do

  it { should validate_presence_of :content }
  it { should validate_presence_of :label }
  it { should belong_to(:user) }
  it { should have_many(:collaborations) }
  it { should have_many(:collaborators).through(:collaborations) }

end
