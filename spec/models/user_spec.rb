RSpec.describe User, type: :model do

  it { should have_many(:tasks) }
  it { should have_many(:collaborations) }
  it { should have_many(:collaborators).through(:collaborations) }

end
