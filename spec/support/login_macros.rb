module LoginMacros
  def login_as(user)
    visit login_path
    fill_in 'emai', with: user.email
    fill_in 'password', with: 'password'
    click_button 'ログイン'
  end
end