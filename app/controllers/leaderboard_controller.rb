class LeaderboardController < ApplicationController
  def show
    @scores = Rating.all
  end

  def update
    @user = current_user
    user = @user.rating

    user.update(
      clicks: 0,
      level: 1
    )
    redirect_to leaderboard_show_path
  end
end
