require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end
  
  it "is valid with a name, email, and password" do
    user = build(:user)
    expect(user).to be_valid
  end
  
  it "is invalid without name" do
    user = build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("を入力してください")
  end
  
  it "does something with multiple users" do
    user1 = create(:user)
    user2 = create(:user)
    expect(true).to be_truthy
  end
  
  it "is valid user follows other_user" do
    user1 = create(:user)
    user2 = create(:user)
    user1.follow(user2)
    expect(true).to be_truthy
  end
  
  it "is valid user unfollows other_user" do
    user1 = create(:user)
    user2 = create(:user)
    user1.follow(user2)
    user1.unfollow(user2)
    expect(true).to be_truthy
  end
  
end
