class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include SessionHelper
    before_action :set_locale
     private
     def set_locale
       I18n.locale = params[:locale] || session[:locale]|| I18n.default_locale
       session[:locale]=I18n.locale
     end
    
    private
     def default_url_options
           { locale: I18n.locale }
     end
end
