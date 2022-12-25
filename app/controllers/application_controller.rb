class ApplicationController < ActionController::Base
  before_action :set_locale
  helper_method :current_user
  private
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def set_locale
    I18n.locale = extract_locale || I18n.default_locale
  end

  def extract_locale
    parsed_locale = params[:locale]
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ?
      parsed_locale.to_sym :
      nil
  end

end
