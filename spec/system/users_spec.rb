require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe 'GET ' do
    context 'Should return' do
      before do
        User.create!(email: "kirill@mail.ru", login: "Kking2003", password: "12345678")
      end

      scenario 'success while registration' do
        visit new_user_path
        fill_in :user_login, with: 'Kking2003'
        fill_in :exampleInputEmail1, with: 'kirill@mail.ru'
        fill_in :user_password, with: '12345678'
        find('#sign-up-btn').click
        sleep(0.1)
        expect(current_path).to eq '/en/users/new'
      end

      scenario 'success while registration' do
        visit new_user_path
        fill_in :user_login, with: 'Keril03'
        fill_in :exampleInputEmail1, with: 'test_user@bmstu.ru'
        fill_in :user_password, with: '12345678'
        find('#sign-up-btn').click
        sleep(0.1)
        expect(current_path).to eq '/en/session/new'
      end

      scenario 'results after success login' do
        visit '/en/session/new'
        fill_in :session_login, with: 'Kking2003'
        fill_in :session_password, with: '12345678'
        find('#btn_input').click
        sleep(0.1)
        visit root_path
        expect(current_path).to eq '/en/clicker/preview'
      end
    end
  end
end