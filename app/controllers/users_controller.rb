class UsersController < ApplicationController
  before_action :check_log_in, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:login, :email, :password)
    data = user_params.values
   
    if data[0].empty? || data[1].empty? || data[2].empty?
      flash[:alert] = 'Нельзя оставлять поля пустыми'
      redirect_to new_user_path
    elsif User.find_by(login: user_params[:login]).present?
      flash[:alert] = 'Логин уже используется'
      redirect_to new_user_path
    elsif User.find_by(email: user_params[:email]).present?
      flash[:alert] = 'Email уже используется'
      redirect_to new_user_path
    else
      new_user = User.create(user_params)
      Rating.create(
        clicks: 0,
        level: 1,
        user_id: new_user[:id]
      )
      flash[:notice] = 'Вы успешно зарегистрировались! Можете войти'
      redirect_to new_session_path
    end 

  end

  private

  def check_log_in
    if current_user.present?
      redirect_to clicker_preview_path
    end
  end

end
