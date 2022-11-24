require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  let(:restaurant) { create(:restaurant) }

  describe 'restaurantのバリデーション' do
    it "rst_nameがある場合、飲食店メモを作成できる" do
      restaurant = build(:restaurant)
    end

    it "rst_nameが空欄の場合、登録ができない" do
      restaurant_without_rst_name = build(:restaurant, rst_name: "")
      expect(restaurant_without_rst_name).to_not be_valid
      expect(restaurant_without_rst_name.errors[:rst_name]).to eq ["を入力してください"]
    end
  end
end
