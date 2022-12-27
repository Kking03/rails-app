require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'If adding with similar params' do
    before do
      User.create!(email: "kirill@mail.ru", login: "Kking3", password: "12345678") if User.find_by(login: "Kking3").nil?
    end
    it 'should return error if value isn`t unique' do
      expect { User.create!(email: "kirill@mail.ru", login: "Kking3", password: "12345678") }.to raise_error(ActiveRecord::RecordInvalid)
    end

    context 'check existance' do
      it 'exists in database' do
        expect(User.find_by(login: "Kking3").nil?).to eq(false)
      end
    end

    
    context 'check removed record' do
      user = User.find_by(login: "Kking3")
      it 'removed from database' do
        expect(User.find_by(login: "Kking3").nil?).to eq(false)
      end
    end
  end
end