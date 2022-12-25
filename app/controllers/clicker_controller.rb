class ClickerController < ApplicationController
  def preview
  end

  def click
    @user = current_user
    user = @user.rating

    @clicks = user.clicks + 1
    user.update(
      clicks: @clicks
    )
  end

  def show
    
  end

end
