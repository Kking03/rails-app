class SessionsController < ApplicationController
  def new
  end

  def create
    user_params = params.require(:session)

    user = User.find_by(login: user_params[:login])&.authenticate(user_params[:password])

    if user.present?
      session[:user_id] = user.id
      redirect_to clicker_preview_path
    else
      flash.now[:alert] = 'Неправильный email или пароль'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to new_user_path, notice: "Вы вышли из аккаунта"
  end
end
