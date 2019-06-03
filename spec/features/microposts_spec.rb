require 'rails_helper'

RSpec.feature "Microposts", type: :feature do
  scenario "user creates a new micropost" do
    user = create(:user)
    
    visit root_path
    click_link "ログイン"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    click_link "私のGoogle先生"
    
    expect {
      fill_in "検索ワード", with: "海鮮"
      fill_in "一言コメント", with: "おすすめです。"
      click_button "Post"
      expect(page).to have_content "投稿しました。"
    }.to change(user.microposts, :count).by(1)
  end
  
  scenario "user creates new account" do
    visit root_path
    click_link '新規登録'
    fill_in "ユーザー名", with: "ユーザー1"
    fill_in "メールアドレス", with: "user1@example.com"
    fill_in "パスワード", with: "aiueo"
    fill_in "パスワード確認", with: "aiueo"
    click_button "Sign up"
    
    expect(page).to have_content "ユーザを登録しました。"
  end
end
