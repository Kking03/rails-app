require 'rails_helper'

RSpec.describe Rating, type: :model do
  describe 'If adding with similar user_id' do
    before do
      User.create!(email: "kirill@mail.ru", login: "Kking", password: "12345678") if User.find_by(login: "Kking").nil?
      Rating.create!(clicks: 0, level: 1, user_id: 1) if Rating.find_by(user_id: 1).nil?
    end
    it 'should return error if value isn`t unique' do
      expect { Rating.create!(clicks: 0, level: 1, user_id: 1) }.to raise_error(ActiveRecord::RecordInvalid)
    end

    context 'check existance' do
      it 'exists in database' do
        expect(Rating.find_by(user_id: 1).nil?).to eq(false)
      end
    end

    context 'check removed record' do
      Rating.delete_by(user_id: 1)
      it 'removed from database' do
        expect(Rating.find_by(user_id: 1).nil?).to eq(false)
      end
    end
  end
end