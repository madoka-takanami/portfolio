require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  describe 'Userモデルのバリデーション' do
    it 'name,email,passwordがある場合、ユーザー登録ができる' do
      user = build(:user)
    end

    it 'nameが空欄の場合、ユーザー登録ができない' do
      user_without_name = build(:user, name: "")
      expect(user_without_name).to be_invalid
      expect(user_without_name.errors[:name]).to eq ["を入力してください"]
    end

    it 'emailが空欄の場合、ユーザー登録ができない' do
      user_without_email = build(:user, email: "")
      expect(user_without_email).to be_invalid
      expect(user_without_email.errors[:email]).to eq ["を入力してください"]
    end

    it 'emailが重複している場合、ユーザー登録ができない' do
      user_with_duplicated_email = build(:user, email: user.email)
      expect(user_with_duplicated_email).to be_invalid
      expect(user_with_duplicated_email.errors[:email]).to eq ["はすでに存在します"]
    end

    it 'passwordが空欄の場合、ユーザー登録ができない' do
      user_without_password = build(:user, password: "")
      expect(user_without_password).to be_invalid
      expect(user_without_password.errors[:password]).to eq ["は3文字以上で入力してください"]
    end

    it 'passwordが3文字以下の場合、ユーザー登録ができない' do
      user_with_limited_password = build(:user, password: "aa")
      expect(user_with_limited_password).to be_invalid
      expect(user_with_limited_password.errors[:password]).to eq ["は3文字以上で入力してください"]
    end

    it 'notionが空欄の場合、ユーザー登録ができない' do
    end
  end
end
