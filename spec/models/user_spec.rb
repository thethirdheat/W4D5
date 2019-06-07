require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  #Association
  it { should have_many(:goals) }
  it { should have_many(:friends) }
  
  #find_by_credentials
  describe "::find_by_credentials " do
    it "given password and username it returns User Object" do
      expect(User.find_by_credentials('johndoe','password')).to be User.first
    end
  
  end






end
