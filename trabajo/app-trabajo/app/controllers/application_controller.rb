class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception  
  # para que si no hay nadie logueado te lleve al login
  before_action :authenticate_user!
end
