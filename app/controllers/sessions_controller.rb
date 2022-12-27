class SessionsController < ApplicationController
  before_action :check_log_in, only: %i[new create]

  def new
  end

  def create
    user_params = params.require(:session)

    user = User.find_by(login: user_params[:login])&.authenticate(user_params[:password])

    if user.present?
      session[:user_id] = user.id
      redirect_to clicker_preview_path
    else
      flash[:alert] = 'Неправильный email или пароль'
      # render :new
      redirect_to new_session_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to new_session_path, notice: "Вы вышли из аккаунта"
  end

  private

  def check_log_in
    if current_user.present?
      redirect_to clicker_preview_path
    end
  end

end
