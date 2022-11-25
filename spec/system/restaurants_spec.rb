require 'rails_helper'

RSpec.describe "Restaurants", type: :system do
  let(:user) { create(:user) }
  let(:restaurant) { create(:restaurant) }

  describe 'ログイン前' do
    describe 'ページ遷移' do
      context '飲食店新規作成にアクセス' do
        it '飲食店新規作成ページへのアクセスが失敗する' do
        end
      end

      context '飲食店編集ページにアクセス' do
        it '飲食店編集ページへのアクセスが失敗する' do
        end
      end

      context 'みんなのリスト飲食店一覧ページにアクセス' do
        it 'みんなの飲食店一覧ページが表示される' do
        end
      end

      context 'マイリスト飲食店一覧ページにアクセス' do
        it 'マイリスト飲食店一覧ページへのアクセスが失敗する' do
        end
      end

      context '飲食店詳細ページにアクセス' do
        it '飲食店詳細ページが表示される' do
        end
      end
    end
  end

  describe 'ログイン後' do
    before { login_as(user) }

    describe '飲食店の新規作成' do
      context 'フォームの入力値が正常' do
        it '飲食店の新規作成ができる' do
          visit new_restaurant_path
          fill_in 'rst_name', with: 'restaurant'
          click_button '登録'
          expect(page).to have_content('登録しました')
          expect(Rstaurant.count).to eq 1
          expect(current_path).to eq '/restaurants'
      end
    end

      context 'フォームが未入力' do
        it '飲食店の新規作成が失敗する' do
          visit new_restaurant_path
          fill_in 'rst_name', with: ''
          click_button '登録'
          expect(page).to have_content('やり直してください')
          expect(Restaurant.count).to eq 1
          expect(current_path).to eq current_path
        end
      end
    end

    describe '飲食店の編集' do
      context 'フォームが正常' do
        it '飲食店の編集ができる' do
          visit
        end
      end

      context '店名が空欄の場合' do
        it '飲食店の編集に失敗する' do
        end
      end

      context '他人の飲食店を編集' do
        it '編集ページへのアクセスが失敗する' do
        end
      end
    end

    describe '飲食店の削除' do
      it '飲食店を削除できる' do
      end
    end
  end
end
