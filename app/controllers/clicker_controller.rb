class ClickerController < ApplicationController
  include ClickerHelper
  before_action :check_access

  def preview
  end

  def click
    @user = current_user
    player = @user.rating

    clicks = player.clicks + player.level

    if level_up?(player.clicks, player.level)
      player.update(
        level: player.level + 1
      )
    end

    player.update(
      clicks: clicks
    )
  end

  private

  def check_access
    unless current_user.present?
      flash[:alert] = t(:access_denied)
      redirect_to new_session_path
    end
  end

  # def show
    
  # end

end
