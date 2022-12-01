require 'rails_helper'

RSpec.describe "UserSessions", type: :system do
  let(:user) { create(:user) }

  describe 'ログインする' do
    context 'フォームの記入が正常' do
      it 'ログインできる' do
        visit login_path
        fill_in 'email', with: user.email
        fill_in 'password', with: user.password
        click_button 'ログイン'
        expect(current_page).to eq restaurants_path
      end
    end

    context 'emailが間違っている' do
      it 'ログインに失敗する' do
        visit login_path
        fill_in 'email', with: 'e'
        fill_in 'password', with: user.password
        click_button 'ログイン'
        expect(current_page).to eq login_path
      end
    end

    context 'emailが空欄' do
      it 'ログインに失敗する' do
        visit login_path
        fill_in 'email', with: ''
        fill_in 'password', with: user.password
        click_button 'ログイン'
        expect(current_page).to eq login_path
      end
    end

    context 'passwordが間違っている' do
      it 'ログインに失敗する'
        visit login_path
        fill_in 'email', with: user.email
        fill_in 'password', with: 'p'
        click_button 'ログイン'
        expect(current_page).to eq login_path
      end
    end

    context 'passwordが空欄' do
      it 'ログインに失敗する' do
        visit login_path
        fill_in 'email', with: user.email
        fill_in 'password', with: ''
        click_button 'ログイン'
        expect(current_page).to eq login_path
      end
    end

    describe 'ログイン後、ログアウトする' do
      context 'ログアウトボタンを押す' do
        it 'ログアウトできる'
        login_as(user)
        visit restaurant_path
        first(:link, 'delete').click
        expect(page).to have_content 'ログアウトしました'
        expect(current_page).to eq login_path
        # https://stackoverflow.com/questions/52257588/capybara-unable-to-find-font-awesome-icons
      end
    end
end
