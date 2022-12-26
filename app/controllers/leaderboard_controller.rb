class LeaderboardController < ApplicationController
  def show
    users = User.all
    @players = []
    flag = false
    users.each do |user|
      flag = true if  current_user.present? && current_user[:id] == user.id
      @players.push([user.login, user.rating.clicks, flag])
      flag = false
    end
    @players.sort_by! { |login, score| score }.reverse!
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
