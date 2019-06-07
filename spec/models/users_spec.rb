require 'rails_helper'

RSpec.describe Users, type: :model do
  it { should validate_presense_of(:username) }
  it { should validate_presense_of(:password) }

  #Association
  it { should have_many(:goals) }
  it { should have_many(:friends) }
  
  #find_by_credentials
  describe "::find_by_credentials " do
    it "given password and username it returns User Object" do
      exepect(User.find_by_credentials('johndoe','password')).to eq User.first
    end
  
  end






end
