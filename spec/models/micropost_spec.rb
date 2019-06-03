require 'rails_helper'

RSpec.describe Micropost, type: :model do
  before do
    @user = create(:user)
  end
  
  it "has a valid factory" do
    micropost = build(:micropost)
    expect(micropost).to be_valid
  end
  
  it "is invalid a word's lengths 51" do
    micropost = @user.microposts.build(
      word: "a" * 51,
      comment: "good",
      )
    expect(micropost).to_not be_valid
  end
  
  it "micropost associates a user" do
    micropost = Micropost.create(
      word: "健康　習慣",
      comment: "やっぱり運動")
    expect(micropost).to_not be_valid
  end
  
  it "is invalid when word is nothing" do
    micropost = @user.microposts.build(
      word: "",
      comment: "空です。"
      )
      expect(micropost).to_not be_valid
  end
end
