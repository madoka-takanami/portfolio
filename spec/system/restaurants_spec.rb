require 'rails_helper'

RSpec.describe "Restaurants", type: :system do
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

      describe 'ログイン後' do

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
      end
    end
  end

end
