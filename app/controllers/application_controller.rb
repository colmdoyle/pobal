class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_gettext_locale

  def default_url_options(_options={})
    { :locale => (I18n.locale == I18n.default_locale ? nil : I18n.locale) }
  end
end
